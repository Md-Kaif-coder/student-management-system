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

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uname = req.getParameter("uname");
        String pass  = req.getParameter("pass");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/jdbc_db",
                    "root",
                    "MySQL@1234567890");

            PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM admin WHERE username=? AND password=?");
            ps.setString(1, uname);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                HttpSession session = req.getSession();
                session.setAttribute("admin_username", uname);

                RequestDispatcher rd = req.getRequestDispatcher("adminDashboard.jsp");
                rd.forward(req, resp);

            } else {

                // FIXED ERROR MESSAGE
                req.setAttribute("error", "Invalid Admin Credentials!");
                RequestDispatcher rd = req.getRequestDispatcher("adminLogin.jsp");
                rd.forward(req, resp);
            }

        } catch (Exception e) {

            req.setAttribute("error", "Exception: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("adminLogin.jsp");
            rd.forward(req, resp);
        }
    }
}
