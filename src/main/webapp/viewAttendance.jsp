<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession, jakarta.servlet.RequestDispatcher" %>

<%
    // Session check
    if (session == null || session.getAttribute("student_id") == null) {
        out.print("<h3 style='color:red'>Please login first!</h3>");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.include(request, response);
        return;
    }

    int id = (int) session.getAttribute("student_id");

    // Fetch attendance
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/jdbc_db", "root", "MySQL@1234567890");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM attendance WHERE student_id=?"
    );
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Attendance</title>

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

    .box {
        width: 400px;
        background: #ffffff;
        padding: 35px;
        border-radius: 16px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.08);
        border: 1px solid #e5e7eb;
        text-align: center;
        animation: fadeIn .4s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    h2 {
        margin-top: 0;
        font-size: 22px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 20px;
    }

    .value {
        font-size: 40px;
        font-weight: 700;
        color: #2563eb;
        margin-bottom: 10px;
    }

    .info {
        font-size: 15px;
        color: #4b5563;
        margin-top: 6px;
    }

    .warning {
        font-size: 18px;
        font-weight: 600;
        color: #f59e0b;
        margin-top: 10px;
    }

</style>
</head>

<body>

<div class="box">
    <h2>Your Attendance</h2>

    <%
        if (rs.next()) {
    %>
        <div class="value"><%= rs.getInt("attendance_percent") %>%</div>
        <div class="info">Attendance Percentage</div>
    <%
        } else {
    %>
        <div class="warning">Attendance not added yet!</div>
    <%
        }
    %>

</div>

</body>
</html>
