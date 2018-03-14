<%-- 
    Document   : viewcalendar
    Created on : Mar 14, 2018, 8:31:45 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>
<jsp:include page = "calendar.jsp"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to case</title>
    </head>
    <body>
        <br><br>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                String type = request.getParameter("type");
                
                PreparedStatement pst;
                if (type.equals("personal"))
                    pst = conn.prepareStatement("select * from cases where ((lawyeruname=\'"+User.name+"\' or judgeuname=\'"+User.name+"\') and status = 'hearing');");
                else
                    pst = conn.prepareStatement("select * from cases where (status = 'hearing');");

                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id");
                    String details = rs.getString("details");
                    String date = rs.getString("date");
                    String lawyer = rs.getString("lawyer");
                    String defendant = rs.getString("defendant");
                    String crime = rs.getString("crime");
                    String status = rs.getString("status");
                    out.println("Id: " + id + "\tDetails: " + details + "\tDate: " + date + "\tLawyer: " + lawyer + "\tDefendant: " + defendant + "\tCrime: " + crime);
                    %><br><%if (type.equals("personal"))
                    {
                    %><form action="updatecase.jsp">
                    <input type="hidden" name="case" value="<%=id%>" /> 
                    <input type="hidden" name="status" value="<%=status%>" /> 
                    <input type="submit" value="View details"/>
                    </form><br><%
                    }
                }
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
        <br><br>
    </body>
</html>