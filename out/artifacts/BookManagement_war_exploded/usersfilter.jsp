<%--
  Created by IntelliJ IDEA.
  User: hung.levanviet
  Date: 4/23/2018
  Time: 3:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shyn.util.User"%>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=US-ASCII"
         pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <style>
        tabble,th,td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,td {
            padding: 5px;
            text-align: left;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>Users Filter</title>
</head>
<body>

    <%--<form action="UsersFilter" method="post">--%>
        <%--<strong>Find something : </strong> <input type="text" name="name"> <input type="submit" value="Find">--%>
    <%--</form>--%>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Country</th>
            <th>Email</th>
    <%
        ArrayList<User> userArrayList = (ArrayList<User>) session.getAttribute("filterUsers");
        int length = userArrayList.size();

    %>
    <% for (int i = 0; i < length; i++) {%>
    <tr>
        <th><%=userArrayList.get(i).getId()%></th>
        <th><%=userArrayList.get(i).getName()%></th>
        <th><%=userArrayList.get(i).getCountry()%></th>
        <th><%=userArrayList.get(i).getEmail()%></th>
    </tr>
    <%}%>

    </table>
<br><br>

Ready to come back? Just click <a href="login.html">Login</a>

</body>
</html>