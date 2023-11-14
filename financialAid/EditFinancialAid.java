package financialAid;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
@WebServlet(name = "EditFinancialAid", urlPatterns = {"/EditFinancialAid"})
public class EditFinancialAid extends HttpServlet {

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

            /*out.println("<form id='myForm' name='myForm' action='EditFinancialAid2' method='post'>");

            out.println("<legend><h3>Financial Aid Registration</h3></legend>");

            out.println("<div class='mb-3 form'>");
            out.println("<label for='name' class='form-label'>Name :</label>");
            out.println("<input type='text' class='form-control' name='name' id='name' value='" + e.getName() + "' placeholder='' />");
            out.println("</div>");
            out.println("<div class='mb-3 form'>");
            out.println("<label for='program' class='form-label'>Program Type :</label><br/>");
            out.println("<select name='program' class='form-control'value='" + e.getProgram()+ "'>");
            out.println(" <option value='Education Loan'>Education Loan</option>");
            out.println("<option value='Endowment'>Endowment</option>");
            out.println("<option value='Scholarship'>Scholarship</option>");
            out.println("</select>");
            out.println(" </div>");
            out.println("<div class='mb-3 form'>");
            out.println("<label for='overview' class='form-label'>Overview :</label>");
            out.println("<textarea class='form-control' name='overview' id='overview' value='" + e.getOverview()+ "'></textarea>");
            out.println("</div>");
            out.println(" <div class='mb-3 form'>");
            out.println("<label for='overview' class='form-label'>Criteria :</label>");
            out.println("<textarea class='form-control' name='criteria' id='criteria' value='" + e.getCriteria()+ "'></textarea>");
            out.println("</div>");
            out.println("<div class='mb-3 form'>");
            out.println("<label for='amount' class='form-label'>Amount (RM):</label>");
            out.println("<input type='number' class='form-control' name='amount' id='amount' value='" + e.getAmount()+ "' placeholder='' step='1000'/>");
            out.println("</div>");
            out.println("<div class='mb-3 form'>");
            out.println("<label for='dateline' class='form-label'>Dateline :</label>");
            out.println("<input type='date' class='form-control' name='dateline' id='dateline' value='" + e.getDateline()+ "'placeholder='' />");
            out.println("</div>");
            out.println("<div>");
            out.println("<input type='submit' class='btn btn-primary form' value='Submit'/>");
            out.println("</div>");
            out.println("<br/>");
            out.println("<div>");
            out.println("<input type='reset' class='btn btn-primary form' value='Cancel'/>");
            out.println("</div>");

            out.println("</form>");*/
            //out.close();
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditFinancialAid</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditFinancialAid at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");*/
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the financial aid details from the database using the provided ID or any other identifier
        String name = request.getParameter("name"); // Assuming the ID is passed as a query parameter named "id"
        FinancialAid e = financialAidDao.getFinancialAidByName(name);

        // Store the financial aid details in request attributes
        //request.setAttribute("id", e.getId());
        request.setAttribute("name", e.getName());
        request.setAttribute("program", e.getProgram());
        request.setAttribute("overview", e.getOverview());
        request.setAttribute("criteria", e.getCriteria());
        request.setAttribute("amount", e.getAmount());
        request.setAttribute("dateline", e.getDateline());

        // Forward the request to the EditFinancialAid.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("EditFinancialAid.jsp");
        dispatcher.forward(request, response);
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
