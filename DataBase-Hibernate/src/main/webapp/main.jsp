<%-- 
    Document   : main
    Created on : Feb 5, 2017, 12:40:17 PM
    Author     : TUHIN
--%>

<%@page import="org.tuhin.controller.BasicControl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.tuhin.controller.LoginService"%>
<%@page import="org.tuhin.dto.UserDetails"%>
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

<title>Teacher Review</title>

<!-- Bootstrap core CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css"
	href="assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/style-responsive.css" rel="stylesheet">

<script src="assets/js/chart-master/Chart.js"></script>

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
						String userName=null;
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
					%>

					<h5 class="centered"><%=userName%></h5>


					<li class="mt"><a class="active" href="main.jsp"> <i
							class="fa fa-dashboard"></i> <span>Profile</span>
					</a></li>
					<li class="mt"><a href="dept.jsp"> <i
							class="fa fa-dashboard"></i> <span>Departments</span>
					</a></li>



					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-cogs"></i> <span>Components</span>
					</a>
						<ul class="sub">
							<li><a href="calendar.html">Calendar</a></li>

							<!--                                 <li><a  href="todo_list.html">Todo List</a></li> -->
						</ul></li>
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
							<li><a href="form_component.jsp">Form Components</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class="fa fa-th"></i> <span>Data Tables</span>
					</a>
						<ul class="sub">
							<li><a href="basic_table.html">Basic Table</a></li>
							<li><a href="responsive_table.html">Responsive Table</a></li>
						</ul></li>
					<li class="sub-menu"><a href="javascript:;"> <i
							class=" fa fa-bar-chart-o"></i> <span>Charts</span>
					</a>
						<ul class="sub">
							<li><a href="morris.html">Morris</a></li>
							<li><a href="chartjs.html">Chartjs</a></li>
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

				<div class="row">
					<div class="col-lg-9 main-chart">
						<div class="margin-top-150">

							<div class="table-responsive">
								<table class="table">
									<tr>
										<td>Username</td>
										<td><%=user.getUserName()%></td>
									</tr>
									<tr>
										<td>First Name</td>
										<td><%=user.getFirstName()%></td>
									</tr>
									<tr>
										<td>Last Name</td>
										<td><%=user.getLastName()%></td>
									</tr>
									<tr>
										<td>Department</td>
										<td><%=user.getDepartment()%></td>
									</tr>
									<tr>
										<td>Email</td>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<td>Designation</td>
										<td><%=user.getUserType()%></td>
									</tr>

								</table>
							</div>
						</div>
					</div>

					<!-- /col-lg-9 END SECTION MIDDLE -->


					<!-- **********************************************************************************************************************************************************
        RIGHT SIDEBAR CONTENT
        *********************************************************************************************************************************************************** -->

					<div class="col-lg-3 ds">

						<!-- CALENDAR-->
						<div id="calendar" class="mb">
							<div class="panel green-panel no-margin">
								<div class="panel-body">
									<div id="date-popover" class="popover top"
										style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
										<div class="arrow"></div>
										<h3 class="popover-title" style="disadding: none;"></h3>
										<div id="date-popover-content" class="popover-content"></div>
									</div>
									<div id="my-calendar"></div>
								</div>
							</div>
						</div>
						<!-- / calendar -->






					</div>
					<!-- /col-lg-3 -->
				</div>
				<!-- 				/row  -->
			</section>
		</section>

		<!--main content end-->
		<!--footer start-->
		<footer class="site-footer">
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
	<script src="assets/js/jquery-1.8.3.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script class="include" type="text/javascript"
		src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
	<script src="assets/js/jquery.scrollTo.min.js"></script>
	<script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>
	<script src="assets/js/jquery.sparkline.js"></script>


	<!--common script for all pages-->
	<script src="assets/js/common-scripts.js"></script>

	<script type="text/javascript"
		src="assets/js/gritter/js/jquery.gritter.js"></script>
	<script type="text/javascript" src="assets/js/gritter-conf.js"></script>

	<!--script for this page-->
	<script src="assets/js/sparkline-chart.js"></script>
	<script src="assets/js/zabuto_calendar.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							var unique_id = $.gritter
									.add({
										// (string | mandatory) the heading of the notification
										title : 'Welcome to Teacher Review!',
										// (string | mandatory) the text inside the notification
										text : 'You can hide the left sidebar clicking on the button next to the logo. ',
										// (string | optional) the image to display on the left
										image : 'assets/img/ui-sam.jpg',
										// (bool | optional) if you want it to fade out on its own or just sit there
										sticky : false,
										// (int | optional) the time you want it to be alive for before fading out
										time : '5000',
										// (string | optional) the class name you want to apply to that specific message
										class_name : 'my-sticky-class'
									});

							return false;
						});
	</script>

	<script type="application/javascript">
		
		




            $(document).ready(function () {
            $("#date-popover").popover({html: true, trigger: "manual"});
            $("#date-popover").hide();
            $("#date-popover").click(function (e) {
            $(this).hide();
            });

            $("#my-calendar").zabuto_calendar({
            action: function () {
            return myDateFunction(this.id, false);
            },
            action_nav: function () {
            return myNavFunction(this.id);
            },
            ajax: {
            url: "show_data.php?action=1",
            modal: true
            },
            legend: [
            {type: "text", label: "Special event", badge: "00"},
            {type: "block", label: "Regular event", }
            ]
            });
            });


            function myNavFunction(id) {
            $("#date-popover").hide();
            var nav = $("#" + id).data("navigation");
            var to = $("#" + id).data("to");
            console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
            }




        
	
	</script>


</body>
</html>

