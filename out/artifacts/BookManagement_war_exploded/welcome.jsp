<%@ page import="com.shyn.util.User" %><%--
  Created by IntelliJ IDEA.
  User: hung.levanviet
  Date: 5/2/2018
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <!--<link rel="stylesheet" type="text/css" href="styles.css" >-->

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <style type="text/css">

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

        /* Lable */

        label {
            padding-top: 10px;
            padding-bottom: 10px;
            font-size: 20px;
        }

        /* Table */

        table {

        }
    </style>
    <meta charset="UTF-8">
    <title>Login Page</title>
</head>
<body>
    <%--Load User or Customer--%>
    <%User user = (User) session.getAttribute("User"); %>
    <%--Load User or Customer--%>

    <header class="navbar navbar-fixed-top navbar-inverse">
        <div class="container content">
            <a href="welcome.jsp" id="logo">BOOK MANAGEMENT</a>
            <nav>
                <%if (user != null) {%>
                    <%if (user.getRole() == 0) {%>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="manageUsers.jsp">MANAGE USERS</a> </li>
                            <li><a href="profileRead.jsp">PROFILE</a> </li>
                            <li>
                                <form action="Logout" method="post" class="center">
                                    <input type="submit" value="Logout" class="center">
                                </form>
                            </li>
                            <li>
                                <form action="/ProfileLoadAll" method="post" class="center">
                                    <input type="submit" value="MANAGE" class="center">
                                </form>
                            </li>
                        </ul>
                    <%} else {%>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="profileRead.jsp">PROFILE</a> </li>
                            <li>
                                <form action="Logout" method="post" class="center">
                                    <input type="submit" value="Logout" class="center">
                                </form>
                            </li>
                        </ul>
                    <%}%>
                <%} else {%>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.jsp">LOGIN</a> </li>
                    <li><a href="register.jsp">REGISTER</a> </li>
                </ul>
                <%}%>
            </nav>
        </div>
    </header>


    <div class="center jumbotron container">
        <h1>Welcome to the Sample App</h1>

        <h2>
            This is the home page for the
            <a href="#">Servlet book management</a>
            sample application.
        </h2>
        <%if (user == null){%>
        <a href="register.jsp" class="btn btn-lg btn-primary">Sign up now!</a>
        <%}%>
    </div>
</body>
</html>
