<%-- 
    Document   : UserRegistration
    Created on : Feb 14, 2018, 11:19:06 AM
    Author     : mypc
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
      
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>lendingTree::UserRegistration</title>
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
    String  selDist="",Place="",username="",Dob="",Gender="",Address="",Email="",pin="",contact="",Username="",Password="",status="",logid="",idtype="",idno="";
   
   Place=request.getParameter("seledis");
   idtype=request.getParameter("ddltype");
   idno=request.getParameter("txtname");
   pin=request.getParameter("txtpin");
   contact=request.getParameter("txtcontact");
    username=request.getParameter("txtname");
    Dob=request.getParameter("txtdob");
    Gender=request.getParameter("gender");
   Address=request.getParameter("txtaddrs");
    Email=request.getParameter("txtemail");
    Username=request.getParameter("txtuname");
    Password=request.getParameter("txtpass");
    
    if (request.getParameter("btnsub")!= null) 
    {
    String insQry1="insert into tbl_login(username,password,u_type) values('"+Username+"','"+Password+"',1)";
   boolean b=obj.executeCommand(insQry1);
   if(b==true)
   {
     String sel="select max(login_id) as logid from tbl_login"; 
     ResultSet rs=obj.selectCommand(sel);
     while(rs.next())
     {
          logid=rs.getString("logid");
     }
   }
    
    
    String insQry="insert into tbl_userregistration(user_name,user_dob,user_gender,user_homeaddress,user_pin,user_email,user_phno,user_status,login_id,user_idtype,user_idnumber,city_id)values('"+username+"','"+Dob+"','"+Gender+"','"+Address+"','"+pin+"','"+Email+"','"+contact+"',0,'"+logid+"','"+idtype+"','"+idno+"','"+Place+"')";
     boolean b1 = obj.executeCommand(insQry);
     if (b1==true) 
                    {
                        response.sendRedirect("UserRegistration.jsp");
                    } else 
                    {
                        out.println(insQry);
                    }
                }
            
    
    %>

   
        <h1 align="center">USER REGISTRATION</h1>
        <form method="post">
        <table align="center">
            <tr>
                    <td>Name:</td>
                    <td><input type="text" name="txtname"  required /></td>
                </tr>
            
            <tr>
                    <td>DOB:</td>
                    <td><input type="date" name="txtdob" required /></td>
                </tr>
            <tr>
                    <td>Contact:</td>
                    <td><input type="number" name="txtcontact"  pattern="/d{10}/" required /></td>
                </tr>
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
                    <td>Address:</td>
                    <td><input type="text" name="txtaddrs"  required /></td>
                </tr>
            
            <tr>
                <td>PIN No:</td>
                <td><input type="text" name="txtpin" ></td>
            </tr>
            
            
           <tr>
                    <td> Email:</td>
                    <td><input type="email" name="txtemail"  required /></td>
           </tr>
            
           <tr>
                    <td>Gender:</td>
                    <td><input type="radio" name="gender" value="male"  required />Male
                        <input type="radio" name="gender" value="female"  required />Female</td>
                </tr>
                
               
            
            <tr>
                <td>ID Type</td>
                <td><select name="ddltype">
                        <option>.....select.....</option>
                        <option>Voter ID</option>
                        <option>Aadar No</option>
                        <option>PAN No</option>
                    </select></td>
            </tr>
            
             <tr>
                <td>ID Number </td>
                <td><input type="text" name="txtname"></td>
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
                         <input type="submit" name="btnsub" value="REGISTER"  required />
                         
                    </td>
                </tr>
            
           </table>
                  
        </form>

</body>
</html>

