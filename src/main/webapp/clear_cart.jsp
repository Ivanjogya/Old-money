<%
  session.removeAttribute("cart");
  response.sendRedirect("view_cart.jsp");
%>
