<%-- 
    Document   : validate
    Created on : 12 Mar, 2018, 1:40:26 AM
    Author     : americast
--%>

<%@ page import ="java.sql.*" %>
<%
    try{
        String keyword = request.getParameter("keyword");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select * from cases where details like ?");
        pst.setString(1, "%"+keyword+"%");
        ResultSet rs = pst.executeQuery();
        
        while(rs.next())
        {
           int id = rs.getInt("id");
           String details = rs.getString("details");
           out.print("Id: "+id+"\tDetails: "+details);
           %><form action="updatecase.jsp">
               <input type="hidden" name="case" value="<%=id%>" /> 
               <input type="submit" value="View details"/>
           </form><br><%
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again\n"+e);       
   }      
%>