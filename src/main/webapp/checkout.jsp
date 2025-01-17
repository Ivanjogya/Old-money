<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }
    body {
      font-family: 'Arial', sans-serif;
      background: linear-gradient(to bottom, #f5f5f5, #eae0c8);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    .container {
      width: 90%;
      max-width: 800px;
      background: #fff;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      padding: 20px;
      border-radius: 15px;
      text-align: center;
    }
    h1 {
      font-size: 24px;
      color: #333;
      margin-bottom: 20px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin: 20px 0;
    }
    table th, table td {
      padding: 12px;
      border: 1px solid #ccc;
      text-align: center;
      font-size: 14px;
    }
    table th {
      background: #f4f4f4;
      font-weight: bold;
    }
    table td {
      background: #fff;
    }
    .total {
      text-align: right;
      font-size: 18px;
      font-weight: bold;
      margin: 20px 0;
      color: #333;
    }
    .checkout-button {
      display: block;
      width: 100%;
      padding: 15px;
      background: #28a745;
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 18px;
      cursor: pointer;
      text-decoration: none;
      font-family: 'Arial', sans-serif;
    }
    .checkout-button:hover {
      background: #218838;
    }
    .empty-cart {
      font-size: 18px;
      color: #555;
      margin-top: 20px;
    }
    .empty-cart a {
      color: #007bff;
      text-decoration: none;
      font-weight: bold;
    }
    .empty-cart a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Checkout</h1>
  <%
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
    long totalPrice = 0;

    if (cart != null && !cart.isEmpty()) {
  %>
  <table>
    <thead>
    <tr>
      <th>Product Name</th>
      <th>Price</th>
      <th>Quantity</th>
      <th>Total</th>
    </tr>
    </thead>
    <tbody>
    <%
      for (Map<String, String> item : cart) {
        String productName = item.get("product_name");
        long price = Long.parseLong(item.get("price"));
        int quantity = Integer.parseInt(item.get("quantity"));
        long itemTotal = price * quantity;
        totalPrice += itemTotal;
    %>
    <tr>
      <td><%= productName %></td>
      <td><%= price %> $</td>
      <td><%= quantity %></td>
      <td><%= itemTotal %> $</td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
  <div class="total">
    Total Price: <%= totalPrice %> $
  </div>
  <form action="SubstractServlet.jsp" method="post">
    <input type="hidden" name="total_price" value="<%= totalPrice %>">
    <button type="submit" class="checkout-button">Place Order</button>
  </form>
  <%
  } else {
  %>
  <p class="empty-cart">Your cart is empty. <a href="index.jsp">Continue shopping</a></p>
  <%
    }
  %>
</div>
</body>
</html>
