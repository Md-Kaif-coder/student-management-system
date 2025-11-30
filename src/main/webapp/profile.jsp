<%@ page import="jakarta.servlet.RequestDispatcher" %>

<%
    if (session == null || session.getAttribute("student_name") == null) {
        out.print("<h3 style='color:red'>Please login first!</h3>");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.include(request, response);
        return;
    }

    String name = (String) session.getAttribute("student_name");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Profile</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: #f4f6f9;
        display: flex;
    }

    /* Sidebar */
    .sidebar {
        width: 230px;
        background: #1e293b;  /* dark navy */
        height: 100vh;
        padding: 25px 20px;
        color: white;
        position: fixed;
    }

    .sidebar h2 {
        text-align: center;
        margin-bottom: 30px;
        font-size: 20px;
        font-weight: 600;
    }

    .menu a {
        display: block;
        color: #e2e8f0;
        text-decoration: none;
        padding: 12px 14px;
        margin-bottom: 10px;
        border-radius: 8px;
        transition: 0.2s;
        font-size: 15px;
        font-weight: 500;
    }

    .menu a:hover {
        background: #334155;
        color: white;
        transform: translateX(4px);
    }

    /* Main content */
    .main {
        margin-left: 230px;
        padding: 30px;
        width: calc(100% - 230px);
    }

    .welcome-card {
        background: white;
        padding: 25px;
        border-radius: 12px;
        border: 1px solid #e5e7eb;
        box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    }

    .welcome-card h2 {
        margin: 0 0 10px 0;
        color: #1f2937;
        font-size: 24px;
        font-weight: 600;
    }

    .welcome-card p {
        font-size: 15px;
        color: #4b5563;
        margin-top: 6px;
    }

</style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2>Student Panel</h2>

    <div class="menu">
        <a href="viewMarks.jsp"> View Marks</a>
        <a href="viewAttendance.jsp"> View Attendance</a>
        <a href="updateProfile.jsp"> Update Profile</a>
    </div>
</div>

<!-- Main Content -->
<div class="main">
    <div class="welcome-card">
        <h2>Welcome, <%= name %> </h2>
        <p>Your Student Dashboard</p>
    </div>
</div>

</body>
</html>
