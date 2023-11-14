/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ConcernHandling;

import HandlingStatus.StudentApplication;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "ConcernServlet", urlPatterns = {"/ConcernServlet"})
public class ConcernServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            List<Concern> list = ConcernDao.getAllConcern();

            out.print("<table class='financial-aid-table'>");
            out.print("<tr><th>Email</th><th>Concern</th><th>Mark</th><th>Delete</th></tr>");
            for (Concern e : list) {
                out.print("<tr>");
                out.print("<td>" + e.getEmail() + "</td>");
                out.print("<td class='concern-cell'>" + e.getConcern1() + "</td>");
                out.print("<td><button class='btn btn-primary' onclick=\"highlightRow(this.parentNode.parentNode)\">Mark</button></td>");
                out.print("<td><button class='btn btn-primary' onclick=\"deleteRow('" + e.getId() + "')\">Delete</button></td>");
                out.print("</tr>");
            }
            out.print("</table>");

            out.print("<style>");
            out.print(".financial-aid-table {");
            out.print("    width: 100%;");
            out.print("}");
            out.print(".concern-cell {");
            out.print("    max-width: 500px;"); // Adjust the maximum width as needed
            out.print("    word-wrap: break-word;");
            out.print("}");
            out.print("</style>");

            out.print("<script>");
            out.print("function highlightRow(row) {");
            out.print("    row.style.backgroundColor = 'yellow';");
            out.print("}");
            out.print("function deleteRow(concern_id) {");
            out.print("    if (confirm('Are you sure you want to delete this record?')) {");
            out.print("        window.location.href = 'DeleteConcernServlet?concern_id=' + encodeURIComponent(concern_id);");
            out.print("    }");
            out.print("}");
            out.print("</script>");
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
