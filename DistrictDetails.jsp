<%-- 
    Document   : DistrictDetails
    Created on : Feb 7, 2018, 11:35:05 AM
    Author     : mypc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::District</title>
    </head>
    <body>
        <%
            
            String Districtname = "";
            String distid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_district where district_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    distid = rs.getString("district_id");
                    Districtname = rs.getString("district_name");

                }
            }

            
         if (request.getParameter("submit") != null) 
        {
                String Dname = request.getParameter("txtdist");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_district set district_name='" + Dname + "' where district_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("DistrictDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtdist");
                    String ins = "insert into tbl_district(district_name)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("DistrictDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

       
                   if (request.getParameter("did") != null) {
                String del = "delete from tbl_district where district_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

        %>

        <form name="frmdistrict">
            <input type="hidden" value="<%=distid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        District Name:
                    </td>
                    <td>
                        <input type="text" name="txtdist" value="<%=Districtname%>">
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
                <th>District</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_district";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><a href="DistrictDetails.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td><br>
                    <td><a href="DistrictDetails.jsp?did=<%=rs.getString("district_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>





    </body>
</html>
