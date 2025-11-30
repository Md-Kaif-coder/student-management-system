<%@ page import="jakarta.servlet.http.HttpSession, jakarta.servlet.RequestDispatcher" %>

<%
    if (session == null || session.getAttribute("admin_username") == null) {
        out.print("<h3 style='color:red'>Please login as Admin first!</h3>");
        RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
        rd.include(request, response);
        return;
    }

    String adminName = (String) session.getAttribute("admin_username");
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: #f4f6f9;
        display: flex;
    }

    /* ---------- Sidebar ---------- */
    .sidebar {
        width: 240px;
        height: 100vh;
        background: #1e293b; /* Dark navy */
        color: white;
        padding: 25px 20px;
        box-sizing: border-box;
        position: fixed;
    }

    .sidebar h2 {
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 35px;
        text-align: center;
        color: #ffffff;
    }

    .menu a {
        display: block;
        text-decoration: none;
        color: #e2e8f0;
        padding: 12px 15px;
        margin-bottom: 10px;
        border-radius: 8px;
        transition: 0.2s ease;
        font-size: 15px;
        font-weight: 500;
    }

    .menu a:hover {
        background: #334155;
        color: white;
        transform: translateX(4px);
    }

    /* ---------- Main Content ---------- */
    .main {
        margin-left: 240px;
        padding: 30px;
        width: calc(100% - 240px);
    }

    .welcome {
        background: white;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
        border: 1px solid #e5e7eb;
    }

    .welcome h1 {
        font-size: 24px;
        color: #1f2937;
        margin: 0;
        font-weight: 600;
    }

</style>
</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>

    <div class="menu">
        <a href="addMarks.jsp">Add / Update Marks</a>
        <a href="addAttendance.jsp">Add / Update Attendance</a>
        <!-- <a href="viewStudents.jsp"> View All Students</a> -->
    </div>
</div>

<div class="main">
    <div class="welcome">
        <h1>Welcome, <%= adminName %> sir</h1>
    </div>
</div>

</body>
</html>
