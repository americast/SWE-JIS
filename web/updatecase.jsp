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
        <title>Update case</title>
    </head>
    <body>
        <%
            String caseno = request.getParameter("case");
            int seqlast = 1;
            try {   
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                PreparedStatement pst = conn.prepareStatement("Select * from case"+caseno+";");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                        int seq = rs.getInt("seq");
                        String details = rs.getString("details");
                        out.println("Seq: "+seq+"\t Details: "+details);
                        seqlast = seq;
        %><br><%
                    
                }
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
        <br><br>
        Update this case.<br>
        <form method="post" action="addtocase.jsp">
            Enter details: <input type="text" name="details" required/>
            <input type="hidden" name="seqid" value="<%=seqlast%>">
            <input type="hidden" name="caseid" value="<%=caseno%>">
            <input type="submit" value="Update" />
        </form>
    </body>
</html>
