<%-- 
    Document   : BusinessNatureDetails
    Created on : Feb 13, 2018, 11:57:09 AM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::BusinessNature</title>
    </head>
    <body>
        <%
        
            String typename = "";
            String bnid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_businessnature where businessnature_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    bnid = rs.getString("businessnature_id");
                    typename = rs.getString("businessname");

                }
            }


               if (request.getParameter("submit") != null) 
        {
                String BNname = request.getParameter("txtbntype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_businessnature set businessname='" + BNname + "' where businessnature_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("BusinessNatureDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtbntype");
                    String ins = "insert into tbl_businessnature(businessname)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("BusinessNatureDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

        
                if (request.getParameter("did") != null) {
                String del = "delete from tbl_businessnature where businessnature_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

        %>

        <form name="frmbusinessnature">
            <input type="hidden" value="<%=bnid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        BusinessNature Name:
                    </td>
                    <td>
                        <input type="text" name="txtbntype" value="<%=typename%>">
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
                <th>BusinessNature</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_businessnature";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("businessname")%></td>
                    <td><a href="BusinessNatureDetails.jsp?eid=<%=rs.getString("businessnature_id")%>">Edit</a></td><br>
                    <td><a href="BusinessNatureDetails.jsp?did=<%=rs.getString("businessnature_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>

    </body>
</html>

