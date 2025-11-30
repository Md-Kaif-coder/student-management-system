package kaif.sms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("student_id") == null) {
            out.print("<h3 style='color:red'>Please login first!</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.include(req, resp);
            return;
        }

        int id = (int) session.getAttribute("student_id");

        String name = req.getParameter("name");
        String course = req.getParameter("course");
        String city = req.getParameter("city");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc_db",
                    "root",
                    "MySQL@1234567890");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE student SET name=?, course=?, city=? WHERE id=?");

            ps.setString(1, name);
            ps.setString(2, course);
            ps.setString(3, city);
            ps.setInt(4, id);

            int count = ps.executeUpdate();

            if (count > 0) {
                out.print("<h3 style='color:green'>Profile Updated Successfully!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
                rd.include(req, resp);
            } 
            else {
                out.print("<h3 style='color:red'>Update Failed!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("updateProfile.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            out.print("<h3 style='color:red'>Exception: " + e.getMessage() + "</h3>");
        }
    }
}
