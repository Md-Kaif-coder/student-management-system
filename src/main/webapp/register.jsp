<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Student Registration</title>

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

    .reg-box {
        width: 450px;
        background: white;
        padding: 35px;
        border-radius: 14px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        border: 1px solid #e5e7eb;
        animation: fadeIn 0.4s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(14px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        text-align: center;
        font-size: 23px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-top: 12px;
        font-size: 14px;
        color: #374151;
        font-weight: 500;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 14px;
        margin-top: 6px;
        border-radius: 10px;
        border: 1px solid #d0d5dd;
        background: #fdfdfd;
        font-size: 15px;
        outline: none;
        transition: 0.2s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
    }

    /* FIXED GENDER SECTION */
    .gender-box {
        margin-top: 6px;
    }

    .gender-option {
        display: flex;
        align-items: center;
        margin-bottom: 8px;
        gap: 10px;
        cursor: pointer;
        font-size: 15px;
        font-weight: 500;
        color: #374151;
    }

    .gender-option input {
        transform: scale(1.2);
        cursor: pointer;
    }

    input[type="submit"] {
        width: 100%;
        padding: 13px;
        margin-top: 22px;
        border: none;
        border-radius: 10px;
        background: #3b82f6;
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.25s ease;
    }

    input[type="submit"]:hover {
        background: #2563eb;
        transform: translateY(-2px);
        box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3);
    }
</style>

</head>

<body>

<div class="reg-box">
    <h2>Student Registration</h2>

    <form action="register" method="post">

        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <label>Gender</label>

        <div class="gender-box">
            <label class="gender-option">
                <input type="radio" name="gender" value="Male" required>
                <span>Male</span>
            </label>

            <label class="gender-option">
                <input type="radio" name="gender" value="Female" required>
                <span>Female</span>
            </label>
        </div>

        <label>Course</label>
        <input type="text" name="course" required>

        <label>City</label>
        <input type="text" name="city" required>

        <input type="submit" value="Register">

    </form>
</div>

</body>
</html>
