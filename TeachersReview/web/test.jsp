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
        <title>JSP Page</title>
        
        
    </head>
    <body>
        <div class='login'>
            <h2>Register</h2>
            <input name='username' placeholder='Username' type='text'>
            <input id='pw' name='password' placeholder='Password' type='password'>
            <input name='email' placeholder='E-Mail Address' type='text'>
            <div class='agree'>
                <input id='agree' name='agree' type='checkbox'>
                <label for='agree'></label>Accept rules and conditions
            </div>
            <input class='animated' type='submit' value='Register'>
            <a class='forgot' href='#'>Already have an account?</a>
        </div>
    </body>
</html>

