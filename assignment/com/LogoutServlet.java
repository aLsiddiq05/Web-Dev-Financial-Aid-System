/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LogoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performLogout(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        performLogout(request, response);
    }

    private void performLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the email from the session
        HttpSession session = request.getSession(false); // Retrieve the existing session
        if (session != null) {
            String email = (String) session.getAttribute("email");

            // Perform any other necessary logout logic
            // ...
            // Invalidate the session
            session.invalidate();
            System.out.println("Session ended for email: " + email);
        }

        // Redirect to index.jsp
        response.sendRedirect("index.jsp");
    }
}
