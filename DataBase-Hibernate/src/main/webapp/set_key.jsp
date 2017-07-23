<%@page import="org.tuhin.controller.BasicControl"%>
<%@page import="org.tuhin.dto.UserDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword"
              content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Form</title>

        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css"
              href="assets/js/bootstrap-datepicker/css/datepicker.css" />
        <link rel="stylesheet" type="text/css"
              href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />

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
                        <li class="mt"><a href="dept.jsp"> <i
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
                                <li><a class="active" href="set_key.jsp">Set Up Key</a></li>
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
            <!--sidebar end-->

            <!-- **********************************************************************************************************************************************************
  MAIN CONTENT
  *********************************************************************************************************************************************************** -->
            <!--main content start-->
            <section id="main-content">
                <section class="wrapper">
                    <h3>
                        <i class="fa fa-angle-right"></i> Form Components
                    </h3>

                    <!-- BASIC FORM ELELEMNTS -->
                    <div class="row mt">
                        <div class="col-lg-8 col-centered">
                            <div class="form-panel">
                                <form action="CourseComponent" class="form-horizontal style-form"
                                      method="POST">

                                    <input type="hidden" name="tag" value="setKey">
                                    <input type="hidden" name="device" value="PC"> <br>
                                    <h4>
                                        <label class="col-md-3 control-label">Departments</label>
                                    </h4>


                                    <div class="col-md-offset-4">

                                        <select name="department"
                                                class="btn btn-theme03 dropdown-toggle" data-toggle="dropdown"
                                                style="width: 167px; height: 30px">
                                            <option selected value="">Choose Department</option>
                                            <option value="CSE">CSE</option>
                                            <option value="EEE">EEE</option>
                                            <option value="ICT">ICT</option>
                                            <option value="CEP">CEP</option>
                                            <option value="CEE">CEE</option>
                                            <option value="PME">PME</option>
                                            <option value="IPE">IPE</option>


                                        </select>
                                    </div>
                                    <br>

                                    <h4>
                                        <label class="col-md-3 control-label">Semesters</label>
                                    </h4>
                                    <div class="col-md-offset-4">
                                        <div class="btn-group">



                                            <select name="semester"
                                                    class="btn btn-theme03 dropdown-toggle"
                                                    data-toggle="dropdown" style="width: 167px; height: 30px">

                                                <option value="" selected>Choose Semester</option>

                                                <option value="1-1">1-1</option>
                                                <option value="1-2">1-2</option>
                                                <option value="2-1">2-1</option>
                                                <option value="2-2">2-2</option>
                                                <option value="3-1">3-1</option>
                                                <option value="3-2">3-2</option>
                                                <option value="4-1">4-1</option>
                                                <option value="4-2">4-2</option>


                                            </select> <br> <br> <br>



                                        </div>
                                    </div>
                                    <h4>
                                        <label class="col-md-3 control-label">Course Code</label>
                                    </h4>
                                    <div class="col-md-8">
                                        <input name="courseCode" type="text" class="form-control round-form">
                                    </div><br><br><br>
                                    <h4>
                                        <label class="col-md-3 control-label">Course Title</label>
                                    </h4>
                                    <div class="col-md-8">
                                        <input name="courseName" type="text" class="form-control round-form">
                                    </div>
                                    <br> <br> <br>
                                    <h4>
                                        <label class="col-md-3 control-label">Key Of the Course</label>
                                    </h4>
                                    <div class="col-md-8">
                                        <input name="key" type="text" class="form-control round-form">
                                    </div>
                                    <br> <br> <br>
                                    <h4>
                                        <label class="col-md-3 control-label">Question Set ID</label>
                                    </h4>
                                    <div class="col-md-8">
                                        <input name="question" type="text" class="form-control round-form">
                                    </div>
                                    <br><br>
                                    <input  type="submit" value="SUBMIT"
                                            class="col-md-offset-10 btn btn-theme02">

                                </form>



                            </div>
                        </div>
                        <!-- col-lg-12-->
                    </div>
                    <!-- /row -->

                </section>
                <!-- /wrapper  -->
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
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript"
        src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

        <!--custom switch-->
        <script src="assets/js/bootstrap-switch.js"></script>

        <!--custom tagsinput-->
        <script src="assets/js/jquery.tagsinput.js"></script>

        <!--custom checkbox & radio-->

        <script type="text/javascript"
        src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript"
        src="assets/js/bootstrap-daterangepicker/date.js"></script>
        <script type="text/javascript"
        src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script type="text/javascript"
        src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>


        <script src="assets/js/form-component.js"></script>


        <script>
            //custom select box

            $(function () {
                $('select.styled').customSelect();
            });
        </script>

    </body>
</html>
