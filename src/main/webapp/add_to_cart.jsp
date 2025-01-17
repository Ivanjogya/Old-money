<%@ page import="java.util.*, java.util.HashMap" %>
<%
  // Retrieve the session cart or create a new one
  List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
  if (cart == null) {
    cart = new ArrayList<>();
  }

  // Retrieve product details from the form
  String productId = request.getParameter("product_id");
  String productName = request.getParameter("product_name");
  String price = request.getParameter("price");
  String quantity = request.getParameter("quantity");

  boolean productExists = false;
  for (Map<String, String> item : cart) {
    if (item.get("product_id").equals(productId)) {
      // Update the quantity if product already exists in the cart
      int newQuantity = Integer.parseInt(item.get("quantity")) + Integer.parseInt(quantity);
      item.put("quantity", String.valueOf(newQuantity));
      productExists = true;
      break;
    }
  }

  // Add a new product to the cart if it doesn't exist
  if (!productExists) {
    Map<String, String> cartItem = new HashMap<>();
    cartItem.put("product_id", productId);
    cartItem.put("product_name", productName);
    cartItem.put("price", price);
    cartItem.put("quantity", quantity);
    cart.add(cartItem);
  }

  // Update the session attribute
  session.setAttribute("cart", cart);

  // Redirect back to the previous page or cart view
  response.sendRedirect("view_cart.jsp");
%>
