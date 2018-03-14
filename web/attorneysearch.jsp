<%-- 
    Document   : attorneysearch
    Created on : Mar 14, 2018, 9:43:38 PM
    Author     : americast
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Attorney Search</title>
    </head>
    <body>
        <%
            try {
                String keyword = request.getParameter("keyword");
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                
                PreparedStatement pst = conn.prepareStatement("Select * from login where (user like ? or realname like ? or type like ?);");
                pst.setString(1, "%" + keyword + "%");
                pst.setString(2, "%" + keyword + "%");
                pst.setString(3, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();

                while (rs.next()) {
                    String realname = rs.getString("realname");
                    String type = rs.getString("type");
                    out.println(realname+", "+type);
                    %><br><%
                   }
               } catch (Exception e) {
                   out.println("Something went wrong !! Please try again\n" + e);
               }
        %>
    </body>
</html>
