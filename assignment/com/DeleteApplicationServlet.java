/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteApplicationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve the application ID from the request
        int applicationId = Integer.parseInt(request.getParameter("applicationId"));

        // Delete the application from the database
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB.getConnection();
            String sql = "DELETE FROM applications WHERE applicationId = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, applicationId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Redirect back to the fileList.jsp
        response.sendRedirect("fileList.jsp?deleted=true");
    }
}
