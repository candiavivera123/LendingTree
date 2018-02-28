<%-- 
    Document   : ProfessionTypeDetails
    Created on : Feb 13, 2018, 11:34:35 AM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::Profession</title>
    </head>
    <body>
        <%
        
            String typename = "";
            String pid = "";

            if (request.getParameter("eid") != null)
            {
                String sel = "select * from tbl_professiontype where professiontype_id='" + request.getParameter("eid") + "'";
                ResultSet rs = obj.selectCommand(sel);
                if (rs.next()) 
                {
                    pid = rs.getString("professiontype_id");
                    typename = rs.getString("typename");

                }
            }


               if (request.getParameter("submit") != null) 
        {
                String Pname = request.getParameter("txtptype");
                if (request.getParameter("hid") != "") 
                {
                    String up = "update tbl_professiontype set typename='" + Pname + "' where professiontype_id='" + request.getParameter("hid") + "'";
                    boolean b1 = obj.executeCommand(up);
                    if (b1) 
                    {
                        response.sendRedirect("ProfessionTypeDetails.jsp");
                    } else 
                    {
                        out.println(up);
                    }
                } 
                else 
                {
                    String name=request.getParameter("txtptype");
                    String ins = "insert into tbl_professiontype(typename)values('" + name + "')";
                    boolean b = obj.executeCommand(ins);
                    if (b) 
                    {
                        response.sendRedirect("ProfessionTypeDetails.jsp");
                    } else 
                    {
                        out.println(ins);
                    }
                }
            }

        
                if (request.getParameter("did") != null) 
                {
                String del = "delete from tbl_professiontype where professiontype_id='" + request.getParameter("did") + "'";
                obj.executeCommand(del);
                }

        %>

        <form name="frmprofessiontype">
            <input type="hidden" value="<%=pid%>" name="hid">

            <table align="center">
                <tr>
                    <td>
                        ProfessionType Name:
                    </td>
                    <td>
                        <input type="text" name="txtptype" value="<%=typename%>">
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
                <th>ProfessionType</th>

                <%
                    int i = 1;
                    String sel = "select * from tbl_professiontype";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("typename")%></td>
                    <td><a href="ProfessionTypeDetails.jsp?eid=<%=rs.getString("professiontype_id")%>">Edit</a></td><br>
                    <td><a href="ProfessionTypeDetails.jsp?did=<%=rs.getString("professiontype_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            </table>

            
        </form>

    </body>
</html>


