<%-- 
    Document   : updatecase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

<%@page import="swejis.Case"%>
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
                int caseno = Case.total_no;
                caseno++;
                String details = request.getParameter("details");
                String hearing_details = request.getParameter("hear");

                PreparedStatement pst = conn.prepareStatement("create table case"+caseno+"(seq int, details char(255))");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("insert into case"+caseno+" values (1, \'"+hearing_details+"\');");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("insert into cases values ("+caseno+", \'"+details+"\');");
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
