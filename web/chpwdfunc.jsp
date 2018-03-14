<%-- 
    Document   : chpwdfunc
    Created on : Mar 14, 2018, 9:24:25 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="swejis.*" %>

<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change password</title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>
<%
    try{
        String oldpwd = request.getParameter("oldpwd");   
        String newpwd = request.getParameter("newpwd");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select * from login where user=? and pass=?");
        pst.setString(1, User.name);
        pst.setString(2, oldpwd);
        ResultSet rs = pst.executeQuery();              
        if(rs.next())
        {
            pst = conn.prepareStatement("update login set pass='"+newpwd+"' where user = '" + User.name + "';");
            pst.executeUpdate();
            out.println("Password changed.");
        }
        else
            out.println("Old password incorrect.");
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>
    </body>
</html>
