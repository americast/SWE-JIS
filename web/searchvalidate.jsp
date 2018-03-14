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

<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Retention 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140221

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Retention</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Karla:400,700" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
<div id="wrapper">
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h2><a href="#">Judiciary Information System</a></h2>
				</div>
			<div id="banner"> <a href="#" class="image"><img src="images/pic01.jpg" alt="" /></a> </div>
		</div>
	</div>
	<div id="menu-wrapper">
		<div id="menu" class="container">
                    <ul>
				<li class="current_page_item"><a href="#">Software Engineering</a></li>
			</ul>
		</div>
		<!-- end #menu --> 
	</div>
	<div id="page" class="container">
		<div id="content">
			<div class="title">
                            <!Header here>
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

                <!Here footer>
                </div></div>
    		<div id="sidebar">
			<div class="box2">
				<div class="title">
					<h2>Search</h2>
				</div>
				<ul class="style2">
					<li></li>
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