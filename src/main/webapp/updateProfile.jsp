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

    PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Profile</title>

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

    .update-box {
        width: 420px;
        background: white;
        padding: 35px;
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
        font-size: 23px;
        font-weight: 600;
        color: #1f2937;
        margin-bottom: 25px;
    }

    label {
        display: block;
        font-size: 14px;
        font-weight: 500;
        color: #374151;
        margin-top: 12px;
    }

    input[type="text"] {
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

    input[type="text"]:focus {
        border-color: #3b82f6;
        box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
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

<div class="update-box">
    <h2>Update Profile</h2>

    <form action="updateProfile" method="post">

        <label>Name</label>
        <input type="text" name="name" value="<%= rs.getString("name") %>" required>

        <label>Course</label>
        <input type="text" name="course" value="<%= rs.getString("course") %>" required>

        <label>City</label>
        <input type="text" name="city" value="<%= rs.getString("city") %>" required>

        <input type="submit" value="Update">

    </form>
</div>

</body>
</html>
