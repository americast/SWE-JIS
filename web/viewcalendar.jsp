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

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>JIS: Judiciary Information System</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Karla:400,700" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<!--[if IE 6]>
<link href="default_ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!For table>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
<!end for table>
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
				<li class="current_page_item"><a href="welcome.jsp">Home</a></li> <li class="current_page_item"> <a href="logout.jsp">Logout</a></li>
			</ul>
		</div>
		<!-- end #menu --> 
	</div>
	<div id="page" class="container">
		<div id="content">
			<div class="title">
                            <!Header here>
        <br><br>
        <form method="post" action="viewcalendar.jsp">
            <select name="type">
                <option value="central">Centralised calendar</option>
                <option value="personal">Personalised calendar</option>
            </select> 
            <input type="submit" value="View calendar" />
                    </form>

         <% String type = request.getParameter("type");
         if (type.equals("personal"))
         {%>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Details</th>
                        <th>Lawyer</th>
                        <th>Defendant</th>
                        <th>Crime</th>
                        <th></th>
                    </tr>
        <%}
         else
         {%>
                             <table>
                      <tr>
                              <th>ID</th>
                                         <th>Details</th>
                                         <th>Lawyer</th>
                                         <th>Defendant</th>
                                         <th>Crime</th>
                                          </th>
         <%}
        
            try {
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                
                
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
//                    out.println("Id: " + id + "\tDetails: " + details + "\tDate: " + date + "\tLawyer: " + lawyer + "\tDefendant: " + defendant + "\tCrime: " + crime);
        %>
        <tr>
            <td><%=id%></td>
            <td><%=details%></td>
            <td><%=lawyer%></td>
            <td><%=defendant%></td>
            <td><%=crime%></td>
                <%            
        
        %><%if (type.equals("personal"))
                    {
                        %><td><form action="updatecase.jsp">
                    <input type="hidden" name="case" value="<%=id%>" /> 
                    <input type="hidden" name="status" value="<%=status%>" /> 
                    <input type="submit" value="View details"/>
                    </form></td><%
                    }%></tr><%
                }
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
                             </table>
        <br><br>

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