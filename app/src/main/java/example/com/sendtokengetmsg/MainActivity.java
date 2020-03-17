package example.com.sendtokengetmsg;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class MainActivity extends AppCompatActivity {
    String token;
    Button btnSendToken,btnSendNotify;
    EditText etId,etImgUrl,etMsg,etPid;
    String app_getNoti_server_url = "http://192.168.64.2/backend/servicefrommobile.php";
    //String app_saveData_server_url = "http://192.168.64.2/backend/fcm_insert.php";

    StringRequest stringRequest,stringRequest1;
    RequestQueue requestQueue,requestQueue1;

    //Google location
    FusedLocationProviderClient client;
    Geocoder geocoder;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        initView();
        requestPermissionGooglemap();
        //sendNoti();
        insertData();
    }

    private void insertData() {
        btnSendToken.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                SharedPreferences sharedPref = MainActivity.this.getSharedPreferences(Constance.MY_PREFS, Context.MODE_PRIVATE);
                token = sharedPref.getString(Constance.TOKEN, "");

                Log.d("token", "MainAc " + token);

                stringRequest = new StringRequest(Request.Method.POST, app_getNoti_server_url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(MainActivity.this, "insert complete ..." + response, Toast.LENGTH_LONG).show();

                                etMsg.getText().clear();
                                //etImgUrl.getText().clear();
                                etPid.getText().clear();
                            }
                        }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        //Toast.makeText(MainActivity.this, "insert error ..." + error, Toast.LENGTH_LONG).show();
                        Toast.makeText(MainActivity.this, "insert error ...please value is emtry", Toast.LENGTH_LONG).show();
                    }
                }) {
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {

                        Map<String, String> params = new HashMap<String, String>();
                        if (etMsg.getText().toString().isEmpty() && etImgUrl.getText().toString().isEmpty()) {
                            Toast.makeText(MainActivity.this,"Please insert value ",Toast.LENGTH_LONG).show();
                        } else {
                            params.put("fcm_token", token);
                            params.put("fcm_msg", etMsg.getText().toString());
                            //params.put("fcm_imgurl", etImgUrl.getText().toString());
                            params.put("fcm_id", etPid.getText().toString());
                        }
                        return params;
                    }
                };
                // Creating RequestQueue.
                requestQueue = Volley.newRequestQueue(MainActivity.this);
                // Adding the StringRequest object into requestQueue.
                requestQueue.add(stringRequest);

                // add lat long
                getLocationAddress();
            }


        });
    }

    /*private void sendNoti() {
        btnSendNotify.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

               stringRequest1 = new StringRequest(Request.Method.POST, app_getNoti_server_url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(MainActivity.this, "insert complete ..." + response, Toast.LENGTH_LONG).show();
                                //etTitle.getText().clear();
                                etId.getText().clear();
                            }
                        }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        //Toast.makeText(MainActivity.this, "insert error ..." + error, Toast.LENGTH_LONG).show();
                        Toast.makeText(MainActivity.this, "insert error ...please value is emtry", Toast.LENGTH_LONG).show();
                    }
                }) {
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {

                        Map<String, String> params = new HashMap<String, String>();
                        if (etId.getText().toString().isEmpty()) {
                            Toast.makeText(MainActivity.this,"Please insert value ",Toast.LENGTH_LONG).show();
                        } else {
                            //params.put("fcm_token", token);
                            //params.put("title", etTitle.getText().toString());
                            params.put("id", etId.getText().toString());
                        }
                        return params;
                    }
                };
                // Creating RequestQueue.
                requestQueue1 = Volley.newRequestQueue(MainActivity.this);

                // Adding the StringRequest object into requestQueue.
                requestQueue1.add(stringRequest1);
            }
        });
    }*/

    private void initView() {
        btnSendNotify = findViewById(R.id.btnSendNotify);
        btnSendToken = findViewById(R.id.btnSendToken);

        etId = findViewById(R.id.etId);
        //etImgUrl = findViewById(R.id.etImgUrl);
        etMsg = findViewById(R.id.etMsg);
        etPid = findViewById(R.id.etPid);
    }

    private void getLocationAddress() {
        client = LocationServices.getFusedLocationProviderClient(this);
        client.getLastLocation().addOnSuccessListener(MainActivity.this, new OnSuccessListener<Location>() {
            @Override
            public void onSuccess(Location location) {

                if (location != null) {
                    Toast.makeText(getApplicationContext(),"LON "+location.getLatitude(),Toast.LENGTH_SHORT).show();
                }

                // getAddress
                addAddress(location);
            }
        });
    }

    private void addAddress(Location location) {
        List<Address> addresses;
        geocoder = new Geocoder(MainActivity.this, Locale.getDefault());

        // Sep Address
        try {
            addresses = geocoder.getFromLocation(location.getLatitude(), location.getLongitude(), 1);

            String address = addresses.get(0).getAddressLine(0); // If any additional address line present than only, check with max available address lines by getMaxAddressLineIndex()
            String city = addresses.get(0).getLocality();
            //String state = addresses.get(0).getAdminArea();
            String tambon = addresses.get(0).getSubLocality();
            String country = addresses.get(0).getCountryName();
            String postalCode = addresses.get(0).getPostalCode();
            String knownName = addresses.get(0).getFeatureName();
            String amphoe = addresses.get(0).getSubAdminArea();

            Log.d("check","latitude  => "+location.getLatitude());
            Log.d("check","longtitude  => "+location.getLongitude());
            Log.d("check","address  => "+address);
            Log.d("check","knownName => "+knownName);
            Log.d("check","tambon => "+tambon);
            Log.d("check","amphoe => "+amphoe);
            Log.d("check","postalCode => "+postalCode);
            Log.d("check","city => "+city);
            Log.d("check","country => "+country);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // request permission google map
    private void requestPermissionGooglemap() {
        ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.ACCESS_COARSE_LOCATION, Manifest.permission.ACCESS_FINE_LOCATION}, 1);
    }

}
