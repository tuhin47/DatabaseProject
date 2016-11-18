<%-- 
    Document   : index.jsp
    Created on : Nov 17, 2016, 4:19:04 AM
    Author     : TUHIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review</title>
        <link rel="stylesheet" href="bootstrap.min.css">
    </head>
    <body>

        <div class="container">
            <h2> Login</h2>



            <form class="form-horizontal" action="FirstServlet" method="POST">
                <input type="hidden" name="tag" value="login"> 
                <input type="hidden" name="device" value="PC"> 


                <div class="form-group">
                    <label class="control-label col-md-2" for="username">Username:</label>
                    <div class="col-md-6">
                        <input required name="username" type="text" placeholder="Enter your user Name" class="form-control">
                    </div>

                </div>





                <div class="form-group">
                    <label class="control-label col-md-2" for="password">Password:</label>
                    <div class="col-md-6">
                        <input  required name="password" type="password" placeholder="******" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-md-6">
                        <input type="radio" name="userType" value="teacher"   checked> Teacher
                        <input type="radio" name="userType" value="student"   > Student
                    </div>

                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-md-6">
                        <button type="submit" class="btn btn-primary">
                            Submit
                        </button>

                    </div>

                </div>

            </form>
        </div>

        <!--        <form  action="FirstServlet" method="POST">
                    <input type="hidden" name="tag" value="login"> 
                    Username:<input name="user" type="text" required>
                    <br>
                    Password:<input name="password" type="password" required>
                    <br>
                    <input type="radio" name="userType" value="teacher" checked> Teacher
                    <input type="radio" name="userType" value="student"> Student<br>
                    <input type="submit" value="Login">
                </form>-->


    </body>
</html>
