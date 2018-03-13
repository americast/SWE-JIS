<%-- 
    Document   : updatecase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to case</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                int caseno = Integer.parseInt(request.getParameter("caseid"));
                int seqno = Integer.parseInt(request.getParameter("seqid"));
                String details = request.getParameter("details");
                
                PreparedStatement pst = conn.prepareStatement("insert into case"+caseno+" values ("+(seqno+1)+", \'"+details+"\');");
                pst.executeUpdate();
                out.println("Update successful.");
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
        <br><br>
    </body>
</html>
