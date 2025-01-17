<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

  String dbURL = "jdbc:mysql://localhost:3306/online_shop?maxAllowedPacket=104857600";
  String dbUser = "root";
  String dbPassword = "admin";

  List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

  if (cart != null) {
    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

      String updateQuery = "UPDATE product SET quantity = quantity - ? WHERE product_id = ? AND quantity >= ?";

      for (Map<String, String> item : cart) {
        int productId = Integer.parseInt(item.get("product_id"));
        int quantity = Integer.parseInt(item.get("quantity"));

        try (PreparedStatement statement = connection.prepareStatement(updateQuery)) {
          statement.setInt(1, quantity);
          statement.setInt(2, productId);
          statement.setInt(3, quantity);
          statement.executeUpdate();
        }
      }

      session.removeAttribute("cart");

      session.setAttribute("successMessage", "Purchase successful!");
      connection.close();
    } catch (Exception e) {
      e.printStackTrace();
      session.setAttribute("errorMessage", "Error processing your purchase. Please try again.");
    }
  }

  response.sendRedirect("checkout.jsp");
%>
