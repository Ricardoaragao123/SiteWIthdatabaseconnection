<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>exercicio 3 Ricardo</title>
</head>
<body>
<h1>Create Author</h1>

<%!
    // Método para estabelecer a conexão com o banco de dados
    private Connection getConnection() throws SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/biblioteca";
        String username = "root";
        String password = "4965";
        return DriverManager.getConnection(jdbcUrl, username, password);
    }
%>

<%!
    private void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<%!
    private void createAuthor(int id, String name, String email, String gender) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();

            String sql = "INSERT INTO author (id, name, email, gender) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setString(4, gender);

            statement.executeUpdate();
        } finally {
            closeConnection(connection);
            if (statement != null) {
                statement.close();
            }
        }
    }
%>

<%!
    private void createBook(int id, String title, float price, int quantity) throws SQLException {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = getConnection();

            String sql = "INSERT INTO book (id, title, price, quantity) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            statement.setString(2, title);
            statement.setFloat(3, price);
            statement.setInt(4, quantity);

            statement.executeUpdate();
        } finally {
            closeConnection(connection);
            if (statement != null) {
                statement.close();
            }
        }
    }
%>

<%
    if (request.getMethod().equals("POST")) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        try {
            createAuthor(id, name, email, gender);
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
%>

<%
    if (request.getMethod().equals("POST")) {
        int id = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        float price = Float.parseFloat(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        try {
            createBook(id, title, price, quantity);
            response.sendRedirect("success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
%>

<form method="post" action="">
    <label for="id">Author ID:</label>
    <input type="text" id="id" name="id"><br>

    <label for="name">Author Name:</label>
    <input type="text" id="name" name="name"><br>

    <label for="email">Author Email:</label>
    <input type="text" id="email" name="email"><br>

    <label for="gender">Author Gender:</label>
    <input type="text" id="gender" name="gender"><br>

    <input type="submit" value="Create Author">
</form>

<hr>

<form method="post" action="">
    <label for="bookId">Book ID:</label>
    <input type="text" id="bookId" name="bookId"><br>

    <label for="title">Book Title:</label>
    <input type="text" id="title" name="title"><br>

    <label for="price">Book Price:</label>
    <input type="text" id="price" name="price"><br>

    <label for="quantity">Book Quantity:</label>
    <input type="text" id="quantity" name="quantity"><br>

    <input type="submit" value="Create Book">
</form>
</body>
</html>
