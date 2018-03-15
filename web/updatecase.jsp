<%-- 
    Document   : updatecase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

<%@page import="swejis.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>
<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : JIS: Judiciary Information System 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20140221

-->
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
        <%
            String caseno = request.getParameter("case");
            String status = request.getParameter("status");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                PreparedStatement pst = conn.prepareStatement("Select * from cases where id='"+caseno+"';");
                ResultSet rs = pst.executeQuery();
                while (rs.next())
                    status = rs.getString("status");
            }
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
            int seqlast = 1;
            try {   
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                PreparedStatement pst = conn.prepareStatement("Select * from case"+caseno+";");
                ResultSet rs = pst.executeQuery();
                while(rs.next()){
                        int seq = rs.getInt("seq");
                        String details = rs.getString("details");
                        String judge = rs.getString("judge");
                        String prosecutor = rs.getString("prosecutor");
                        String date = rs.getString("date");
                        out.println("Seq: "+seq+"\t Details: "+details+"\tDate: "+date+"\tJudge: "+judge+"\tProsecutor: "+prosecutor);
                        seqlast = seq;
        %><br><%
                    
                }
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
        <br><br>
        <%
            if (!status.equals("closed"))
            {
                
        %>
        <%if (!User.type.equals("judge"))
        {%>
        Add a new hearing.<br>
        <form method="post" action="addtocase.jsp">
            Enter date of hearing (DD-MM-YY): <input type="text" name="day" maxlength="2" size="2" required/> - <input type="text" name="month" maxlength="2" size="2" required/> - <input type="text" name="year" maxlength="2" size="2" required/><br>
            Enter name of prosecutor: <input type="text" name="prosecutor" required/><br>
            Choose judge:
            <select name="judge">
                <%
                    try {
                            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                            PreparedStatement pst = conn.prepareStatement("Select * from login where type='judge';");
                            ResultSet rs = pst.executeQuery();
                            while (rs.next()) {
                                    String realname = rs.getString("realname");
                                    String name = rs.getString("user");
                    %>
                            <option value="<%=name%>"> <%=realname%> </option>
                <%          }
                } catch (Exception e) {
                    out.println("Something went wrong !! Please try again.\n" + e);
            } 
            %>
            </select><br>
            <input type="hidden" name="details" value="(pending)"/><br>
            <input type="hidden" name="seqid" value="<%=seqlast%>">
            <input type="hidden" name="caseid" value="<%=caseno%>">
            <input type="submit" value="Add hearing" />
        </form>
            <%
         }
        else if (status.equals("hearing"))
        {
        %>
        
        <form method="post" action="addconclusion.jsp">
         Add a conclusion to last hearing:   <input type="text" name="details" required/><br>
         <input type="hidden" name="seqid" value="<%=seqlast%>">
         <input type="hidden" name="caseid" value="<%=caseno%>">
         <input type="submit" value="Update" />
        </form>
        <%
        }%>
        <% if (!status.equals("closed"))
        {%>
        <form method="post" action="closecase.jsp">
            <input type="hidden" name="seqid" value="<%=seqlast%>">
            <input type="hidden" name="caseid" value="<%=caseno%>">
            <input type="submit" value="Close case" />
        </form>
        <%
        }%>
        <%}%>

                <!Here footer>
                </div></div>
    		<div id="sidebar">
			<div class="box2">
				<div class="title">
					<h2>Update case</h2>
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