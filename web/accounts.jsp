<%-- 
    Document   : accounts
    Created on : Mar 16, 2018, 4:53:17 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="swejis.*" %>

<% if (User.name == null) {
%>
<jsp:forward page = "index.html"/>
<%}%>
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
