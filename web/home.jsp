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
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <style type="text/css">

        @import "bootstrap-sprockets";
        @import "bootstrap";

        /* mixins, variables, etc. */

        $gray-medium-light: #eaeaea;

        @mixin box_sizing {
            -moz-box-sizing:    border-box;
            -webkit-box-sizing: border-box;
            box-sizing:         border-box;
        }

        /* universal */

        body {
            padding-top: 60px;
        }

        section {
            overflow: auto;
        }

        textarea {
            resize: vertical;
        }

        .center {
            text-align: center;
        }

        .center h1 {
            margin-bottom: 10px;
        }

        /* typography */

        h1, h2, h3, h4, h5, h6 {
            line-height: 1;
        }

        h1 {
            font-size: 3em;
            letter-spacing: -2px;
            margin-bottom: 30px;
            text-align: center;
        }

        h2 {
            font-size: 1.2em;
            letter-spacing: -1px;
            margin-bottom: 30px;
            text-align: center;
            font-weight: normal;
            color: #777;
        }

        p {
            font-size: 1.1em;
            line-height: 1.7em;
        }

        /* header */

        #logo {
            float: left;
            margin-right: 10px;
            font-size: 1.7em;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: -1px;
            padding-top: 9px;
            font-weight: bold;
        }

        #logo:hover {
            color: #fff;
            text-decoration: none;
        }

        /* footer */

        footer {
            margin-top: 45px;
            padding-top: 5px;
            border-top: 1px solid #eaeaea;
            color: #777;
        }

        footer a {
            color: #555;
        }

        footer a:hover {
            color: #222;
        }

        footer small {
            float: left;
        }

        footer ul {
            float: right;
            list-style: none;
        }

        footer ul li {
            float: left;
            margin-left: 15px;
        }

        /* miscellaneous */

        .debug_dump {
            clear: both;
            float: left;
            width: 100%;
            margin-top: 45px;
        @include box_sizing;
        }

        /* sidebar */

        aside {
        section.user_info {
            margin-top: 20px;
        }
        section {
            padding: 10px 0;
            margin-top: 20px;
        &:first-child {
             border: 0;
             padding-top: 0;
         }
        span {
            display: block;
            margin-bottom: 3px;
            line-height: 1;
        }
        h1 {
            font-size: 1.4em;
            text-align: left;
            letter-spacing: -1px;
            margin-bottom: 3px;
            margin-top: 0px;
        }
        }
        }

        .gravatar {
            float: left;
            margin-right: 10px;
        }

        .gravatar_edit {
            margin-top: 15px;
        }

        /* forms */

        input, textarea, select, .uneditable-input {
            border: 1px solid #bbb;
            width: 100%;
            margin-bottom: 15px;
        @include box_sizing;
            font-size: 20px;
        }

        input {
            height: auto !important;
        }

        #error_explanation {
            color: red;
        ul {
            color: red;
            margin: 0 0 30px 0;
        }
        }

        .field_with_errors {
        @extend .has-error;
        .form-control {
            color: $state-danger-text;
        }
        }

        /* Lable */

        label {
            padding-top: 10px;
            padding-bottom: 10px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <header class="navbar navbar-fixed-top navbar-inverse">
        <div class="container content">
            <a href="welcome.jsp" id="logo">BOOK MANAGEMENT</a>
            <nav>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp">LOGIN</a> </li>
                    <li><a href="register.jsp">REGISTER</a> </li>
                    <li><a href="usersfilter.jsp">MANAGE USERS</a> </li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="col-md-6 col-md-offset-3">
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
            <input type="submit" value="Logout" class="btn btn-lg btn-primary" >
        </form>
    </div>
</body>
</html>