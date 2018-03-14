<%-- 
    Document   : updatecase
    Created on : Mar 13, 2018, 9:32:04 PM
    Author     : americast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update case</title>
    </head>
    <body>
        <%
            String caseno = request.getParameter("case");
            String status = request.getParameter("status");
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
            if (status.equals("open"))
            {
                
        %>
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

    </body>
</html>
