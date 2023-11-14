package assignment.com;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUpServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Database credentials
    static final String DB_URL = "jdbc:mysql://localhost:3306/assignment";
    static final String USER = "root";
    static final String PASS = "admin";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Retrieve user input
        String name = request.getParameter("name");
        String password = request.getParameter("password");
//        String confirmPassword = request.getParameter("confirmPassword");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Check if email already exists in the database
        boolean emailExists = checkEmailExists(email);

        if (emailExists) {
            // Display error message for duplicate email
            PrintWriter writer = response.getWriter();
            writer.println("<script type=\"text/javascript\">");
            writer.println("alert('The email is already existed.');");
            writer.println("window.location.href = 'signUp.jsp';");
            writer.println("</script>");
            return;
        }

        // Set student's additional information to ""
        String matric = "";
        double income = 0.0;
        String bank = "";
        String acc = "";
        String race = "";
        String religion = "";
        String status = "";
        String ic = "";
        String course = "";

        // Store user input and additional information in the database
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "INSERT INTO student (name, email, password, phoneNo, matric, income, bank, acc, race, religion, status, ic, course) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            statement.setString(4, phone);
            statement.setString(5, matric);
            statement.setDouble(6, income);
            statement.setString(7, bank);
            statement.setString(8, acc);
            statement.setString(9, race);
            statement.setString(10, religion);
            statement.setString(11, status);
            statement.setString(12, ic);
            statement.setString(13, course);
            statement.executeUpdate();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
            return;
        }

        PrintWriter writer = response.getWriter();
        writer.println("<script type=\"text/javascript\">");
        writer.println("alert('Your Account Has Been Created Successfully!');");
        writer.println("window.location.href = 'login.jsp';");
        writer.println("</script>");
    }

    private boolean checkEmailExists(String email) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
            String sql = "SELECT COUNT(*) AS count FROM student WHERE email = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            int count = 0;
            if (resultSet.next()) {
                count = resultSet.getInt("count");
            }

            conn.close();

            return count > 0;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
