/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package HandlingStatus;

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
@WebServlet(name = "UpdateStudentStatus", urlPatterns = {"/UpdateStudentStatus"})
public class UpdateStudentStatus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStudentStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStudentStatus at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//
//            String application_status = request.getParameter("application_status");
//            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
//
//            StudentApplication e = new StudentApplication();
//
//            e.setApplication_status(application_status);
//            e.setApplicationId(applicationId);
//
//            int status = StudentApplicationDao.update(e);
//            if (status > 0) {
//                out.print("<p>Update Successful</p>");
//                response.sendRedirect("ViewStudentStatus.jsp");
//            } else {
//                out.println("Sorry, record not updated");
//            }
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            String application_status = request.getParameter("application_status");

            StudentApplication e = new StudentApplication();
            e.setApplicationId(applicationId);
            e.setApplication_status(application_status);

            int status = StudentApplicationDao.updateStatus(e);
            if (status > 0) {
                response.sendRedirect("Awarding.jsp");
            } else {
                PrintWriter out = response.getWriter();
                out.println("Sorry, record not updated");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
