<%-- 
    Document   : BranchApproval
    Created on : Feb 21, 2018, 2:28:40 PM
    Author     : mypc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lendingtree::BranchApproval</title>
    </head>
    <body >
         <h1 align="center">BANK BRANCH APPROVAL </h1>
         <form name="adminapprove" >
        <table border="1" align="center">
            <tr>
                <th>Sl.No</th>
                <th>Bank Name</th>
                <th>Branch</th>
                <th>Address</th>
                <th>Place</th>
                <th>Branch Code</th>
                <th>Contact No</th>
                <th>Email</th>
                <th>Operations</th>
                
                <%int i=1;
                String sel="select * from tbl_bankbranch b inner join tbl_city c on b.city_id=c.city_id inner join tbl_banktype bt on b.banktype_id=bt.banktype_id ";
                 ResultSet rs=obj.selectCommand(sel);
                 while(rs.next())
                     {
               %>
               
               <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("banktype_name")%></td> 
                    <td><%=rs.getString("bankbranch_name")%></td> 
                    <td><%=rs.getString("branch_address")%></td> 
                    <td><%=rs.getString("city_name")%></td> 
                    <td><%=rs.getString("bankbranch_code")%></td> 
                    <td><%=rs.getString("bankbranch_phno")%></td> 
                    <td><%=rs.getString("bankbranch_email")%></td> 
                    
                    <td><a href="BranchApproval.jsp?aid=<%=rs.getString("bankbranch_id")%>">APPROVE</a> &nbsp;
                    <a href="BranchApproval.jsp?did=<%=rs.getString("bankbranch_id")%>">REJECTED</a></td>
                    </tr>
                <%i++;}
                
                
                %>    
                
           
        </table>
         </form>
    </body>
   
</html>
