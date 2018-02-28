<%-- 
    Document   : bankRegistration
    Created on : Feb 14, 2018, 11:05:39 AM
    Author     : mypc
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::BankRegistration</title>
    </head>
    <body>
        <%
          String BankId="",BankName="",BankCode=""; 
           if(request.getParameter("btnsub")!=null)
          {
            
            if(!request.getParameter("hid").equals(""))
            {
                String bankname=request.getParameter("txtbankname");
                 String code=request.getParameter("txtcode"); 
               String upQry="update tbl_banktype set banktype_name ='"+bankname+"',banktype_code='"+code+"' where banktype_id="+request.getParameter("hid");
               boolean b=obj.executeCommand(upQry);
                   if(b==true)
                       {
                           out.println("Sucess");
                           response.sendRedirect("bankRegistration.jsp");
                       }
                       else
                       {
                           out.println("Failed");
                       }
                
            }

            else
        
            {
              String bankname=request.getParameter("txtbankname");
              String code=request.getParameter("txtcode");
            String insQry="insert into tbl_banktype(banktype_name,banktype_code) values('"+bankname+"','"+code+"')";

            boolean b=obj.executeCommand(insQry);
           
           if(b==true)
           {
               out.println("Sucess");
               response.sendRedirect("bankRegistration.jsp");
           }
           else
           {
               out.println("failed");
           }
        }
        }
           
           if(request.getParameter("delid")!=null)
      {
          String del="delete from tbl_banktype where banktype_id='"+request.getParameter("delid")+"'";
          boolean b=obj.executeCommand(del);
          response.sendRedirect("bankRegistration.jsp");
      }
           
           
        if(request.getParameter("edid")!=null)
     {
         String selq="select * from tbl_banktype where banktype_id='"+request.getParameter("edid")+"'";
         ResultSet rs1=obj.selectCommand(selq);
         
         if(rs1.next())
         {
             BankId=rs1.getString("banktype_id");
             BankName=rs1.getString("banktype_name");
             BankCode=rs1.getString("banktype_code");
         }
     }
        %>
       
      <form name="formBankReg">
            <input type="hidden" value="<%=BankId%>" name="hid">
               <h1 align="center">Bank Registration</h1>
        <table align="center">
            <tr>
                <td>
                Bank Name:
                </td>
              <td>
                <input type="text" name="txtbankname" value="<%=BankName%>">
              </td>
            </tr>
            
            <tr>
                <td>
                Bank Code:
                </td>
            <td>
                <input type="text" name="txtcode" value="<%=BankCode%>">
            </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    
                    <td>
                        <input type="submit" value="submit" name="btnsub">
                    </td>
                </tr>
                          
        </table>
        
        <table border="1" align="center">
            <th>Sl No</th>
             <th>Bank Name</th>
             <th>Bank Code</th>
             <%
                    int i = 1;
                    String sel = "select * from tbl_banktype";
                    ResultSet rs = obj.selectCommand(sel);
                    while (rs.next()) 
                        {
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("banktype_name")%></td>
                    <td><%=rs.getString("banktype_code")%></td>
                    
                    <td><a href="bankRegistration.jsp?edid=<%=rs.getString("banktype_id")%>">Edit</a></td><br>
                    <td><a href="bankRegistration.jsp?delid=<%=rs.getString("banktype_id")%>">Delete</a></td><br>
                </tr>
                <%
                        i++;
                    }
                %>
            
                </table>
        </form>
    </body>
</html>
