<%-- 
    Document   : welcome
    Created on : Mar 11, 2018, 1:23:18 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="swejis.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
    </head>
    <body>
        Hello, <%=User.name%>
        <br>
        
        <form action="search.jsp" method="get">
            <input type="submit" value="Create new case or search an existing case"/>
        </form>
        <form action="calendar.jsp" method="get">
            <input type="submit" value="View calendar"/>
        </form>
        <form action="logout.jsp" method="get">
            <input type="submit" value="Logout"/>
        </form>
    </body>
</html>
