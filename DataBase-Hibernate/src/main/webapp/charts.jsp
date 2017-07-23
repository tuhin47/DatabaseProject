<%@page import="org.tuhin.dto.UserDetails"%>
<%@page import="org.tuhin.dto.Question"%>
<%@page import="org.tuhin.dto.ReviewList"%>
<%@page import="java.util.List"%>
<%@page import="org.tuhin.dto.SetKey"%>
<%@page import="org.tuhin.controller.BasicControl"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>Average</title>

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

        <section id="container" >
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
                        <li class="sub-menu">
                            <a class="active" href="javascript:;" >
                                <i class=" fa fa-bar-chart-o"></i>
                                <span>Charts</span>
                            </a>

                        </li>

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

                    <!-- page start-->
                    <form >

                        <br><br>
                        <h4>
                            <label class="col-md-2 control-label">Course Code</label>
                        </h4>


                        <div class="col-md-offset-4">

                            <select name="courseCode"
                                    class="btn btn-theme03 dropdown-toggle" data-toggle="dropdown"
                                    style="width: 167px; height: 30px">
                                <option value="" selected>Course Code</option>

                                <%
                                    List<ReviewList> list = BasicControl.provideList("ReviewList");

                                    for (ReviewList s : list) {
                                %> 
                                <option value="<%=s.getCourseCode()%>"><%=s.getCourseCode()%></option>
                                <%  }

                                %>


                            </select>
                        </div>
                        <br>

                        <input  type="submit" value="SUBMIT"
                                class="col-md-offset-5 btn btn-theme02">

                    </form>

                    <h3><i class="fa fa-angle-right"></i>Charts</h3>
                    <div  id="myDIV">


                        <div class="tab-pane" id="chartjs">
                            <div class="row mt">
                                <!--                            <div class="col-lg-6">
                                                                <div class="content-panel">
                                                                    <h4><i class="fa fa-angle-right"></i> Doughnut</h4>
                                                                    <div class="panel-body text-center">
                                                                        <canvas id="doughnut" height="300" width="400"></canvas>
                                                                    </div>
                                                                </div>
                                                            </div>-->
                                <div class="col-lg-11 centered">
                                    <div class="content-panel">
                                        <!--<h4><i class="fa fa-angle-right"></i> Line</h4>-->
                                        <div class="panel-body text-center">
                                            <canvas id="line" height="400" width="1000"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- page end-->
                    </div>
                </section>          
            </section><!-- /MAIN CONTENT -->

            <!--main content end-->
            <!--footer start-->
            <<footer class="site-footer">
                <div class="text-center">
                    2017 - Teachers Review <a href="#" class="go-top"> <i
                            class="fa fa-angle-up"></i>
                    </a>
                </div>
            </footer>
            <!--footer end-->
        </section>

        <!-- js placed at the end of the document so the pages load faster -->
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
        <script src="assets/js/jquery.scrollTo.min.js"></script>
        <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


        <!--common script for all pages-->
        <script src="assets/js/common-scripts.js"></script>

        <!--script for this page-->
        <script src="assets/js/chart-master/Chart.js"></script>
        <script >

            var Script = function () {


            var doughnutData = [
            {
            value: 30,
                    color: "#1abc9c"
            },
            {
            value: 50,
                    color: "#2ecc71"
            },
            {
            value: 100,
                    color: "#3498db"
            },
            {
            value: 40,
                    color: "#9b59b6"
            },
            {
            value: 120,
                    color: "#34495e"
            }

            ];
            var lineChartData = {
            <% String strl, strd;
                strl = "[]";
                strd = "[]";
            %>
            <%                if (BasicControl.isTheParameterValid(request, "courseCode")) {
                    if (request.getParameter("courseCode") != null && request.getParameter("courseCode") != "") {
                        String courseCode = request.getParameter("courseCode");

                        List<ReviewList> rList = BasicControl.provideList("ReviewList where courseCode='" + courseCode + "'");
                        for (ReviewList r : rList) {
                            strl = "[";
                            strd = "[";
                            int i = 1;
                            for (Question q : r.getReviewCollection()) {
                                if (i > 1) {
                                    strl += ",";
                                    strd += ",";
                                }
                                strl += " \"" + i + "\"";
                                strd += q.getQuestionMarking();
                                i++;
                            }
                            strl += "]";
                            strd += "]";
                            break;
                        }
                    }
                }%>

            labels: <%=strl%>,
                    datasets: [
                    {
                    fillColor: "rgba(220,220,220,0.5)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            data: <%=strd%>
                    }

                    ]
            <%%>

            };
            var pieData = [
            {
            value: 30,
                    color: "#1abc9c"
            },
            {
            value: 50,
                    color: "#16a085"
            },
            {
            value: 100,
                    color: "#27ae60"
            }

            ];
            var barChartData = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
                    datasets: [
                    {
                    fillColor: "rgba(220,220,220,0.5)",
                            strokeColor: "rgba(220,220,220,1)",
                            data: [65, 59, 90, 81, 56, 55, 40]
                    },
                    {
                    fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            data: [28, 48, 40, 19, 96, 27, 100]
                    }
                    ]

            };
            var chartData = [
            {
            value: Math.random(),
                    color: "#D97041"
            },
            {
            value: Math.random(),
                    color: "#C7604C"
            },
            {
            value: Math.random(),
                    color: "#21323D"
            },
            {
            value: Math.random(),
                    color: "#9D9B7F"
            },
            {
            value: Math.random(),
                    color: "#7D4F6D"
            },
            {
            value: Math.random(),
                    color: "#584A5E"
            }
            ];
            var radarChartData = {
            labels: ["", "", "", "", "", "", ""],
                    datasets: [
                    {
                    fillColor: "rgba(220,220,220,0.5)",
                            strokeColor: "rgba(220,220,220,1)",
                            pointColor: "rgba(220,220,220,1)",
                            pointStrokeColor: "#fff",
                            data: [65, 59, 90, 81, 56, 55, 40]
                    },
                    {
                    fillColor: "rgba(151,187,205,0.5)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            data: [28, 48, 40, 19, 96, 27, 100]
                    }
                    ]

            };
//            new Chart(document.getElementById("doughnut").getContext("2d")).Doughnut(doughnutData);
            new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData,{scaleOverride : true,
                    scaleSteps : 10,
                    scaleStepWidth : .5,
                    scaleStartValue : 0});
//                            new Chart(document.getElementById("radar").getContext("2d")).Radar(radarChartData);
//                            new Chart(document.getElementById("polarArea").getContext("2d")).PolarArea(chartData);
//                            new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
//                            new Chart(document.getElementById("pie").getContext("2d")).Pie(pieData);
            }();
        </script>

        <script>
            //custom select box
            function myFunction() {
            var x = document.getElementById('myDIV');
            if (x.style.display === 'none') {
            x.style.display = 'block';
            } else {
            x.style.display = 'none';
            }
            }

            $(function () {
            $('select.styled').customSelect();
            });

        </script>

    </body>
</html>
