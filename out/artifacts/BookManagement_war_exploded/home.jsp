<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 4/16/2018
  Time: 10:19 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.shyn.util.User"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
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
    <title>Home Page</title>
</head>
<body>
    <%User user = (User) session.getAttribute("User"); %>
    <h3>Hi <%=user.getName() %></h3>
    <strong>Your Email</strong>: <%=user.getEmail() %><br>
    <strong>Your Country</strong>: <%=user.getCountry() %><br>
    <br>

    <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
        <tr>
            <th><%=user.getName()%></th>
            <th><%=user.getEmail()%></th>
            <th><%=user.getCountry()%></th>
        </tr>
    </table><br><br><br>

    <form action="Logout" method="post">
        <input type="submit" value="Logout" >
    </form>
</body>
</html>