<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
    // Retrieve the product ID to remove
    String productId = request.getParameter("product_id");

    // Retrieve the cart from the session
    List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");

    if (cart != null && productId != null) {
        // Iterate through the cart to find the product with the matching ID
        for (int i = 0; i < cart.size(); i++) {
            Map<String, String> item = cart.get(i);
            if (productId.equals(item.get("product_id"))) {
                // Remove the product from the cart
                cart.remove(i);
                break;
            }
        }
        // Update the session attribute
        session.setAttribute("cart", cart);
    }

    // Redirect back to the cart page
    response.sendRedirect("view_cart.jsp");
%>
