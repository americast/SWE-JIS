<%-- 
    Document   : newcase
    Created on : 12 Mar, 2018, 1:30:16 AM
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
        <title>Search</title>
    </head>
    <body>
        <form method="post" action="searchvalidate.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <thead>
                    <tr>
                        <th colspan="2">Search existing Case</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Keyword or CIN</td>
                        <td><input type="text" name="keyword" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Search" />
                            &nbsp;&nbsp;
                            <input type="reset" value="Reset" />
                        </td>                        
                    </tr>                    
                </tbody>
            </table>
            </center>
        </form>
        <form method="post" action="searchvalidate.jsp">
            <center>
            <table border="1" cellpadding="5" cellspacing="2">
                <input type="hidden" name="keyword" value="" />
                <input type="submit" value="View all cases" />
            </table>
            </center>
        </form>
    </body>
</html>