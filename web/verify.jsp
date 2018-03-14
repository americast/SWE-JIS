<%-- 
    Document   : verify
    Created on : 12 Mar, 2018, 1:40:26 AM
    Author     : americast
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<%
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select * from login where user=? and pass=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();              
        if(rs.next())
        {
            
            User.name = username;
            User.type = rs.getString("type");
            User.realname = rs.getString("realname");
            if (User.type.equals("lawyer"))
                User.subscription = rs.getString("subscription");
            else
                User.subscription = "yes";
            out.println(username);
        %>
           <jsp:forward page = "welcome.jsp"/>      
        <%}
        else
        {%>
           Authentication failure.
           <jsp:include page = "index.html"/>
        <%}
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>