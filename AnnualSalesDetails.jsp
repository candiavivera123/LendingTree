<%-- 
    Document   : AnnualSalesDetails
    Created on : Feb 13, 2018, 12:44:30 PM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::AnnualSales</title>
    </head>
    <body>
        <%
        
            String amt = "";
            String asid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_annualsales where annualsales_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    asid = rs.getString("annualsales_id");
                    amt = rs.getString("amt_upto");

                }
            }


               if (request.getParameter("submit") != null) 
        {
                String ASname = request.getParameter("txtsalestype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_annualsales set amt_upto='" + ASname + "' where annualsales_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("AnnualSalesDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtsalestype");
                    String ins = "insert into tbl_annualsales(amt_upto)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("AnnualSalesDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

        
                if (request.getParameter("did") != null) {
                String del = "delete from tbl_annualsales where annualsales_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

        %>

        <form name="frmannualsales">
            <input type="hidden" value="<%=asid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        Annual Sales Amount:
                    </td>
                    <td>
                        <input type="text" name="txtsalestype" value="<%=amt%>">
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
                <th>Amount Upto</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_annualsales";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("amt_upto")%></td>
                    <td><a href="AnnualSalesDetails.jsp?eid=<%=rs.getString("annualsales_id")%>">Edit</a></td><br>
                    <td><a href="AnnualSalesDetails.jsp?did=<%=rs.getString("annualsales_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>

    </body>
</html>

