<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Old Money</title>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: 'Georgia', serif;
        background-color: #fff;
        color: #333;
      }
      nav {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        background-color: #fff;
        border-bottom: 1px solid #ddd;
      }
      nav .menu {
        display: flex;
        gap: 30px;
      }
      nav .menu a {
        text-decoration: none;
        font-size: 1rem;
        color: #2d4e5e;
        font-weight: 600;
      }
      nav .menu a:hover {
        color: #007bff;
      }
      .hero {
        position: relative;
        width: 100%;
        height: auto;
        background-image: url('images/image.jpg');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        aspect-ratio: 21/9;
      }
      .hero-overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
      }
      .hero-overlay .video-container {
        height: 100%;
        width: 100%;
      }
      .hero-overlay .video-container .video {
        height: 100%;
        width: 100%;
        object-fit: cover;
      }
      .hero-content {
        position: absolute;
        bottom: 20px;
        text-align: center;
        color: #fff;
        z-index: 2;
        padding: 20px;
      }
      .hero-content h1 {
        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 20px;
      }
      .hero-content button {
        padding: 10px 20px;
        font-size: 1rem;
        background-color: #fff;
        color: #2d4e5e;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: 600;
        transition: background-color 0.3s;
      }
      .hero-content button:hover {
        background-color: #2d4e5e;
        color: white;
      }
      .categories {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 10px;
        padding: 20px;
        background-color: #f9f9f9;
      }
      .categories button {
        padding: 10px 15px;
        font-size: 1rem;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 5px;
        color: #2d4e5e;
        cursor: pointer;
        font-weight: 500;
        transition: all 0.3s;
      }
      .categories button:hover {
        background-color: #2d4e5e;
        color: white;
        border-color: #2d4e5e;
      }
      .mission {
        text-align: center;
        padding: 50px 20px;
      }
      .mission h2 {
        font-size: 1.8rem;
        font-weight: bold;
        margin-bottom: 20px;
        color: #2d4e5e;
      }
      .mission p {
        font-size: 1.1rem;
        line-height: 1.6;
        color: #555;
        max-width: 800px;
        margin: 0 auto;
      }
      .bestsellers {
        padding: 50px 20px;
        background-color: #f9f9f9;
      }
      .bestsellers h2 {
        font-size: 1.8rem;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px;
        color: #2d4e5e;
      }
      .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 20px;
        justify-content: center;
      }
      .product-grid img {
        width: 100%;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      }
      .banner {
        width: 100%;
        padding-top: 20px;
        display: block;
      }
      @media (max-width: 768px) {
        .hero{
          aspect-ratio: 16/9;
        }
        .hero-content h1 {
          font-size: 1.5rem;
        }
        .hero-content button {
          font-size: 0.9rem;
        }
        nav {
          padding: 10px;
        }
        .nav .menu {
          gap: 10px;
        }
        .categories {
          gap: 5px;
        }
      }
      @media (max-width: 400px) {
        .hero-content h1 {
          font-size: 1.2rem;
        }
        .hero-content button {
          padding: 8px 15px;
          font-size: 0.8rem;
        }
        .product-grid {
          display: grid;
          grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
          gap: 20px;
          justify-content: center;
        }
      }
      .login{
        text-decoration: none;
        font-size: 1rem;
        color: #2d4e5e;
        font-weight: 600;
      }
      .product-card {
        max-width: 300px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        overflow: hidden;
        text-align: center;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      }
      .product-image {
        position: relative;
      }
      .product-image img {
        width: 100%;
        border-bottom: 1px solid #ddd;
      }
      .discount-badge {
        position: absolute;
        top: 10px;
        right: 10px;
        background-color: #004d40;
        color: #fff;
        padding: 5px 10px;
        font-size: 0.9rem;
        font-weight: bold;
        border-radius: 3px;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
        margin-bottom: 15px;
      }
      .product-info {
        padding: 15px;
      }
      .product-name {
        font-size: 1rem;
        font-weight: bold;
        color: #333;
        margin-bottom: 10px;
      }
      .new-price {
        font-size: 1.2rem;
        font-weight: bold;
        color: #d32f2f;
      }
      .user-menu {
        position: relative;
        display: inline-block;
      }
      .user-btn {
        background-color: #fff;
        color: #2d4e5e;
        font-weight: 600;
        border: none;
        cursor: pointer;
        font-size: 1rem;
        padding: 10px;
      }
      .user-btn:hover {
        color: #007bff;
      }
      .dropdown-content {
        display: none;
        position: absolute;
        right: 0;
        background-color: #fff;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
        z-index: 1;
        border-radius: 5px;
        overflow: hidden;
      }
      .dropdown-content a {
        color: #2d4e5e;
        text-decoration: none;
        display: block;
        padding: 10px;
        font-size: 0.9rem;
      }
      .dropdown-content a:hover {
        background-color: #f1f1f1;
      }
      .user-menu:hover .dropdown-content {
        display: block;
      }
      button {
        padding: 10px 20px;
        font-size: 1rem;
        background-color: #2d4e5e;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
      }

      button:hover {
        background-color: #fff;
        color: #2d4e5e;
        transform: scale(1.05);
      }

      button:active {
        transform: scale(1);
        background-color: #fff;
      }

    </style>
  </head>
  <body>
  <nav>
    <div class="menu">
      <a onclick="location.href='#menoutfit';">Shop Men</a>
      <a onclick="location.href='#womenoutfit';">Shop Women</a>
      <a href="#">Support</a>
      <%
        List<Map<String, String>> cart = (List<Map<String, String>>) session.getAttribute("cart");
        int cartCount = (cart == null) ? 0 : cart.size();
      %>
      <a href="view_cart.jsp">Cart (<%= cartCount %>)</a>

    </div>
    <% Object username = session.getAttribute("username"); %>
    <% if (username == null) { %>
    <a href="login.jsp" class="login">Login</a>
    <% } else { %>
    <div class="user-menu">
      <button class="user-btn"><%= username %> </button>
      <div class="dropdown-content">
        <a href="profile.jsp">Profile</a>
        <a href="orders.jsp">My Orders</a>
        <a href="logout.jsp">Logout</a>
      </div>
    </div>
    <% } %>
  </nav>
  <div class="hero">
    <div class="hero-overlay">
      <div class="video-container">
        <video class="video" autoplay="autoplay" muted>
          <source src="images/image.mp4" type="video/mp4">
        </video>
      </div>
    </div>
    <div class="hero-content">
      <h1>Win an Old Money Trip to Monaco</h1>
      <button onclick="location.href='#ourmission';">Shop bestsellers</button>
    </div>
  </div>
  <div class="categories">
    <button>Tops</button>
    <button>Bestsellers</button>
    <button>Premium Wool</button>
    <button>Shop the Look</button>
    <button>Shoes</button>
    <button>FW25</button>
  </div>
  <section id="ourmission" class="mission">
    <h2>Our Mission</h2>
    <p>
      We think everyone deserves to dress classy. We allow you to elevate your appearance with fashion from the timeless charm of the Old Money lifestyle, without overpaying.
    </p>
    <sql:setDataSource var="dataSource"
                       driver="com.mysql.cj.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/online_shop?useSSL=false&serverTimezone=UTC"
                       user="root"
                       password="admin" />

    <sql:query dataSource="${dataSource}" var="result">
      SELECT * FROM product;
    </sql:query>
    <div id="bestsellers" class="bestsellers">
      <div class="product-grid">
        <c:forEach var="row" items="${result.rows}">
          <div class="grid-item">
            <p class="product-name">${row.product_name}</p>
            <img class="product-image" src="image?id=${row.product_id}" alt="${row.product_name}" style="max-width: 300px;" />
            <p class="new-price">${row.price}</p>
            <form action="add_to_cart.jsp" method="POST">
              <input type="hidden" name="product_id" value="${row.product_id}" />
              <input type="hidden" name="product_name" value="${row.product_name}" />
              <input type="hidden" name="price" value="${row.price}" />
              <input type="number" name="quantity" value="1" min="1" style="width: 50px;" />
              <button type="submit">Add to Cart</button>
            </form>
          </div>
        </c:forEach>
      </div>
    </div>
    <div><img src="images/img.png" class="banner"> </div>
    <p>
    <div id="womenoutfit" class="WomenOutfit">
    <h2>Women`s Outfit</h2> </div>
    </p>
    <div id="bestsellers" class="bestsellers">
      <div class="product-grid">

      </div>
      <div class="product-grid">

      </div>
    </div>
    <p>
    <div id="menoutfit" class="MenOutfit">
      <h2>Men`s Outfit</h2> </div>
    </p>
    <div id="bestsellers" class="bestsellers">
      <div class="product-grid">

      </div>
      <div class="product-grid">

      </div>
    </div>
  </section>
  </body>
  </html>