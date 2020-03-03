package example.com.sendtokengetmsg;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
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

import java.util.HashMap;
import java.util.Map;

public class MainActivity extends AppCompatActivity {

    Button btnSendToken;
    EditText etMsg;
    String token;
    //String app_server_url = "http://10.0.2.2/fcm/fcm_insert.php";
    String app_server_url = "http://192.168.64.2/gettokentosendmsg/fcm_insert.php";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnSendToken = findViewById(R.id.btnSendToken);
        etMsg = findViewById(R.id.etMsg);

        btnSendToken.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                /*SharedPreferences sharedPreferences = getApplicationContext().getSharedPreferences(getString(R.string.FCM_PREF), Context.MODE_PRIVATE);
                final String token = sharedPreferences.getString(getString(R.string.FCM_TOKEN), "");*/

                SharedPreferences sharedPref = MainActivity.this.getSharedPreferences(Constance.MY_PREFS, Context.MODE_PRIVATE);
                token = sharedPref.getString(Constance.TOKEN, "");

                Log.d("token","MainAc "+token);

                StringRequest stringRequest = new StringRequest(Request.Method.POST, app_server_url,
                        new Response.Listener<String>() {
                            @Override
                            public void onResponse(String response) {
                                Toast.makeText(MainActivity.this, "insert complete ..." + response, Toast.LENGTH_LONG).show();

                            }
                        }, new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                    }
                }) {
                    @Override
                    protected Map<String, String> getParams() throws AuthFailureError {

                        Map<String, String> params = new HashMap<String, String>();
                        //params.put("fcm_token",token);

                        if (token.isEmpty()) {
                            params.put("fcm_token", "Null is token");
                        } else {
                            params.put("fcm_token", token);
                            params.put("fcm_msg", etMsg.getText().toString());
                        }
                        //params.put("fcm_token", token);
                        //params.put("fcm_token", "Null token");

                        return params;
                    }
                };

                //MySingleton.getInstance(MainActivity.this).addToRequestQueue(stringRequest);

                // Creating RequestQueue.
                RequestQueue requestQueue = Volley.newRequestQueue(MainActivity.this);

                // Adding the StringRequest object into requestQueue.
                requestQueue.add(stringRequest);
            }
        });
    }
}
