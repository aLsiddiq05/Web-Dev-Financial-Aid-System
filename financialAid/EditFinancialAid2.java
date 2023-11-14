package financialAid;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
@WebServlet(name = "EditFinancialAid2", urlPatterns = {"/EditFinancialAid2"})
public class EditFinancialAid2 extends HttpServlet {

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
        //  try (PrintWriter out = response.getWriter()) {
        //     //int id = Integer.parseInt(request.getParameter("id"));
        //     String name = request.getParameter("name");
        //      String program = request.getParameter("program");
        //      String overview = request.getParameter("overview");
        //       String criteria = request.getParameter("criteria");
        //      int amount = Integer.parseInt(request.getParameter("amount"));
        //       String dateline = request.getParameter("dateline");
        //      int id = Integer.parseInt(request.getParameter("id"));

        //      FinancialAid e = new FinancialAid();
        //e.setId(id);
        //      e.setName(name);
        //      e.setProgram(program);
        //      e.setOverview(overview);
        //     e.setCriteria(criteria);
        //     e.setAmount(amount);
        //     e.setDateline(dateline);
        //     e.setId(id);
        //     int status = financialAidDao.update(e);
        //   if (status > 0) {
        //       out.print("<p>Update Successful</p>");
        //         request.getRequestDispatcher("financialAidRegistration.jsp").include(request, response);
        //       } else {
        //          out.println("Sorry, record not updated");
        //       }
        //       out.close();
        //    }
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String program = request.getParameter("program");
            String overview = request.getParameter("overview");
            String criteria = request.getParameter("criteria");
            int amount = Integer.parseInt(request.getParameter("amount"));
            String dateline = request.getParameter("dateline");

            FinancialAid e = new FinancialAid();
            //e.setId(id);
            e.setName(name);
            e.setProgram(program);
            e.setOverview(overview);
            e.setCriteria(criteria);
            e.setAmount(amount);
            e.setDateline(dateline);

            int status = financialAidDao.update(e);
            if (status > 0) {
                out.print("<p>Update Successful</p>");
                response.sendRedirect("financialAidRegistration.jsp");
            } else {
                out.println("Sorry, record not updated");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
