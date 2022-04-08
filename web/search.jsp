<%-- 
    Document   : search
    Created on : Apr 8, 2022, 1:00:36 PM
    Author     : hieut
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>Address</th>
            </tr>
            <% try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
                Statement st = con.createStatement();
                String name = request.getParameter("user");
                String sqlStr = "select * from customer where CName ='"+ name + "'";
                ResultSet rs = st.executeQuery(sqlStr);
                while(rs.next()){
                %>
                <tr>
                    <td><%=rs.getInt("PersonID")%></td>
                    <td><%=rs.getString("CName")%></td>
                    <td><%=rs.getInt("Age")%></td>
                    <td><%=rs.getString("Address")%></td>
                </tr>
                <% }
                }catch (Exception e){
                System.out.println(e.getMessage());
                }
                %>
        </table>
    </body>
</html>
