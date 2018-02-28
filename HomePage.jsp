<%-- 
    Document   : HomePage
    Created on : Feb 21, 2018, 1:49:34 PM
    Author     : mypc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome Candia Vivera</h1>
        <a href="ChangePassword.jsp">Change Password</a>
        <a href="EditProfile.jsp">Edit Profile</a>
        <a href="ViewProfile.jsp">View Profile</a>
        
    </body>
</html>
