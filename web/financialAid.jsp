<%-- 
    Document   : financialAid
    Created on : Jun 2, 2023, 9:40:01 AM
    Author     : User
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Retrieve Financial Data</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
        <link href="financialAid.css" rel="stylesheet" />
        <style>
            .file-container {
                background-color: #f2f2f2;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
            }

            table tr{
                padding-left: 0px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="studentNav.jsp" />
        <div class="file-container">
            <h1>Financial Aid List</h1>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Program</th>
                    <th>Deadline</th>
                    <th>Action</th>
                </tr>
                <%
                    // Establish the connection...
                    String myURL = "jdbc:mysql://localhost:3306/assignment";

                    try {
                        // Load the MySQL driver
                        Class.forName("com.mysql.jdbc.Driver");

                        // Connect to the database
                        Connection connection = DriverManager.getConnection(myURL, "root", "admin");

                        // Create a statement
                        Statement statement = connection.createStatement();

                        // Execute the query
                        String query = "SELECT financial_name, program, deadline FROM financial";
                        ResultSet resultSet = statement.executeQuery(query);

                        // Process and display the data
                        while (resultSet.next()) {
                            String financial_name = resultSet.getString("financial_name");
                            String program = resultSet.getString("program");
                            String deadline = resultSet.getString("deadline");

                            // Display the data in a table row
                            out.println("<tr>");
                            out.println("<td>" + financial_name + "</td>");
                            out.println("<td>" + program + "</td>");
                            out.println("<td>" + deadline + "</td>");
                            out.println("<td><a href='financialAid.jsp?financial_name=" + financial_name + "'>View</a></td>");
                            out.println("</tr>");
                        }

                        // Retrieve the student's email from the session
                        String email = (String) session.getAttribute("email");

                        // Query the database for the student's phone number using the email
                        String phoneNo = "";
                        String studentQuery = "SELECT phoneNo FROM student WHERE email = ?";
                        PreparedStatement preparedStatement = connection.prepareStatement(studentQuery);
                        preparedStatement.setString(1, email);
                        ResultSet studentResult = preparedStatement.executeQuery();

                        if (studentResult.next()) {
                            phoneNo = studentResult.getString("phoneNo");
                        }

                        // Close the database connection
                        connection.close();

                        out.println("<p>Make sure your phone number: <a href='editData.jsp'>" + phoneNo + "</a> is correct as it will assist us for further actions.😉</p>");

                    } catch (Exception e) {
                        out.println("<tr><td colspan='4'>Error retrieving financial data: " + e.getMessage() + "</td></tr>");
                        e.printStackTrace();
                    }
                %>
            </table>
        </div>

        <div id="viewFinancial">
            <%-- Include viewFinancial.jsp if financial_name parameter is present --%>
            <% String financialNameParam = request.getParameter("financial_name");
                if (financialNameParam != null && !financialNameParam.isEmpty()) {
                    request.setAttribute("financial_name", financialNameParam);
            %>
            <jsp:include page="viewFinancial.jsp" />
            <%
                }
            %>
        </div>
        <button onclick="window.location.href = 'fileList.jsp'">View Your Applications</button> 
        <br><br>
        <jsp:include page="footer.jsp" />
    </body>
</html>





