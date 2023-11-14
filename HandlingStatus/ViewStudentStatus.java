/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package HandlingStatus;

import admin.register.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
@WebServlet(name = "ViewStudentStatus", urlPatterns = {"/ViewStudentStatus"})
public class ViewStudentStatus extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

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
        try {
            PrintWriter out = response.getWriter();
            List<StudentApplication> list = StudentApplicationDao.getAllStudentApplication();

            out.print("<table class='financial-aid-table'>");
            out.print("<tr><th>Email</th><th>Financial Aid</th><th>Date</th><th>CGPA</th><th>Payslip</th><th>Application Status</th><th>Update</th></tr>");

            for (StudentApplication e : list) {
                out.print("<form action=\"UpdateStudentStatus\" method=\"post\">");
                out.print("<tr>");
                out.print("<input type='hidden' name='applicationId' value='" + e.getApplicationId() + "'>");
                out.print("<td>");
                out.print("<a href=\"javascript:void(0);\" onclick=\"openPopup('studentInfo.jsp?stuEmail=" + e.getStu_email() + "')\" class=\"link-button\">" + e.getStu_email() + "</a>");
                out.print("</td>");
                out.print("<td>");
                out.print("<a href=\"javascript:void(0);\" onclick=\"openPopup2('ViewFinancialAidNameApplication?financial_name=" + e.getFinancial_name() + "')\" class=\"link-button\">" + e.getFinancial_name() + "</a>");
                out.print("</td>");
                out.print("<td>" + e.getSubmissionDate() + "</td>");
                out.print("<td><a href='DownloadServlet?fileName=" + e.getCgpa() + "'>Download</a></td>");
                out.print("<td><a href='DownloadServlet?fileName=" + e.getPayslip() + "'>Download</a></td>");
                out.print("<td><select name='application_status' class='form-control'>");
                out.print("<option value='pending' name='application_status'" + (e.getApplication_status().equals("pending") ? "selected" : "") + ">Pending</option>");
                out.print("<option value='accepted' name='application_status'" + (e.getApplication_status().equals("accepted") ? "selected" : "") + ">Accepted</option>");
                out.print("<option value='declined' name='application_status'" + (e.getApplication_status().equals("declined") ? "selected" : "") + ">Declined</option>");
                out.print("</select></td>");
                out.print("<td><button type='submit' class='btn btn-primary form' id='submitBtn'>Update</button></td>");
                out.print("</tr>");
                out.print("</form>");
            }
            out.print("</table>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewStudentStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewStudentStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewStudentStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
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
