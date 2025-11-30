package kaif.sms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addAttendance")
public class AddAttendanceServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        int att = Integer.parseInt(req.getParameter("att"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc_db",
                    "root",
                    "MySQL@1234567890");

            PreparedStatement ps1 = con.prepareStatement(
                    "SELECT id FROM student WHERE email=?");
            ps1.setString(1, email);
            ResultSet rs = ps1.executeQuery();

            if (!rs.next()) {
                out.println("<h3 style='color:red'>No student found with this email!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("addAttendance.jsp");
                rd.include(req, resp);
                return;
            }

            int sid = rs.getInt("id");

            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT * FROM attendance WHERE student_id=?");
            psCheck.setInt(1, sid);
            ResultSet rs2 = psCheck.executeQuery();

            int count;

            if (rs2.next()) {
                PreparedStatement psUpdate = con.prepareStatement(
                        "UPDATE attendance SET attendance_percent=? WHERE student_id=?");
                psUpdate.setInt(1, att);
                psUpdate.setInt(2, sid);
                count = psUpdate.executeUpdate();
            } else {
                PreparedStatement psInsert = con.prepareStatement(
                        "INSERT INTO attendance (student_id, attendance_percent) VALUES (?,?)");
                psInsert.setInt(1, sid);
                psInsert.setInt(2, att);
                count = psInsert.executeUpdate();
            }

            if (count > 0) {
                out.println("<h3 style='color:green'>Attendance saved successfully!</h3>");
            } else {
                out.println("<h3 style='color:red'>Failed to save attendance!</h3>");
            }

            RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
            rd.include(req, resp);

        } catch (Exception e) {
            out.println("<h3 style='color:red'>Exception: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("addAttendance.jsp");
            rd.include(req, resp);
        }
    }
}
