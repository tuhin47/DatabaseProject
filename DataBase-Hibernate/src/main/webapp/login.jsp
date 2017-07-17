<%-- 
    Document   : login
    Created on : Feb 5, 2017, 4:17:46 AM
    Author     : TUHIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Login</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>

        <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->

        <%
            session.invalidate();
            String message = null;
            message = (String) request.getAttribute("alertMsg");%>
        <div id="login-page">
            <div class="container">

                <form class="form-login" action="LoginServlet" method="POST">
                    <h2 class="form-login-heading">sign in now</h2>
                    <%if (message != null) {
                            if (message.equals("Login Failed")) { %>
                    <div class="alert alert-danger" role="alert">
                        <strong>Incorrect!!</strong> Username or Password 
                    </div> <%} else if (message.equals("Register Failed")) {%>
                    <div class="alert alert-danger" role="alert">
                        <strong>Register Failed!!</strong> Username or Email already exists.
                    </div> <%} else if (message.equals("Register Successful")) {%> 
                    <div class="alert alert-success" role="alert">
                        <strong>Register Successful!!</strong> Please Login...
                    </div> 
                    <%}
                        }%>

                    <div class="login-wrap">
                        <input type="hidden" name="tag" value="login"> 
                        <input type="hidden" name="device" value="PC"> 

                        <input required name='userName' type="text" class="form-control" placeholder="username" autofocus>
                        <br>
                        <input required name='password' type="password" class="form-control" placeholder="Password">
                        <br>
                        <input type="radio" name="userType" value="teacher"   checked> Teacher
                        <input type="radio" name="userType" value="student"   > Student

                        <label class="checkbox">
                            <span class="pull-right">
                                <a data-toggle="modal" href="login.html#myModal"> Forgot Password?</a>

                            </span>
                        </label>
                        <button class="btn btn-theme btn-block" type="submit">
                            <i class="fa fa-lock"></i> SIGN IN</button>
                        <hr>

                        <div class="login-social-link centered">
                            <p> you can visit our social page</p>
                            
                            <a class="" href="http://www.facebook.com">
                                <div class="btn btn-facebook" type="submit"><i class="fa fa-facebook"></i> Facebook</div>
                            </a>
                        </div>
                        <div class="registration">
                            Don't have an account yet?<br/>
                            <a class="" href="register.jsp">
                                Create an account
                            </a>
                        </div>

                    </div>
                </form>	

                <!-- Modal -->

                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title">Forgot Password ?</h4>
                            </div>
                            <form action="LoginServlet" method="POST">
                                <div class="modal-body">
                                    <p>Enter your gmail or Username address below to reset your password.</p>
                                    <input required type="text" name="email" placeholder="Email" class="form-control placeholder-no-fix">
                                    <!--<input required name='email' placeholder='Username OR Email' type='text'>-->
                                    <input type="hidden" name="tag" value="sendmail"> 
                                    <input type="hidden" name="device" value="PC"> 

                                </div>
                                <div class="modal-footer">
                                    <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                                    <button  class="btn btn-theme" type="submit">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- modal -->



            </div>
        </div>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>

        <!--BACKSTRETCH-->
        <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
        <script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
        <script>
            $.backstretch("assets/img/login-bg.jpg", {speed: 500});
        </script>


    </body>
</html>

