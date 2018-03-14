<%-- 
    Document   : validate
    Created on : 12 Mar, 2018, 1:40:26 AM
    Author     : americast
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>
<body>
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
           Case.total_no = id;
           String details = rs.getString("details");
           String date = rs.getString("date");
           String lawyer = rs.getString("lawyer");
           String defendant = rs.getString("defendant");
           String crime = rs.getString("crime");
           out.println("Id: "+id+"\tDetails: "+details+"\tDate: "+"\tLawyer: "+lawyer+"\tDefendant: "+defendant+"\tCrime: "+crime);
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
        Create a new case.<br>
        <form method="post" action="createnewcase.jsp">
            Enter brief details: <input type="text" name="details" required/> <br>
            Enter name of defendant: <input type="text" name="defendant" required/> <br>
            Enter crime details: <input type="text" name="crime" required/> <br>
            <br>
            <input type="submit" value="Create new case" />
        </form>
</body>
