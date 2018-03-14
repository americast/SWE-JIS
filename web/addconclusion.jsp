<%-- 
    Document   : addconclusion
    Created on : Mar 14, 2018, 7:42:28 PM
    Author     : americast
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add to case</title>
    </head>
    <body>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JIS?" + "user=root&password=root");
                int caseno = Integer.parseInt(request.getParameter("caseid"));
                int seqno = Integer.parseInt(request.getParameter("seqid"));
                String details = request.getParameter("details");
                
                PreparedStatement pst = conn.prepareStatement("update case"+caseno+" set details=\'"+details+"\' where seq = "+seqno+";");
                pst.executeUpdate();
                
                pst = conn.prepareStatement("update cases set status='open' where id = "+caseno+";");
                pst.executeUpdate();

                out.println("Update successful.");
            }
                
            catch(Exception e){
                out.println("Something went wrong !! Please try again\n"+e);       
            }   
        
        %>
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