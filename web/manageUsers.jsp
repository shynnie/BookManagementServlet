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
<html lang="en">
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <meta charset="UTF-8">
    <title>Manage Users</title>
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
</head>
<body>
    <%--Load User or Customer--%>
    <%User user = (User) session.getAttribute("User"); %>
    <%ArrayList<User> manageUsers = (ArrayList<User>) session.getAttribute("manageUsers");%>
    <%ArrayList<User> ProfileLoadAll = (ArrayList<User>) session.getAttribute("ProfileLoadAll");%>
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
                            <form action="Logout" method="post">
                                <input type="submit" value="Logout">
                            </form>
                        </li>
                    </ul>
                    <%} else {%>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="profileRead.jsp">PROFILE</a> </li>
                        <li>
                            <form action="Logout" method="post">
                                <input type="submit" value="Logout">
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

    <h1>Manage Users</h1>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <form action="/ManageUsers" method="post">
                <label>Search</label><input type="text" name="search">
                <h5>(E.g: name, country, email, id...)</h5>
                <div class="col-md-4 col-md-offset-2">
                        <input type="submit" value="Search" class="btn btn-lg btn-primary">
                </div>
            </form>
            <div class="col-md-4">
                <form action="/ProfileLoadAll" method="post">
                    <% if (ProfileLoadAll.isEmpty()) {%>
                    <input type="submit" value="Load all" class="btn btn-lg btn-primary">
                    <%} else {%>
                    <input type="submit" value="Load all" class="btn btn-lg btn-primary" disabled>
                    <%}%>
                </form>
            </div>

            <br><br>

            <table class="table table-bordered">
                <tr>
                    <th><label>ID</label></th>
                    <th><label>Name</label></th>
                    <th><label>Country</label></th>
                    <th><label>Email</label></th>
                    <th><label>Role</label></th>
                    <th colspan="2" class="center"><label>Modify</label></th>
                </tr>
                <tr>
<%--Load list filter--%>
                <%if (ProfileLoadAll.isEmpty()) {%>
                    <% for (int i = 0; i < manageUsers.size(); i++) {%>
                        <th><%=manageUsers.get(i).getId()%></th>
                        <th><%=manageUsers.get(i).getName()%></th>
                        <th><%=manageUsers.get(i).getCountry()%></th>
                        <th><%=manageUsers.get(i).getEmail()%></th>
                        <%if (manageUsers.get(i).getRole() == 0) {%>
                        <th>Admin</th>
                        <%} else {%>
                        <th>User</th>
                        <%}%>
<%--Load list filter--%>
<%--Edit Profile--%>
                        <th>
                        <form action="ProfileUpdate" method="post">
                            <%--<input type="hidden" name="email" value="<%=filterUsers.get(i).getEmail()%>"><br>--%>
                            <%--<input type="hidden" name="name" value="<%=filterUsers.get(i).getName()%>"><br>--%>
                            <%--<input type="hidden" name="country" value="<%=filterUsers.get(i).getCountry()%>"><br>--%>
                            <%--<input type="hidden" name="role" value="<%=filterUsers.get(i).getRole()%>"><br>--%>
                            <%--<input type="hidden" name="id" value="<%=filterUsers.get(i).getId()%>">--%>
                            <input type="submit" value="Edit" class="btn btn-primary">
                        </form>
                        </th>
<%--Edit Profile--%>
<%--Delete Profile--%>
                        <th>
                        <form action="ProfileDelete" method="post">
                            <input type="hidden" name="id" value="<%=manageUsers.get(i).getId()%>">
                            <input type="submit" value="Delete" class="btn btn-primary">
                        </form>
                        </th>
<%--Delete Profile--%>
                </tr>
                    <%}%>
                <%} else {%>
                    <% for (int i = 0; i < ProfileLoadAll.size(); i++) {%>
                    <th><%=ProfileLoadAll.get(i).getId()%></th>
                    <th><%=ProfileLoadAll.get(i).getName()%></th>
                    <th><%=ProfileLoadAll.get(i).getCountry()%></th>
                    <th><%=ProfileLoadAll.get(i).getEmail()%></th>
                    <%if (ProfileLoadAll.get(i).getRole() == 0) {%>
                    <th>Admin</th>
                    <%} else {%>
                    <th>User</th>
                    <%}%>
<%--Load list filter--%>
<%--Edit Profile--%>
                    <th>
                        <form action="ProfileUpdate" method="post">
                            <%--<input type="hidden" name="email" value="<%=filterUsers.get(i).getEmail()%>"><br>--%>
                            <%--<input type="hidden" name="name" value="<%=filterUsers.get(i).getName()%>"><br>--%>
                            <%--<input type="hidden" name="country" value="<%=filterUsers.get(i).getCountry()%>"><br>--%>
                            <%--<input type="hidden" name="role" value="<%=filterUsers.get(i).getRole()%>"><br>--%>
                            <%--<input type="hidden" name="id" value="<%=filterUsers.get(i).getId()%>">--%>
                            <input type="submit" value="Edit" class="btn btn-primary">
                        </form>
                    </th>
<%--Edit Profile--%>
<%--Delete Profile--%>
                    <th>
                        <form action="ProfileDelete" method="post">
                            <input type="hidden" name="id" value="<%=ProfileLoadAll.get(i).getId()%>">
                            <input type="submit" value="Delete" class="btn btn-primary">
                        </form>
                    </th>
<%--Delete Profile--%>
                </tr>
                    <%}%>
                <%}%>
<%--Clear Back Arraylist--%>
                    <%if (!ProfileLoadAll.isEmpty()) ProfileLoadAll.clear(); else manageUsers.clear();%>
<%--Clear Back Arraylist--%>


            </table>

        </div>
    </div>

</body>
</html>