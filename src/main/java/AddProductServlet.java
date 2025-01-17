import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddProductServlet")
@MultipartConfig(maxFileSize = 1024 * 1024 * 5)
public class AddProductServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String productName = request.getParameter("product_name");
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");
        Part imagePart = request.getPart("image");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try (Connection connection = DatabaseConnection.getConnection()) {

            if (productName == null || productName.isEmpty() ||
                    priceStr == null || priceStr.isEmpty() ||
                    quantityStr == null || quantityStr.isEmpty() ||
                    imagePart == null || imagePart.getSize() == 0) {
                throw new ServletException("All fields are required, including the image.");
            }

            long price;
            int quantity;

            try {
                price = Long.parseLong(priceStr);
                quantity = Integer.parseInt(quantityStr);
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid numeric value for price or quantity.");
            }

            InputStream imageInputStream = imagePart.getInputStream();

            // Updated SQL query without category_id
            String sql = "INSERT INTO product (product_name, color, size, price, quantity, image_blob) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";

            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, productName);
                statement.setString(2, color);
                statement.setString(3, size);
                statement.setLong(4, price);
                statement.setInt(5, quantity);
                statement.setBlob(6, imageInputStream);

                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) {
                    out.println("<h1>Product added successfully!</h1>");
                } else {
                    out.println("<h1>Failed to add the product.</h1>");
                }
            }
        } catch (SQLException e) {
            out.println("<h1>Database error occurred:</h1>");
            out.println("<pre>" + e.getMessage() + "</pre>");
            e.printStackTrace(out);
        } catch (ServletException e) {
            out.println("<h1>Error occurred:</h1>");
            out.println("<pre>" + e.getMessage() + "</pre>");
        } catch (Exception e) {
            out.println("<h1>An unexpected error occurred:</h1>");
            out.println("<pre>" + e.getMessage() + "</pre>");
            e.printStackTrace(out);
        }
    }
}
