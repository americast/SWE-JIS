<%-- 
    Document   : addtocase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

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
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                int caseno = Integer.parseInt(request.getParameter("caseid"));
                int seqno = Integer.parseInt(request.getParameter("seqid"));
                String details = request.getParameter("details");
                String day = request.getParameter("day");
                String month = request.getParameter("month");
                String year = request.getParameter("year");
                String prosecutor = request.getParameter("prosecutor");
                String judge = request.getParameter("judge");
                
                PreparedStatement pst = conn.prepareStatement("select * from login where user=\'"+judge+"\';");
                ResultSet rs = pst.executeQuery();

                String judge_name="";
                while (rs.next())
                  judge_name = rs.getString("realname");
                
                
                pst = conn.prepareStatement("insert into case"+caseno+" values ("+(seqno+1)+", \'"+details+"\', \'"+judge_name+"\', \'"+prosecutor+"\', \'"+day+"-"+month+"-"+year+"\');");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("update cases set status='hearing' where id = " + caseno + ";");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("update cases set judgeuname=\'"+judge+"\' where id = " + caseno + ";");
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
