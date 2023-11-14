/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "submitConcern", urlPatterns = {"/submitConcern"})
public class SubmitConcernServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = (String) request.getSession().getAttribute("email");
        String concern = request.getParameter("concern");

        try {
            // Step 1: Load JDBC driver...
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Establish the connection...
            String myURL = "jdbc:mysql://localhost:3306/assignment";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            // Step 3: Insert the student's concern into the concern table
            String insertQuery = "INSERT INTO concern (concern, email) VALUES (?, ?)";
            PreparedStatement insertStatement = myConnection.prepareStatement(insertQuery);
            insertStatement.setString(1, concern);
            insertStatement.setString(2, email);
            int rowsAffected = insertStatement.executeUpdate();

            if (rowsAffected > 0) {
                // Display a success alert message
                String alertMessage = "Concern submitted successfully!";
                String alertScript = "alert('" + alertMessage + "'); window.history.back();";
                response.getWriter().println("<script>" + alertScript + "</script>");
            } else {
                // Display an error alert message
                String alertMessage = "Failed to submit concern!";
                String alertScript = "alert('" + alertMessage + "'); window.history.back();";
                response.getWriter().println("<script>" + alertScript + "</script>");
            }

            // Close the statement and database connection
            insertStatement.close();
            myConnection.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Display an error alert message
            String alertMessage = "An error occurred while submitting the concern.";
            String alertScript = "alert('" + alertMessage + "'); window.history.back();";
            response.getWriter().println("<script>" + alertScript + "</script>");
        }
    }
}
