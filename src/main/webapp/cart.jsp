<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
  
  List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
  if (cart == null) {
    cart = new ArrayList<>();
    session.setAttribute("cart", cart);
  }

  String productId = request.getParameter("product_id");
  String productName = request.getParameter("product_name");
  String productPrice = request.getParameter("price");

  if (productId != null && productName != null && productPrice != null) {
    Map<String, String> item = new HashMap<>();
    item.put("product_id", productId);
    item.put("product_name", productName);
    item.put("price", productPrice);
    cart.add(item);
  }

  response.sendRedirect("index.jsp");
%>
