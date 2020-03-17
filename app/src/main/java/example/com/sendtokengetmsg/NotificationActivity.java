package example.com.sendtokengetmsg;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.location.Geocoder;
import android.location.Location;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnSuccessListener;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class NotificationActivity extends AppCompatActivity {

    TextView textView;
    ImageView imageView;


    //google location
    FusedLocationProviderClient client;
    Geocoder geocoder;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_notification);

        textView = findViewById(R.id.textView);
        imageView = findViewById(R.id.imageView);
        onNewIntent(getIntent());
        // get latutude+longtitude from start this activity
        getLocationAddress();
    }

    @Override
    protected void onNewIntent (Intent intent) {
        super .onNewIntent(intent) ;
        Bundle extras = intent.getExtras() ;
        if (extras != null ) {
            if (extras.containsKey( "NotificationMessage" )) {
                String msg = extras.getString( "NotificationMessage" ) ;

                // เอาไว้ลองใหม่ @@@@@@@
                //Uri myUri = Uri.parse(extras.getString("imageUri"));

                textView.setText(msg);

                // เอาไว้ลองใหม่ @@@@@@@
                //imageView.setImageURI(myUri);

                Log.d("checkintent","INTENT=> "+msg);
            }
        }
    }

    // เอาไว้ลองใหม่ @@@@@@@
    private Bitmap getBitmapfromUrl(String image) {

        try {
            URL url = new URL(image);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoInput(true);
            connection.connect();
            InputStream input = connection.getInputStream();
            Bitmap bitmap = BitmapFactory.decodeStream(input);
            return bitmap;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }

    private void getLocationAddress() {
        client = LocationServices.getFusedLocationProviderClient(this);
        client.getLastLocation().addOnSuccessListener(NotificationActivity.this, new OnSuccessListener<Location>() {
            @Override
            public void onSuccess(Location location) {

                if (location != null) {
                    Toast.makeText(getApplicationContext(),"LON "+location.getLatitude(),Toast.LENGTH_SHORT).show();
                    Log.d("location","LOCATION1 => "+location.getLatitude());
                }

                // getAddress
                //addAddress(location);
            }
        });
    }
}
