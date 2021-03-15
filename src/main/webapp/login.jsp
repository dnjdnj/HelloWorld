<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.mysql.cj.xdevapi.PreparableStatement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: dnj
  Date: 2021/3/15
  Time: 15:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Class.forName("com.mysql.cj.jdbc.Driver");
    try(Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp?serverTimezone=UTC&characterEncoding=utf-8","root","123456")){
        String sql = "select * from borrow_card where username = ?";
        try(PreparedStatement statement = connection.prepareStatement(sql)){
            statement.setString(1,username);

            try(ResultSet resultSet = statement.executeQuery()){
                while (resultSet.next()){
                    if (password.equals(resultSet.getString("password"))){
                        response.sendRedirect("./main.jsp");
                    }else{
                        response.sendRedirect("./index.jsp");
                    }
                }
            }
        }


    }


%>
</body>
</html>
