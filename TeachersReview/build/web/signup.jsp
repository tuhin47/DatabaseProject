<%-- 
    Document   : studentsignup
    Created on : Nov 18, 2016, 9:55:02 AM
    Author     : TUHIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="scss.css">
        <title>Sign Up</title>

        <!--http://localhost:8084/TeachersReview/FirstServlet?tag=register&device=PC&username=tuhin&password=fasf&dept=fsdf&email=tuhintowhidul9%40gmail.com&userType=student-->
    </head>
    <body>
        <div class='login'>
            <h2>Register</h2>
            <% String message = null;
                message = (String) request.getAttribute("alertMsg");
                if (message != null) {%>
            <div class="alert alert-danger" role="alert">
                Username already exist 
            </div> <%}%> 
            <form  action="FirstServlet" method="POST">
                <input type="hidden" name="tag" value="register"> 
                <input type="hidden" name="device" value="PC"> 
                <input required  name='username' placeholder='Username' type='text'>
                <input required id='pw' name='password' placeholder='Password' type='password'>
                <input required name='dept' placeholder='Department' type='text'>
                <input required name='email' placeholder='E-Mail Address' type='text'>
                <div class='agree'>
                    <div class="col-sm-offset-2 col-md-6">
                        <input type="radio" name="userType" value="teacher"  checked> Teacher
                        <input type="radio" name="userType" value="student"   > Student
                    </div>

                </div>
                <div class='agree'>
                    <input id='agree' name='agree' type='checkbox'>
                    <label for='agree'></label>Accept rules and conditions
                </div>
                <input class='animated' type='submit' value='Register'>
            </form>



            <a class='forgot' href='#'>Already have an account?</a>
        </div>
    </body>
</html>

