<%-- 
    Document   : cse
    Created on : Feb 6, 2017, 12:50:20 AM
    Author     : TUHIN
--%>

<%@page import="org.tuhin.controller.BasicControl"%>
<%@page import="org.tuhin.dto.UserDetails"%>
<%@page import="org.tuhin.controller.LoginService"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword"
              content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Department</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css"
              href="assets/js/gritter/css/jquery.gritter.css" />

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
        

        <section id="container">
            <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
            <!--header start-->
            <header class="header black-bg">
                <div class="sidebar-toggle-box">
                    <div class="fa fa-bars tooltips" data-placement="right"
                         data-original-title="Toggle Navigation"></div>
                </div>
                <!--logo start-->
                <a href="main.jsp" class="logo"><b>Teacher Review</b></a>
                <!--logo end-->
                <div class="nav notify-row" id="top_menu">
                    <!--  notification start -->
                    <ul class="nav top-menu">


                    </ul>
                    <!--  notification end -->
                </div>
                <div class="top-menu">
                    <ul class="nav pull-right top-menu">
                        <li><a class="logout" href="login.jsp">Logout</a></li>
                    </ul>
                </div>
            </header>
            <!--header end-->

            <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse ">
                    <!-- sidebar menu start-->
                    <ul class="sidebar-menu" id="nav-accordion">

                        <p class="centered">
                            <a href="main.jsp"><img src="assets/img/ui-sam.jpg"
                                                    class="img-circle" width="60"></a>
                        </p>



                        <%
                            String userName = null;
                            if (BasicControl.isTheParameterValid(request, "userName")) {
                                userName = (String) request.getParameter("userName");
                            }
                            HttpSession firstSession = request.getSession();
                            if (userName != null && userName != "") {
                                firstSession.setAttribute("savedUserName", userName);

                            }
                            if (BasicControl.isTheParameterValid(request, "userName")) {
                                userName = (String) request.getParameter("userName");
                            }

                            userName = (String) firstSession.getAttribute("savedUserName");
                            if (userName == null) {
                                request.setAttribute("alertMsg", "login again");
                                request.getRequestDispatcher("login.jsp").forward(request, response);
                            }
                            UserDetails user = (UserDetails) firstSession.getAttribute("user");
                            firstSession.setAttribute("savedUser", user);
                        %>

                        <h5 class="centered"><%=userName%></h5>


                        <li class="mt"><a  href="main.jsp"> <i
                                    class="fa fa-dashboard"></i> <span>Profile</span>
                            </a></li>
                        <li class="mt"><a class="active" href="dept.jsp"> <i
                                    class="fa fa-dashboard"></i> <span>Departments</span>
                            </a></li>




                        <li class="sub-menu"><a href="javascript:;"> <i
                                    class="fa fa-book"></i> <span>Extra Pages</span>
                            </a>
                            <ul class="sub">
                                <!-- 							<li><a href="blank.html">Blank Page</a></li> -->
                                <li><a href="login.jsp">Login</a></li>
                                <li><a href="lock_screen.html">Lock Screen</a></li>
                            </ul></li>
                        <li class="sub-menu"><a href="javascript:;"> <i
                                    class="fa fa-tasks"></i> <span>Form</span>
                            </a>
                            <ul class="sub">
                                <li><a href="set_key.jsp">Set Up Key</a></li>
                                <!--<li><a href="form_component.jsp">Form Components</a></li>-->
                            </ul></li>
                        <!--					<li class="sub-menu"><a href="javascript:;"> <i
                                                                                class="fa fa-th"></i> <span>Data Tables</span>
                                                                </a>
                                                                        <ul class="sub">
                                                                                <li><a href="basic_table.html">Basic Table</a></li>
                                                                                <li><a href="responsive_table.html">Responsive Table</a></li>
                                                                        </ul></li>-->
                        <li class="sub-menu"><a href="javascript:;"> <i
                                    class=" fa fa-bar-chart-o"></i> <span>Charts</span>
                            </a>
                            <ul class="sub">
                                <!--<li><a href="morris.html">Morris</a></li>-->
                                <li><a href="charts.jsp">Average</a></li>
                            </ul></li>

                    </ul>
                    <!-- sidebar menu end-->
                </div>
            </aside>
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <div class="col-md-12 row mt">
                        <!--/ row -->
                        <div class="row">

                            <div class="col-md-12">
                                <div class="content-panel">
                                    <h4><i class="fa fa-angle-right"></i> Teacher Table</h4>
                                    <hr><table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>Department</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                BasicControl bc = new BasicControl();
                                                //ls.authenticateUser("tuhin", "tuhin");
                                                List<UserDetails> teachers = bc.provideList("UserDetails where userType='teacher'");
                                                int i = 1;
                                                for (UserDetails usr : teachers) {%>

                                            <tr>
                                                <td><%=i++%></td>
                                                <td><%=usr.getFirstName()%></td>
                                                <td><%=usr.getLastName()%></td>
                                                <td><%=usr.getUserName()%>
                                                <td><%=usr.getDepartment()%></td>
                                                <td><%=usr.getEmail()%>
                                            </tr>
                                            <%} %>


                                        </tbody>
                                    </table>
                                </div><!-- --/content-panel ---->
                            </div><!-- /col-md-12 -->

<!--                            <div class="col-md-12 mt">
                                <div class="content-panel">
                                    <h4><i class="fa fa-angle-right"></i> Student Table</h4><hr><table class="table table-hover">


                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Username</th>
                                                <th>Department</th>
                                                <th>Email</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%

                                                List<UserDetails> users = bc.provideList("UserDetails where userType='student'");
                                                i = 1;
                                                for (UserDetails usr : users) {%>

                                            <tr>
                                                <td><%=i++%></td>
                                                <td><%=usr.getFirstName()%></td>
                                                <td><%=usr.getLastName()%></td>
                                                <td><%=usr.getUserName()%>
                                                <td><%=usr.getDepartment()%></td>
                                                <td><%=usr.getEmail()%>
                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div> --/content-panel --
                            </div> /col-md-12 -->
                        </div>
                    </div>
                </section>
                <!--/wrapper -->
            </section>
            <!-- /MAIN CONTENT -->


            <!--main content end-->
            <!--footer start-->
            <footer class="site-footer">
                <div class="text-center">
                    2017 - Teachers Review <a href="#" class="go-top">
                        <i class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/jjquery-1.8.3.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript"
        src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script type="text/javascript"
        src="assets/js/gritter/js/jquery.gritter.js"></script>
        <script type="text/javascript" src="assets/js/gritter-conf.js"></script>

        <script>
            //custom select box

            $(function () {
                $('select.styled').customSelect();
            });
        </script>

    </body>
</html>

