<%-- 
    Document   : logout
    Created on : Mar 13, 2018, 7:12:20 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="swejis.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to JIS!</title>
    </head>
    <body>
        You have been successfully logged out.
        <% user.name = null;%>
        <jsp:include page = "index.html"/>
    </body>
</html>
