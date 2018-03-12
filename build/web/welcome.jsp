<%-- 
    Document   : welcome
    Created on : Mar 11, 2018, 1:23:18 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
    </head>
    <body>
        <% String uname;
        uname = request.getParameter("uname");
        %>
        Hello, <%=uname%>
        <br>
        
        <form action="newcase.jsp" method="get">
            <input type="submit" value="Create new case or search an existing case"/>
        </form>
        <form action="calendar.jsp" method="get">
            <input type="submit" value="View calendar"/>
        </form>
    </body>
</html>
