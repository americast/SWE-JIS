<%-- 
    Document   : verify
    Created on : 12 Mar, 2018, 1:40:26 AM
    Author     : americast
--%>

<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>
<script>
   function alertName() {
    alert("Hello! I am an alert box!");
   }
</script>
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
        <script type="text/javascript"> window.onbeforeunload = alertName; </script>
           <jsp:forward page = "welcome.jsp"/>      
        <%}
        else
        {%>
           <jsp:forward page = "logout.jsp"/>
        <%}
   }
   catch(Exception e){       
       out.println(e);       
   }      
%>

                <!Here footer>
                </div></div>
    		<div id="sidebar">
			<div class="box2">
				<div class="title">
					<h2>Welcome <%=User.type%></h2>
				</div>
				<ul class="style2">
					<li><%=User.realname%></li>
				</ul>
			</div>
		</div>
	</div>
    </div>
	<div id="portfolio-wrapper">
		<div id="portfolio" class="container">
			<div id="column1">
				<div class="title">
					<h2>Sayan Sinha</h2>
				</div>
                            <p>16CS10048.</p></div>
	</div>
</div>
</body>
</html>