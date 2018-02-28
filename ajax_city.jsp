<%-- 
    Document   : ajax_district
    Created on : 8 Aug, 2017, 11:11:54 AM
    Author     : user
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean id="obj" class="DB.ConnectionClass"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%
            String st=request.getParameter("id");
            
        %>
       
                    
                       
                        <%
                           String ss="select * from tbl_city where district_id='"+st+"'";
                           
                           ResultSet rs=obj.selectCommand(ss);
                           while (rs.next())
                                   {
                                       %>
                                       <option value="<%=rs.getString("city_id")%>"><%=rs.getString("city_name")%></option>
                                       <%
                                   }
                        %>
                   
                       
               