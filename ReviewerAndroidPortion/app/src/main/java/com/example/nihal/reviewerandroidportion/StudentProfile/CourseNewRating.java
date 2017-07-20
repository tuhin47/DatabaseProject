package com.example.nihal.reviewerandroidportion.StudentProfile;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.nihal.reviewerandroidportion.R;

public class CourseNewRating extends AppCompatActivity implements Response.ErrorListener, Response.Listener<String> {

    private static final int REQUEST_EMAIL_VALIDATION = 1212;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_course_new_rating);
    }

    public void submissionfrom(View view) {

        //HttpRequest request = new HttpRequest("http://10.100.4.221:8084/DataBase-Hibernate/ReviewServlet?tag=review&courseCode=cse3331&userName=a&semester=3-1&q1=1&q2=2&q3=4&device=android",REQUEST_EMAIL_VALIDATION,CourseNewRating.this);
        //request.execute("post");
        //Toast.makeText(CourseNewRating.this, "wait...., thank you.", Toast.LENGTH_SHORT).show();
       //HttpRequest request = new HttpRequest("http://10.100.4.221:8084/DataBase-Hibernate/ReviewServlet?tag=review&courseCode=cse3331&userName=a&semester=3-1&q1=1&q2=2&q3=4&device=android", REQUEST_EMAIL_VALIDATION, CourseNewRating.this);
       // request.execute("post");
        String url = "http://10.100.4.221:8084/DataBase-Hibernate/ReviewServlet?tag=review&courseCode=cse3331&userName=a&semester=3-1&q1=1&q2=2&q3=4&device=android";
        StringRequest stringRequest = new StringRequest(Request.Method.POST, url, this, this){

            /*
         //for form data sending//
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String>  params = new HashMap<String, String>();
                params.put("domain",article.getDomain());
                params.put("apiKey",article.getApiKey());
                params.put("userType", article.getUserType());
                params.put("isStory","0");
                params.put("limit","4");
                return params();
            }*/
        };

        RequestQueue queue = Volley.newRequestQueue(getApplicationContext());//problem//
        queue.add(stringRequest);
        Toast.makeText(CourseNewRating.this," req send wait",Toast.LENGTH_LONG).show();
        Log.i("request",stringRequest.toString());

    }


   /* @Override
    public void respond(String jsonRespond, int respondId, HttpRequest parent) {
        Toast.makeText(CourseNewRating.this,"Request Recieve"+jsonRespond,Toast.LENGTH_LONG).show();
    }

    @Override
    public void errorRespond(VolleyError e, int respondId, HttpRequest parent) {
        Toast.makeText(CourseNewRating.this,"no req",Toast.LENGTH_LONG).show();
    }

    @Override
    public Context getContext() {
        return null;
    }
*/
    @Override
    public void onErrorResponse(VolleyError error) {
        Toast.makeText(CourseNewRating.this,"no req",Toast.LENGTH_LONG).show();
    }

    @Override
    public void onResponse(String response) {
        Toast.makeText(CourseNewRating.this,"Request Recieve"+response,Toast.LENGTH_LONG).show();
    }
}
