package HandlingStatus;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import HandlingStatus.ViewStudentInfo;
import HandlingStatus.ViewStudentInfoDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author User
 */
@WebServlet(name = "ViewStudentList", urlPatterns = {"/ViewStudentList"})
public class ViewStudentList extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            List<ViewStudentInfo> list = ViewStudentInfoDao.getAllStudentInfo();

            out.print("<table class='financial-aid-table'");
            out.print("<tr><th>Name</th><th>Email</th><th>Phone Number</th><th>IC</th><th>Matric</th><th>Delete</th></tr>");
            for (ViewStudentInfo e : list) {
                out.print("<tr>");
                out.print("<td>" + e.getName() + "</td>");
                out.print("<td>" + e.getEmail() + "</td>");
                out.print("<td>" + e.getPhoneNumber() + "</td>");
                out.print("<td>" + e.getIc() + "</td>");
                out.print("<td>" + e.getMatric() + "</td>");
                out.print("<td><a href='DeleteStudentList?email=" + e.getEmail()+ "'>Delete</a></td>");
                out.print("</tr>");
            }
            out.println("</table>");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}