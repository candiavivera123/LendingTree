<%-- 
    Document   : ResidenceTypeDetails
    Created on : Feb 9, 2018, 2:30:04 PM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::Residence</title>
    </head>
    <body>
        <%
        
            String typename = "";
            String rid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_residencetype where rt_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    rid = rs.getString("rt_id");
                    typename = rs.getString("typename");

                }
            }


               if (request.getParameter("submit") != null) 
        {
                String Rname = request.getParameter("txtrtype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_residencetype set typename='" + Rname + "' where rt_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("ResidenceTypeDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtrtype");
                    String ins = "insert into tbl_residencetype(typename)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("ResidenceTypeDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

        
                if (request.getParameter("did") != null) {
                String del = "delete from tbl_residencetype where rt_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

        %>

        <form name="frmresidencetype">
            <input type="hidden" value="<%=rid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        ResidenceType Name:
                    </td>
                    <td>
                        <input type="text" name="txtrtype" value="<%=typename%>">
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
                <th>ResidenceType</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_residencetype";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("typename")%></td>
                    <td><a href="ResidenceTypeDetails.jsp?eid=<%=rs.getString("rt_id")%>">Edit</a></td><br>
                    <td><a href="ResidenceTypeDetails.jsp?did=<%=rs.getString("rt_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>

    </body>
</html>

