<%-- 
    Document   : test
    Created on : Nov 19, 2016, 8:59:59 PM
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
        <!--<link rel="stylesheet" href="bootstrap.min.css">-->

        <title>Login</title>


    </head>
    <body>

        <% String message = null;
            message = (String) request.getAttribute("alertMsg");%>

        <div class='login'>      
            <h2>Login</h2>


            <form action="FirstServlet" method="POST">
                <%if (message!=null && message.equals("login failed")) {%>
                <div class="alert alert-danger" role="alert">
                    <strong>Incorrect!!</strong> Username or Password 
                </div> <%}%>
                <input type="hidden" name="tag" value="login"> 
                <input type="hidden" name="device" value="PC"> 
                <input required name='username' placeholder='Username' type='text'>
                <input required id='pw' name='password' placeholder='Password' type='password'>
                <!--<input name='email' placeholder='E-Mail Address' type='text'>-->
                <div class='agree'>
                    <div class="col-sm-offset-2 col-md-6">
                        <input type="radio" name="userType" value="teacher"   checked> Teacher
                        <input type="radio" name="userType" value="student"   > Student
                    </div>
                    <!--                <input id='agree' name='agree' type='checkbox'>
                                    <label for='agree'></label>Accept rules and conditions-->
                </div>
                <input id="signin" class='animated' type='submit' value='Sign-In'>
            </form>

            <form action="signup.jsp">
                <input id="signup" class='animated' type='submit' value='Create an account'>
            </form>



            <a class='forgot' href='sendmail.jsp'>Forget password?</a>


        </div>
    </body>
</html>
