<%-- 
    Document   : welcome
    Created on : Mar 11, 2018, 1:23:18 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="swejis.*" %>
<% if (User.name==null) {
    %>
    <jsp:forward page = "index.html"/>
    <%}%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome!</title>
    </head>
    <body>
        Hello, <%=User.realname%> (<%=User.type%>)
        <br>
        <%if(User.subscription.equals("no"))
        {
            out.println("Invalid subscription. Please contact registrar.");
            %><form action="search.jsp" method="get">
            <input type="submit" value="Create new case or search an existing case" disabled/>
            </form>
            <%
        }
        else
        {%>
        <form action="search.jsp" method="get">
            <input type="submit" value="Create new case or search an existing case"/>
        </form>
        <%}%>
        <form action="calendar.jsp" method="get">
            <input type="submit" value="View calendar"/>
        </form>
        <form action="chpwd.jsp" method="get">
            <input type="submit" value="Change password"/>
        </form>
        <form action="logout.jsp" method="get">
            <input type="submit" value="Logout"/>
        </form>
    </body>
</html>
