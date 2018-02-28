<%-- 
    Document   : Login
    Created on : Feb 21, 2018, 12:32:46 PM
    Author     : mypc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::Login</title>
    </head>
    <body>
        <%
         String uname="", passwrd="";
         uname=request.getParameter("txtname");
         passwrd=request.getParameter("txtpass");
         
         String sel= "select * from tbl_userregistration u inner join tbl_login l on u.login_id=l.login_id where username='"+uname+"' and password='"+passwrd+"'";
        ResultSet rs=obj.selectCommand(sel);
        if(rs.next())
        {
            session.setAttribute("userid", rs.getString("user_id"));
            response.sendRedirect("../User/HomePage.jsp");
        }else
        {
            
        }
        
        %>
        <h1 align="center">LOGIN</h1>
        <table align="center">
            <tr>
                <td>
                    UserName:
                </td>
                <td><input type="text" name="txtname"</td>
            </tr>
            <tr>
                <td>Password:</td>
                <td><input type="password" name="txtpass"</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btnsub" value="Login">
                    <input type="reset" name="btnrst" value="Cancel">
                    </td>
               
            </tr>
        </table>
    </body>
</html>
