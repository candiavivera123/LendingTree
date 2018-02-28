<%-- 
    Document   : ModeOfSalary
    Created on : Feb 13, 2018, 12:12:38 PM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::SalaryMode</title>
    </head>
    <body>
        <%
        
            String typename = "";
            String smid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_modeofsalary where salarymode_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    smid = rs.getString("salarymode_id");
                    typename = rs.getString("modes");

                }
            }


               if (request.getParameter("submit") != null) 
        {
                String Mname = request.getParameter("txtmodetype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_modeofsalary set modes='" + Mname + "' where salarymode_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("ModeOfSalary.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtmodetype");
                    String ins = "insert into tbl_modeofsalary(modes)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("ModeOfSalary.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

        
                if (request.getParameter("did") != null) {
                String del = "delete from tbl_modeofsalary where salarymode_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
            }

        %>

        <form name="frmsalarymode">
            <input type="hidden" value="<%=smid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        Mode Of Salary:
                    </td>
                    <td>
                        <input type="text" name="txtmodetype" value="<%=typename%>">
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
                <th>Mode Of Salary</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_modeofsalary";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("modes")%></td>
                    <td><a href="ModeOfSalary.jsp?eid=<%=rs.getString("salarymode_id")%>">Edit</a></td><br>
                    <td><a href="ModeOfSalary.jsp?did=<%=rs.getString("salarymode_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>

    </body>
</html>


