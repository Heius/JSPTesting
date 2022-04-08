<%-- 
    Document   : index
    Created on : Apr 8, 2022, 2:17:56 PM
    Author     : hieut
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="./search.jsp">
            <input type="text" name="user">
            <input type="submit" value="Search">
            
        </form>
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
                String sqlSt = "select * from customer";
                ResultSet rs = st.executeQuery(sqlSt);
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
