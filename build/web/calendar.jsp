<%-- 
    Document   : calendar
    Created on : Mar 11, 2018, 5:51:15 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
    </head>
    <body>
        <form method="post" action="viewcalendar.jsp">
            <select name="type">
                <option value="central">Centralised calendar</option>
                <option value="personal">Personalised calendar</option>
            </select> 
            <input type="submit" value="View calendar" />
        </form>
    </body>
</html>
