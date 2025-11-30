<!DOCTYPE html>
<html>
<head>
<title>Student Management System</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;

        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;

        /* 🔥 KIET College Background (LOCAL FILE) */
        background-image: url('images/Kiet1.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        position: relative;
    }

    .overlay {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,0.45);
        backdrop-filter: blur(2px);
    }

    .container {
        position: relative;
        z-index: 5;
        width: 420px;
        background: rgba(255,255,255,0.17);
        padding: 40px 45px;
        border-radius: 16px;
        text-align: center;
        backdrop-filter: blur(12px);
        box-shadow: 0 8px 25px rgba(0,0,0,0.5);
        border: 1px solid rgba(255,255,255,0.3);
        animation: fadeIn 0.4s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h1 {
        font-size: 26px;
        font-weight: 600;
        color: white;
        margin-bottom: 30px;
    }

    a {
        display: block;
        padding: 13px 18px;
        margin: 12px 0;
        background: rgba(255,255,255,0.15);
        color: white;
        font-size: 16px;
        font-weight: 600;
        text-decoration: none;
        border-radius: 10px;
        transition: 0.25s ease;
        border: 1px solid rgba(255,255,255,0.3);
    }

    a:hover {
        background: rgba(255,255,255,0.25);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0,0,0,0.4);
    }

</style>

</head>
<body>

<div class="overlay"></div>

<div class="container">
    <h1>Student Management System</h1>

    <a href="login.jsp">Student Login</a>
    <a href="register.jsp">Student Registration</a>
    <a href="adminLogin.jsp">Admin Login</a>
</div>

</body>
</html>
