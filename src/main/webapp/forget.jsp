<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forget Password</title>
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
    .forget-container {
      background: #fffaf0;
      border: 2px solid #d8cbb5;
      border-radius: 15px;
      padding: 30px;
      width: 350px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
      text-align: center;
    }
    .forget-container h1 {
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
    .forget-container img {
      width: 80px;
      height: auto;
      margin-bottom: 15px;
      border-radius: 50%;
      border: 3px solid #d8cbb5;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
    }
    .forget-container label {
      display: block;
      font-size: 14px;
      margin-bottom: 10px;
      text-align: left;
      color: #4a3c31;
      font-weight: bold;
    }
    .forget-container input {
      width: 100%;
      padding: 12px;
      margin-bottom: 20px;
      border: 1px solid #cbb79d;
      border-radius: 8px;
      background: #fdf8f0;
      color: #4a3c31;
      font-size: 14px;
    }
    .forget-container input:focus {
      border-color: #9f8a70;
      outline: none;
    }
    .forget-container button {
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
    .forget-container button:hover {
      background-color: #3c3227;
    }
    .forget-container a {
      color: #4a3c31;
      text-decoration: none;
      font-size: 13px;
    }
    .forget-container a:hover {
      text-decoration: underline;
    }
    .forget-container .signup {
      margin-top: 15px;
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="forget-container">
  <img src="images/logowebsite3.webp" alt="Old Money LLC">
  <h1>Reset Password</h1>
  <div class="decorative-line"></div>
  <form action="/ForgetServlet" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" placeholder="Enter your username" required>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" required>
    <label for="password">New Password:</label>
    <input type="password" id="password" name="password" placeholder="Enter your new password" required>
    <button type="submit">Change Password</button>
  </form>
  <div class="signup">
    <span>Remember password? <a href="login.jsp">Log in</a></span>
  </div>
</div>
</body>
</html>
