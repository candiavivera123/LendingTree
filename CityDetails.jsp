<%-- 
    Document   : CityDetails
    Created on : Feb 13, 2018, 12:36:07 PM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::City</title>
    </head>
    <%
        String cId = "", dId = "", cname = "";
        if (request.getParameter("btnsub") != null)
        {

            if (!request.getParameter("hid").equals("")) 
            {
                String Name = request.getParameter("txtname");
                               
                String upQry = "update tbl_city set city_name ='" + Name + "',district_id='"+request.getParameter("district")+"' where city_id='" + request.getParameter("hid") + "'";

                boolean b = obj.executeCommand(upQry);
                if (b == true) 
                {
                    out.println("Sucess");
                    response.sendRedirect("CityDetails.jsp");
                } else 
                {
                    out.println("Failed");
                }
            } 
            else 
            {
                String Uname = request.getParameter("txtname");
                
                String Uid = request.getParameter("district");

                String insQuery = "insert into tbl_city (city_name,district_id) values ('" + Uname + "','" + Uid + "')";
                boolean b = obj.executeCommand(insQuery);

                if (b == true) 
                {
                    out.println("success");
                } else 
                {
                    out.println(insQuery);
                }

            }
        }
            if (request.getParameter("did") != null) 
            {
                String del = "delete from tbl_city where city_id='" + request.getParameter("did") + "'";
                boolean b = obj.executeCommand(del);
                response.sendRedirect("CityDetails.jsp");
            }
            if (request.getParameter("eid") != null) 
            {
                String selq = "select * from tbl_city u inner join tbl_district c on u.district_id=c.district_id where u.city_id='" + request.getParameter("eid") + "'";

                ResultSet rs2 = obj.selectCommand(selq);

                while (rs2.next()) 
                {
                   cId = rs2.getString("city_id");
                    cname = rs2.getString("city_name");
                    dId = rs2.getString("district_id");
                    
                }
            }


    %>
    <body>
        
        <form method="post">
            <h1 align="center">CITY</h1>
        <input type="hidden" name="hid" value="<%=cId%>"/>
            <table align="center">
                
                
                <tr>
                    <td>
                        District
                    </td>
                    <td>
                        <select name="district">
                            <option>--select--</option>
                            <%                           
                                String sel = "select * from tbl_district";
                                ResultSet rs = obj.selectCommand(sel);
                                while (rs.next()) {

                            %>
                            <option value="<%=rs.getString("district_id")%>"  <% if(dId.equals(rs.getString("district_id")))
                                        {%>selected="true" <%}   %>    >
                                            <%=rs.getString("district_name")%>
                                        </option>
                            

                            <%
                                }


                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                <td> City Name:</td>
                <td><input type="text" name="txtname" value="<%=cname%>" /></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsub" value="SUBMIT" ></td>
                </tr>
            </table>
            <table border="1" align="center">
                <th>Sl No</th>
                <th>City Name</th>
                <th>District</th>


                <%
                    int i = 1;
                    String sel1 = "select * from tbl_city u, tbl_district c where u.district_id=c.district_id";
                    ResultSet rs1 = obj.selectCommand(sel1);
                    while (rs1.next()) 
                    {
                %>
                <tr>
                    <td><%=i%></td>

                    <td><%=rs1.getString("city_name")%></td>
                    <td><%=rs1.getString("district_name")%></td>
                    <td><a href="CityDetails.jsp?eid=<%=rs1.getString("city_id")%>">EDIT</a></td><br>
                 
                     <td><a href="CityDetails.jsp?did=<%=rs1.getString("city_id")%>">Delete</a></td>

                    
                </tr>
                <%
                        i++;
                    }
                %>

            </table>

        </form>
    </body>
</html>
