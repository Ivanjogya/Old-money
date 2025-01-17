<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product</title>
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
        .container {
            background: #fffaf0;
            border: 2px solid #d8cbb5;
            border-radius: 15px;
            padding: 30px;
            width: 400px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .container h1 {
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
        .container label {
            display: block;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: left;
            color: #4a3c31;
            font-weight: bold;
        }
        .container input, .container select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #cbb79d;
            border-radius: 8px;
            background: #fdf8f0;
            color: #4a3c31;
            font-size: 14px;
        }
        .container input:focus, .container select:focus {
            border-color: #9f8a70;
            outline: none;
        }
        .container button {
            width: 100%;
            padding: 12px;
            background-color: #4a3c31;
            border: none;
            border-radius: 8px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            font-family: 'Georgia', serif;
        }
        .container button:hover {
            background-color: #3c3227;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add Product</h1>
    <div class="decorative-line"></div>
    <form action="AddProductServlet" method="post" enctype="multipart/form-data">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" placeholder="Enter product name" required>

        <label for="color">Color:</label>
        <input type="text" id="color" name="color" placeholder="Enter color">

        <label for="size">Size:</label>
        <input type="text" id="size" name="size" placeholder="Enter size">

        <label for="category">Category:</label>
        <select id="category" name="categoryId" required>
            <option value="1">Shoes</option>
            <option value="2">Shirt</option>
            <option value="3">Socks</option>
        </select>

        <label for="price">Price:</label>
        <input type="number" id="price" name="price" placeholder="Enter price" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required>

        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="image/*" required>

        <button type="submit">Add Product</button>
    </form>
</div>
</body>
</html>
