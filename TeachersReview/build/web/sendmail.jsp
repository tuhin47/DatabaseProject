
<%@page import="mail.SendMail" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Sofia' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="scss.css">
        <!--<link rel="stylesheet" href="bootstrap.min.css">-->

        <title>Forget Password</title>


    </head>
    <body>

        <div class='login'>      
            <h2>Forget Password</h2>

            <% String message = (String) request.getAttribute("alertMsg");%>
            <form action="FirstServlet" method="POST">
                <%if (message != null) {
                        if (message.equals("failed")) {%>
                <div class="alert alert-danger" role="alert">
                    <strong>Incorrect!!</strong> Username or Email don't Exist
                </div> <%} else if (message.equals("successful")) {%>
                <div class="alert alert-danger" role="alert">
                    <strong>Successfully Sent!!</strong>
                </div> 
                <%}
                    }%>
                <input type="hidden" name="tag" value="sendmail"> 
                <input type="hidden" name="device" value="PC"> 
                <input required name='email' placeholder='Username OR Email' type='text'>
                <!--<input required id='pw' name='password' placeholder='Password' type='password'>-->
                <!--<input name='email' placeholder='E-Mail Address' type='text'>-->
                <div class='agree'>
                    <div class="col-sm-offset-2 col-md-6">
                        <input type="radio" name="userType" value="teacher"   checked> Teacher
                        <input type="radio" name="userType" value="student"   > Student
                    </div>
                    <!--                <input id='agree' name='agree' type='checkbox'>
                                    <label for='agree'></label>Accept rules and conditions-->
                </div>
                <input class='animated' type='submit' value='Submit'>
            </form>

        </div>
    </body>
</html>
