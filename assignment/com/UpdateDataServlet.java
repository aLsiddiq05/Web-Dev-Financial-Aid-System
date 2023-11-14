/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@WebServlet(name = "UpdateDataServlet", urlPatterns = {"/UpdateDataServlet"})
@MultipartConfig(maxFileSize = 16177216) // 1.5 MB
public class UpdateDataServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        String matric = request.getParameter("matric");
        String income = request.getParameter("income");
        String bank = request.getParameter("bank");
        String acc = request.getParameter("acc");
        String race = request.getParameter("race");
        String religion = request.getParameter("religion");
        String status = request.getParameter("status");
        String ic = request.getParameter("ic");
        String course = request.getParameter("course");

        // Get the uploaded profile picture file
        Part profilePicturePart = request.getPart("profilePicture");
        InputStream profilePicture = profilePicturePart.getInputStream();

        // Step 1: Load JDBC driver...
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            response.getWriter().println("Error: Unable to load JDBC driver");
            return;
        }

        // Step 2: Establish the connection...
        String myURL = "jdbc:mysql://localhost:3306/assignment";
        try (Connection myConnection = DriverManager.getConnection(myURL, "root", "admin")) {

            String updateQuery;
            PreparedStatement preparedStatement;

            if (profilePicturePart.getSize() == 0) {
                // User wants to keep the existing profile picture, so update other fields only
                updateQuery = "UPDATE student SET name=?, phoneNo=?, matric=?, income=?, bank=?, acc=?, race=?, religion=?, status=?, ic=?, course=? WHERE email=?";
                preparedStatement = myConnection.prepareStatement(updateQuery);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, phoneNo);
                preparedStatement.setString(3, matric);
                preparedStatement.setString(4, income);
                preparedStatement.setString(5, bank);
                preparedStatement.setString(6, acc);
                preparedStatement.setString(7, race);
                preparedStatement.setString(8, religion);
                preparedStatement.setString(9, status);
                preparedStatement.setString(10, ic);
                preparedStatement.setString(11, course);
                preparedStatement.setString(12, email);
            } else {
                // User uploaded a new profile picture, update both profile picture and other fields
                updateQuery = "UPDATE student SET name=?, phoneNo=?, matric=?, income=?, bank=?, acc=?, race=?, religion=?, status=?, ic=?, pro_pict=?, course=? WHERE email=?";
                preparedStatement = myConnection.prepareStatement(updateQuery);
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, phoneNo);
                preparedStatement.setString(3, matric);
                preparedStatement.setString(4, income);
                preparedStatement.setString(5, bank);
                preparedStatement.setString(6, acc);
                preparedStatement.setString(7, race);
                preparedStatement.setString(8, religion);
                preparedStatement.setString(9, status);
                preparedStatement.setString(10, ic);
                preparedStatement.setBinaryStream(11, profilePicture);
                preparedStatement.setString(12, course);
                preparedStatement.setString(13, email);
            }

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.getWriter().println("Data updated successfully!");
                response.setHeader("Refresh", "2; URL=userInfo.jsp");
            } else {
                response.getWriter().println("Failed to update data!");
            }
        } catch (SQLException e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
