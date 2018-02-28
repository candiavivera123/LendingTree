<%-- 
    Document   : BusinessTypeDetails
    Created on : Feb 7, 2018, 2:44:08 PM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::Business</title>
    </head>
    <body>
        <%
        //String Districtid="";
            //String Districtname="";
            //String name="";
            //name=request.getParameter("district");
            String typename = "";
            String bid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_businesstype where businesstype_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    bid = rs.getString("businesstype_id");
                    typename = rs.getString("typename");

                }
            }

        


        
         if (request.getParameter("submit") != null) 
        {
                String Bname = request.getParameter("txtbtype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_businesstype set typename='" + Bname + "' where businesstype_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("BusinessTypeDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtbtype");
                    String ins = "insert into tbl_businesstype(typename)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("BusinessTypeDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

       
                if (request.getParameter("did") != null)
                {
                String del = "delete from tbl_businesstype where businesstype_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
                }

        %>

        <form name="frmbusinesstype">
            <input type="hidden" value="<%=bid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        BusinessType Name:
                    </td>
                    <td>
                        <input type="text" name="txtbtype" value="<%=typename%>">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="submit" name="submit">
                    </td>
                </tr>

            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>BusinessType</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_businesstype";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("typename")%></td>
                    <td><a href="BusinessTypeDetails.jsp?eid=<%=rs.getString("businesstype_id")%>">Edit</a></td><br>
                    <td><a href="BusinessTypeDetails.jsp?did=<%=rs.getString("businesstype_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>





    </body>
</html>
