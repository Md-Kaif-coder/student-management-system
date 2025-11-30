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

@WebServlet("/register")
public class StudentRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String gender = req.getParameter("gender");
        String course = req.getParameter("course");
        String city = req.getParameter("city");

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/jdbc_db",
                "root",
                "MySQL@1234567890"
            );

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO student (name, email, password, gender, course, city) VALUES (?, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, gender);
            ps.setString(5, course);
            ps.setString(6, city);

            int count = ps.executeUpdate();

            if (count > 0) {
                out.println("<h3 style='color:green'>Registration Successful!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, resp);
            } else {
                out.println("<h3 style='color:red'>Registration Failed!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {

            out.println("<h3 style='color:red'>Exception: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
            rd.include(req, resp);
        }
    }
}
