<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Login</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: #f4f6f9;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .login-box {
        width: 380px;
        background: white;
        padding: 35px 35px;
        border-radius: 14px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        border: 1px solid #e5e7eb;
        animation: fadeIn 0.4s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        margin-bottom: 25px;
        font-size: 22px;
        font-weight: 600;
        color: #1f2937;
    }

    label {
        display: block;
        text-align: left;
        margin-top: 10px;
        font-size: 14px;
        font-weight: 500;
        color: #374151;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        margin-top: 6px;
        font-size: 15px;
        border-radius: 10px;
        border: 1px solid #d0d5dd;
        background: #fdfdfd;
        outline: none;
        transition: 0.2s;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
    }

    input[type="submit"] {
        width: 100%;
        padding: 13px;
        border: none;
        border-radius: 10px;
        background: #3b82f6;
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        margin-top: 18px;
        transition: 0.25s ease;
    }

    input[type="submit"]:hover {
        background: #2563eb;
        transform: translateY(-2px);
        box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3);
    }

    /* 🔥 ERROR MESSAGE BOX */
    .error-msg {
        background: #fee2e2;
        color: #b91c1c;
        padding: 10px 14px;
        border-left: 4px solid #dc2626;
        border-radius: 8px;
        font-size: 14px;
        margin-bottom: 15px;
        text-align: center;
        font-weight: 600;
        animation: fadeIn 0.3s ease;
    }
</style>

</head>

<body>

<div class="login-box">
    <h2>Student Login</h2>

    <!-- 🌟 ERROR MESSAGE INSIDE BOX -->
    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <div class="error-msg"><%= error %></div>
    <% 
        } 
    %>

    <form action="loginForm" method="post">

        <label>Email</label>
        <input type="text" name="email1" required>

        <label>Password</label>
        <input type="password" name="pass1" required>

        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>
