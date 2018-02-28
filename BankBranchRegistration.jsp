<%-- 
    Document   : Bank
    Created on : 14 Feb, 2018, 2:14:56 PM
    Author     : HP
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <head>
       
              
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LendingTree::BankType</title>
        
        <script src="jquery.js" type="text/javascript"></script>
            <script>
            function getclick(a)
            {

                $.ajax(
                        {
                            url: "ajax_city.jsp?id=" + a,
                            success: function(result)
                            {
                                $("#dis").html(result);
                            }
                        });
            }

        </script>
    </head>
    
    <body>
         <%
             String selDist="",selBankName="";
        String Place="",logid="",BankName="",BankBranchId="",BranchName="",BranchEmail="",BranchAddress="",BranchCode="",BranchPhno="",BranchUsername="",BranchPassword="";    
        
            Place=request.getParameter("seledis");
            BankName=request.getParameter("selbankname");
            BranchName=request.getParameter("txtbranch");
            BranchEmail=request.getParameter("txtemail");
            BranchAddress=request.getParameter("txtaddrs");
            BranchCode=request.getParameter("txtcode");
            BranchPhno=request.getParameter("txtcontact");
            BranchUsername=request.getParameter("txtuname");
            BranchPassword=request.getParameter("txtpass");
            
            if (request.getParameter("btnsub") != null) 
            {

                    String insQry1 = "insert into tbl_login(username,password,u_type) values('" + BranchUsername + "','" + BranchPassword + "',2)";
                    boolean b = obj.executeCommand(insQry1);
                    if (b == true)
                    {
                        String sel = "select max(login_id) as logid from tbl_login";
                        ResultSet rs = obj.selectCommand(sel);
                        while (rs.next()) 
                        {
                            logid = rs.getString("logid");
                        }
                    }

                    String insQry = "insert into tbl_bankbranch(banktype_id,login_id,city_id,bankbranch_name,branch_address,bankbranch_phno,bankbranch_email,bankbranch_code) values('" + BankName + "','" + logid + "','" + Place + "','" + BranchName + "','" + BranchAddress + "','" + BranchPhno + "','" + BranchEmail + "','"+BranchCode+"')";
                    boolean b1 = obj.executeCommand(insQry);
                    if (b1 == true) 
                    {
                        response.sendRedirect("BankBranchRegistration.jsp");
                    } 
                    else 
                    {
                        out.println(insQry);
                    }
                }
              
            %>
        
         <h1 align="center">Bank Branch Registration</h1>
         <form >
          <table align="center">
               <tr>
                    <td>Place:</td>
                            <td>
                                <select name="seldistrict" onchange="getclick(this.value)">
                                    <option>---select district---</option>
                                    <%
                                        String selp="select * from tbl_district";
                                        ResultSet rsp=obj.selectCommand(selp);
                                        while(rsp.next())
                                        {
                                          String id=rsp.getString("district_id");   
                                        %>
                                        <option <%if(selDist.equals(id)){%> selected="" <%}%> value="<%=rsp.getString("district_id")%>"><%=rsp.getString("district_name")%></option>
                                        <%    
                                        }
                                        %>
                                    
                                </select>
                            </td>
                </tr>
                 
                <tr>
                    <td>
                        City
                    </td>
                    <td>
                        <select name="seledis" id="dis">
                             <option value="sel">--select--</option>
                            
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Bank Name:</td>
                            <td>
                                <select name="selbankname">
                                    <option>---select Bank---</option>
                                    <%
                                        String selbank="select * from tbl_banktype";
                                        ResultSet rs=obj.selectCommand(selbank);
                                        while(rs.next())
                                        {
                                          String id=rs.getString("banktype_id");   
                                        %>
                                        <option <%if(selBankName.equals(id)){%> selected="" <%}%> value="<%=rs.getString("banktype_id")%>"><%=rs.getString("banktype_name")%></option>
                                        <%    
                                        }
                                        %>
                                    
                                </select>
                            </td>
                </tr>
                
                
                 <tr>
                    <td>Branch:</td>
                    <td><input type="text" name="txtbranch"  required /></td>
                </tr>
                 <tr>
                    <td> Email:</td>
                    <td><input type="email" name="txtemail"  required /></td>
                </tr>
                
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="txtaddrs"  required /></td>
                </tr>
                
                <tr>
                    <td>Contact:</td>
                    <td><input type="number" name="txtcontact"  pattern="/d{10}/" required /></td>
                </tr>
                
                <tr>
                <td>Branch Code:</td>
                <td><input type="text" name="txtcode" ></td>
            </tr>
            
              <tr>
                    <td>Username:</td>
                    <td><input type="text" name="txtuname"  required /></td>
            </tr>
         <tr>
                    <td>Password:</td>
                    <td><input type="password"  name="txtpass"  required /></td>
         </tr>
                
                <tr>
                     <td colspan="2" align="center">
                         <input type="submit" name="btnsub" value="REGISTER"/>
                         
                    </td>
                </tr>
            
                
          </table>    
         </form>
             
    </body>
</html>
