<%-- 
    Document   : closecase
    Created on : Mar 14, 2018, 7:50:39 PM
    Author     : TeamVideoSummarization
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Close case</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                int caseno = Integer.parseInt(request.getParameter("caseid"));
                int seqno = Integer.parseInt(request.getParameter("seqid"));
                
                PreparedStatement pst = conn.prepareStatement("update cases set status='closed' where id = "+caseno+";");
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