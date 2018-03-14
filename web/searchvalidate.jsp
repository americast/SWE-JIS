<%-- 
    Document   : validate
    Created on : 12 Mar, 2018, 1:40:26 AM
    Author     : americast
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>

<body>
<%
    try{
        String keyword = request.getParameter("keyword");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");    
        PreparedStatement pst = conn.prepareStatement("Select * from cases where (id like ? or details like ?);");
        pst.setString(1, "%"+keyword+"%");
        pst.setString(2, "%"+keyword+"%");
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
           String status = rs.getString("status");
           out.println("Id: "+id+"\tDetails: "+details+"\tDate: "+date+"\tLawyer: "+lawyer+"\tDefendant: "+defendant+"\tCrime: "+crime);
           %><form method = "post" action="updatecase.jsp">
               <input type="hidden" name="case" value="<%=id%>" /> 
               <input type="hidden" name="status" value="<%=status%>" /> 
               <input type="submit" value="View details"/>
           </form><br><%
        }
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again\n"+e);       
   }     
%>

        <% if (!User.type.equals("judge"))
        {%>
        Create a new case.<br>
        <form method="post" action="createnewcase.jsp">
            Enter brief details: <input type="text" name="details" required/> <br>
            Enter name of defendant: <input type="text" name="defendant" required/> <br>
            Enter crime details: <input type="text" name="crime" required/> <br>
            <br>
            <input type="submit" value="Create new case" />
        </form>
        <%}%>
</body>
