<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 4/17/2018
  Time: 11:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UploadFile</title>
</head>
<body>
    <form action="FileUploadServlet" method="post" enctype="multipart/form-data">
        Select File to Upload : <input type="file" name="filename">
        <br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
