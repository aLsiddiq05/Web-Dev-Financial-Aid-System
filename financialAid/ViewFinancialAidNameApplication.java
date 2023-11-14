/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package financialAid;

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
@WebServlet(name = "ViewFinancialAidNameApplication", urlPatterns = {"/ViewFinancialAidNameApplication"})
public class ViewFinancialAidNameApplication extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("financial_name"); // Assuming the ID is passed as a query parameter named "id"
        FinancialAid e = financialAidDao.getFinancialAidByName(name);

        request.setAttribute("name", e.getName());
        request.setAttribute("program", e.getProgram());
        request.setAttribute("overview", e.getOverview());
        request.setAttribute("criteria", e.getCriteria());
        request.setAttribute("amount", e.getAmount());
        request.setAttribute("dateline", e.getDateline());

        // Forward the request to the EditFinancialAid.jsp page
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewFinancialName.jsp");
        dispatcher.forward(request, response);
    }

}
