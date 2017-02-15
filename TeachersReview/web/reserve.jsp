<%-- 
    Document   : reserve
    Created on : Feb 11, 2017, 1:31:41 PM
    Author     : TUHIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="other.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <li class="sub-menu">
        <a href="javascript:;" >
            <i class="fa fa-desktop"></i>
            <span>Departments</span>
        </a>
        <ul class="sub">
            <%
                ArrayList<String> list = Course.allDepartments();
                for (int i = 0; i < list.size(); i++) {

            %>
            <li ><a  href="cse.jsp"><%= (String) list.get(i)%></a></li>
                <% }%>
        </ul>
    </li>
    
    
</body>
</html>
