<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Georgia', serif;
            background: linear-gradient(to bottom, #f5f5f5, #eae0c8);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .cart-container {
            background: #fffaf0;
            border: 2px solid #d8cbb5;
            border-radius: 15px;
            padding: 30px;
            width: 80%;
            max-width: 900px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .cart-container h1 {
            font-size: 28px;
            color: #4a3c31;
            font-weight: bold;
            margin-bottom: 20px;
            font-style: italic;
        }
        .decorative-line {
            margin: 0 auto 20px auto;
            height: 2px;
            width: 80%;
            background: #b09c7d;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table th, table td {
            padding: 10px;
            border: 1px solid #cbb79d;
            text-align: center;
        }
        table th {
            background: #eae0c8;
            font-weight: bold;
            color: #4a3c31;
        }
        table td {
            background: #fdf8f0;
            color: #4a3c31;
        }
        .total-price {
            font-size: 20px;
            font-weight: bold;
            color: #4a3c31;
            margin-bottom: 20px;
        }
        .cart-actions {
            text-align: center;
            margin-top: 20px;
        }
        .cart-actions a, .cart-actions button {
            text-decoration: none;
            font-family: 'Georgia', serif;
            background-color: #4a3c31;
            color: #fff;
            padding: 10px 20px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
        .cart-actions a:hover, .cart-actions button:hover {
            background-color: #3c3227;
        }
        .remove-button {
            background: #dc3545;
            color: #fff;
            padding: 5px 10px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
        }
        .remove-button:hover {
            background: #c82333;
        }
    </style>
</head>
<body>
<div class="cart-container">
    <h1>Your Cart</h1>
    <div class="decorative-line"></div>
    <%
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
    %>
    <p>Your cart is empty!</p>
    <a href="index.jsp" class="cart-actions">Continue Shopping</a>
    <%
    } else {
        DecimalFormat df = new DecimalFormat("#,##0.00");
        int totalPrice = 0;
    %>
    <table>
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <%
            for (Map<String, String> item : cart) {
                int itemTotal = Integer.parseInt(item.get("price")) * Integer.parseInt(item.get("quantity"));
                totalPrice += itemTotal;
        %>
        <tr>
            <td><%= item.get("product_name") %></td>
            <td><%= df.format(Double.parseDouble(item.get("price"))) %> $</td>
            <td><%= item.get("quantity") %></td>
            <td><%= df.format(itemTotal) %> $</td>
            <td>
                <form action="remove_from_cart.jsp" method="POST" style="display:inline;">
                    <input type="hidden" name="product_id" value="<%= item.get("product_id") %>" />
                    <button type="submit" class="remove-button">Remove</button>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
    <p class="total-price">Total Price: <%= df.format(totalPrice) %> $</p>
    <div class="cart-actions">
        <a href="index.jsp">Continue Shopping</a>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
