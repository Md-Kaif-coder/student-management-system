<%@ page import="jakarta.servlet.http.HttpSession, jakarta.servlet.RequestDispatcher" %>

<%
    if (session == null || session.getAttribute("admin_username") == null) {
        out.print("<h3 style='color:red'>Please login as Admin first!</h3>");
        RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
        rd.include(request, response);
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Add Attendance</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: #f5f7fa;       /* Clean light grey background */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    /* Clean premium card */
    .container {
        background: #ffffff;
        padding: 35px 40px;
        width: 420px;
        border-radius: 14px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);   /* Light soft shadow */
        border: 1px solid #e7eaf1;
        animation: fadeIn 0.5s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        margin: 0 0 25px 0;
        font-size: 22px;
        font-weight: 600;
        color: #2c3e50;
        text-align: center;
    }

    input[type="email"],
    input[type="number"] {
        width: 100%;
        padding: 12px 14px;
        margin: 10px 0 18px 0;
        font-size: 15px;
        border-radius: 10px;
        border: 1px solid #d0d5dd;
        background: #fdfdfd;
        outline: none;
        transition: 0.2s;
    }

    input[type="email"]:focus,
    input[type="number"]:focus {
        border-color: #3b82f6;         /* Soft blue border on focus */
        box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
    }

    input[type="submit"] {
        width: 100%;
        padding: 13px;
        margin-top: 5px;
        border: none;
        border-radius: 10px;
        background: #3b82f6;           /* Premium blue button */
        color: #fff;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.25s ease;
    }

    input[type="submit"]:hover {
        background: #2563eb;           /* Slightly darker hover */
        transform: translateY(-2px);
        box-shadow: 0 4px 14px rgba(37, 99, 235, 0.3);
    }
</style>

</head>
<body>

<div class="container">
    <h2>Add / Update Attendance</h2>

    <form action="addAttendance" method="post">
        <input type="email" name="email" placeholder="Enter Student Email" required>
        <input type="number" name="att" placeholder="Attendance %" min="0" max="100">
        <input type="submit" value="Save Attendance">
    </form>
</div>

</body>
</html>
