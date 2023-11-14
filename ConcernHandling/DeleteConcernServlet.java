/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ConcernHandling;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "DeleteConcernServlet", urlPatterns = {"/DeleteConcernServlet"})
public class DeleteConcernServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int concern_id = Integer.parseInt(request.getParameter("concern_id"));

        int status = ConcernDao.delete(concern_id);
        if (status > 0) {
            response.sendRedirect("viewconcerns.jsp"); // Redirect to the page showing the updated list of concerns
        } else {
            response.getWriter().println("Failed to delete concern.");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
