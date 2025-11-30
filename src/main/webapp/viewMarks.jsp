<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession, jakarta.servlet.RequestDispatcher" %>

<%
    if (session == null || session.getAttribute("student_id") == null) {
        out.print("<h3 style='color:red'>Please login first!</h3>");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.include(request, response);
        return;
    }

    int id = (int) session.getAttribute("student_id");

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/jdbc_db", "root", "MySQL@1234567890");

    PreparedStatement ps = con.prepareStatement(
        "SELECT * FROM marks WHERE student_id=?"
    );
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Your Marks</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

    body {
        margin: 0;
        padding: 0;
        font-family: "Inter", sans-serif;
        background: linear-gradient(135deg, #e0e7ff, #f4f6f9);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .card {
        width: 480px;
        background: rgba(255,255,255,0.85);
        padding: 40px;
        border-radius: 18px;
        backdrop-filter: blur(10px);
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        animation: fadeIn .4s ease;
        border: 1px solid rgba(255,255,255,0.4);
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h2 {
        margin: 0;
        margin-bottom: 25px;
        font-size: 26px;
        font-weight: 700;
        text-align: center;
        background: linear-gradient(45deg, #3b82f6, #6366f1);
        -webkit-background-clip: text;
        color: transparent;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        font-size: 15px;
        border-radius: 12px;
        overflow: hidden;
    }

    th {
        background: #2563eb;
        color: white;
        padding: 14px;
        font-size: 15px;
        font-weight: 600;
    }

    td {
        padding: 14px;
        background: white;
        font-weight: 500;
        color: #1f2937;
        border-bottom: 1px solid #e5e7eb;
        text-align: center;
    }

    tr:last-child td {
        border-bottom: none;
    }

    .marks-badge {
        display: inline-block;
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: 600;
        background: #dbeafe;
        color: #1d4ed8;
        box-shadow: inset 0 0 4px rgba(29,78,216,0.2);
    }

    .warning {
        text-align: center;
        font-size: 18px;
        color: #f59e0b;
        font-weight: 600;
        margin-top: 15px;
    }

</style>
</head>

<body>

<div class="card">
    <h2>Your Marks</h2>

    <%
        if (rs.next()) {
    %>

    <table>
        <tr>
            <th>Subject</th>
            <th>Marks</th>
        </tr>

        <tr>
            <td>Math</td>
            <td><span class="marks-badge"><%= rs.getInt("math") %></span></td>
        </tr>

        <tr>
            <td>Java</td>
            <td><span class="marks-badge"><%= rs.getInt("java") %></span></td>
        </tr>

        <tr>
            <td>DBMS</td>
            <td><span class="marks-badge"><%= rs.getInt("dbms") %></span></td>
        </tr>

        <tr>
            <td>DSA</td>
            <td><span class="marks-badge"><%= rs.getInt("dsa") %></span></td>
        </tr>
    </table>

    <%
        } else {
    %>

    <div class="warning">Marks not added yet!</div>

    <%
        }
    %>

</div>

</body>
</html>
