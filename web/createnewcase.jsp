<%-- 
    Document   : updatecase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

<%@page import="swejis.Case"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to case</title>
    </head>
    <body>
        <%
            try {
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                int caseno = Case.total_no;
                caseno++;
                String details = request.getParameter("details");
                String crime = request.getParameter("crime");
                String defendant = request.getParameter("defendant");

                PreparedStatement pst = conn.prepareStatement("create table case"+caseno+"(seq int, details char(255), judge char(25), prosecutor char(25), date char(30));");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("insert into cases values ("+caseno+", \'"+details+"\',\'"+(new java.util.Date()).toLocaleString()+"\', \'"+defendant+"\', \'"+User.realname+"\', \'"+crime+"\',\'open\', \'"+User.name+"\', NULL);");
                pst.executeUpdate();
                
                out.println("New case creation successful.");
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
        <br><br>
    </body>
</html>
