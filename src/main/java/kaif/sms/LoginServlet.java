package kaif.sms;

import java.io.IOException;
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
import jakarta.servlet.http.HttpSession;

@WebServlet("/loginForm")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email1");
        String pass = req.getParameter("pass1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jdbc_db",
                "root",
                "MySQL@1234567890"
            );

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM student WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                // Create Session
                HttpSession session = req.getSession();
                session.setAttribute("student_name", rs.getString("name"));
                session.setAttribute("student_id", rs.getInt("id"));

                // Forward to Profile Page
                RequestDispatcher rd = req.getRequestDispatcher("profile.jsp");
                rd.forward(req, resp);

            } else {

                // SEND ERROR TO JSP (INSIDE LOGIN BOX)
                req.setAttribute("error", "Invalid Email or Password!");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, resp);
            }

        } catch (Exception e) {

            req.setAttribute("error", "Exception: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
            rd.forward(req, resp);
        }
    }
}
