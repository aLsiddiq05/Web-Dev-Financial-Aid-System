package financialAid;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

import java.util.List;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author User
 */
@WebServlet(name = "ViewFinancialAid", urlPatterns = {"/ViewFinancialAid"})
public class ViewFinancialAid extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title> ViewFinancialAid</title>");
        out.println("</head>");
        out.println("<body>");

        List<FinancialAid> list = financialAidDao.getAllFinancialAid();

        out.print("<table class='financial-aid-table'");
        out.print("<tr><th>Name</th><th>Program</th><th>Dateline</th><th>Edit</th><th>Delete</th></tr>");
        for (FinancialAid e : list) {
            out.print("<tr>");
            out.print("<td>" + e.getName() + "</td>");
            out.print("<td>" + e.getProgram() + "</td>");
            out.print("<td>" + e.getDateline() + "</td>");
            out.print("<td><a href='EditFinancialAid?name=" + e.getName() + "'>Edit</a></td>");
            out.print("<td><a href='DeleteFinancialAid?name=" + e.getName() + "'>Delete</a></td>");
            out.print("</tr>");
        }
        out.print("</table>");

        out.println("</body>");
        out.println("</html>");

        out.close();
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
