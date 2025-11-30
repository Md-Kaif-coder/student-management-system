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

@WebServlet("/addMarks")
public class AddMarksServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String email = req.getParameter("email");
        int math = Integer.parseInt(req.getParameter("math"));
        int java = Integer.parseInt(req.getParameter("java"));
        int dbms = Integer.parseInt(req.getParameter("dbms"));
        int dsa  = Integer.parseInt(req.getParameter("dsa"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc_db",
                    "root",
                    "MySQL@1234567890");

            // 1) student id nikaalo email se
            PreparedStatement ps1 = con.prepareStatement(
                    "SELECT id FROM student WHERE email=?");
            ps1.setString(1, email);
            ResultSet rs = ps1.executeQuery();

            if (!rs.next()) {
                out.println("<h3 style='color:red'>No student found with this email!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("addMarks.jsp");
                rd.include(req, resp);
                return;
            }

            int sid = rs.getInt("id");

            // 2) Check if marks already exist
            PreparedStatement psCheck = con.prepareStatement(
                    "SELECT * FROM marks WHERE student_id=?");
            psCheck.setInt(1, sid);
            ResultSet rs2 = psCheck.executeQuery();

            int count;

            if (rs2.next()) {
                // update
                PreparedStatement psUpdate = con.prepareStatement(
                        "UPDATE marks SET math=?, java=?, dbms=?, dsa=? WHERE student_id=?");
                psUpdate.setInt(1, math);
                psUpdate.setInt(2, java);
                psUpdate.setInt(3, dbms);
                psUpdate.setInt(4, dsa);
                psUpdate.setInt(5, sid);
                count = psUpdate.executeUpdate();
            } else {
                // insert
                PreparedStatement psInsert = con.prepareStatement(
                        "INSERT INTO marks (student_id, math, java, dbms, dsa) VALUES (?,?,?,?,?)");
                psInsert.setInt(1, sid);
                psInsert.setInt(2, math);
                psInsert.setInt(3, java);
                psInsert.setInt(4, dbms);
                psInsert.setInt(5, dsa);
                count = psInsert.executeUpdate();
            }

            if (count > 0) {
                out.println("<h3 style='color:green'>Marks saved successfully!</h3>");
            } else {
                out.println("<h3 style='color:red'>Failed to save marks!</h3>");
            }

            RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
            rd.include(req, resp);

        } catch (Exception e) {
            out.println("<h3 style='color:red'>Exception: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("addMarks.jsp");
            rd.include(req, resp);
        }
    }
}
