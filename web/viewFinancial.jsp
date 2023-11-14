<%-- 
    Document   : viewFinancial
    Created on : Jun 2, 2023, 11:18:09 AM
    Author     : User
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View Financial Aid</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
        <link href="financialAid.css" rel="stylesheet" />
        <style>
            /* financialAid.css */
            .file-container {
                background-color: #f2f2f2;
                padding: 20px;
                margin-bottom: 20px;
                border-radius: 5px;
            }

            /* Additional styling for different file containers */
            .file-container.payslip {
                background-color: #d1eaf5;
                margin: 0px;
                padding: 0px;
            }

            .file-container.cgpa {
                background-color: #dff0d8;
                margin: 0px;
                padding: 0px;
            }
        </style>
    </head>
    <body>
        <div class="file-container">
            <h1>Financial Aid Details</h1>
            <%
                // Get the parameter from the URL
                String financial_name = (String) request.getAttribute("financial_name");

                if (financial_name != null && !financial_name.isEmpty()) {
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
                        String query = "SELECT * FROM financial WHERE financial_name = '" + financial_name + "'";
                        ResultSet resultSet = statement.executeQuery(query);

                        // Process and display the data
                        if (resultSet.next()) {
                            // Retrieve the information
                            String program = resultSet.getString("program");
                            String overview = resultSet.getString("overview");
                            String criteria = resultSet.getString("criteria");
                            double amount = resultSet.getDouble("amount");
                            String deadline = resultSet.getString("deadline");

                            // Create a DecimalFormat instance to format the amount
                            DecimalFormat decimalFormat = new DecimalFormat("0.00");
                            String formattedAmount = decimalFormat.format(amount);

                            // Display the information
                            out.println("<p><strong>Name:</strong> " + financial_name + "</p>");
                            out.println("<p><strong>Program:</strong> " + program + "</p>");
                            out.println("<p><strong>Overview:</strong> " + overview + "</p>");

                            // Split criteria by comma
                            String[] criteriaItems = criteria.split(",");

                            // Display criteria as bullet points
                            out.println("<p><strong>Criteria:</strong></p>");
                            out.println("<ul>");
                            for (String criteriaItem : criteriaItems) {
                                out.println("<li>" + criteriaItem.trim() + "</li>");
                            }
                            out.println("</ul>");

                            out.println("<p><strong>Amount:</strong> RM" + formattedAmount + "</p>");
                            out.println("<p><strong>Deadline:</strong> " + deadline + "</p>");

                            // Check if the user has already applied for this financial aid
                            String userEmail = (String) session.getAttribute("email");

                            // Check if the user has already applied for this financial aid
                            String applicationQuery = "SELECT * FROM applications WHERE financial_name = ? AND stu_email = ?";
                            PreparedStatement applicationStatement = connection.prepareStatement(applicationQuery);
                            applicationStatement.setString(1, financial_name);
                            applicationStatement.setString(2, userEmail);
                            ResultSet applicationResultSet = applicationStatement.executeQuery();

                            if (applicationResultSet.next()) {
                                // User has already applied for this financial aid
                                out.println("<p>You have already applied for this <a href=\"fileList.jsp\">financial aid</a>.❤️</p>");
                                out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
                            } else {
                                // Check if the financial aid program has already closed
                                String deadlineQuery = "SELECT deadline FROM financial WHERE financial_name = ?";
                                PreparedStatement deadlineStatement = connection.prepareStatement(deadlineQuery);
                                deadlineStatement.setString(1, financial_name);
                                ResultSet deadlineResultSet = deadlineStatement.executeQuery();

                                if (deadlineResultSet.next()) {
                                    String programDeadline = deadlineResultSet.getString("deadline");

                                    // Get the current date
                                    java.util.Date currentDate = new java.util.Date();

                                    // Compare the deadline with the current date
                                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                                    java.util.Date deadlineDate = sdf.parse(programDeadline);

                                    if (currentDate.after(deadlineDate)) {
                                        // The financial aid program has already closed
                                        out.println("<p style='color: red;'>The program is already closed.⌛</p>");
                                        out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
                                    } else {
                                        // User can apply for this financial aid
                                        // Display the application form
                                        out.println("<form action=\"UploadServlet?financial_name=" + financial_name + "\" method=\"post\" enctype=\"multipart/form-data\">");
                                        out.println("<input type=\"hidden\" name=\"email\" value=\"" + session.getAttribute("email") + "\">");
                                        out.println("<input type=\"hidden\" name=\"financial_name\" value=\"" + financial_name + "\">");
            %>
            <div class="file-container payslip">
                <%
                    out.println("<label for=\"payslip\">Payslip File:</label>");
                    out.println("<input type=\"file\" name=\"payslip\" required><br><br>");
                %>
            </div>
            <div class="file-container cgpa">
                <%
                    out.println("<label for=\"cgpa\">CGPA File:</label>");
                    out.println("<input type=\"file\" name=\"cgpa\" required><br><br>");
                %>
            </div>
            <%
                                        out.println("<button type=\"submit\">Submit Application</button>");
                                        out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
                                        out.println("</form>");
                                    }
                                } else {
                                    out.println("<p>No data found for the selected financial aid.</p>");
                                    out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
                                }
                            }
                        }
                        // Close the database connection
                        connection.close();

                    } catch (Exception e) {
                        out.println("<p>Error retrieving financial aid details: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    }
                } else {
                    out.println("<p>No financial aid selected.</p>");
                    out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
                }
            %>
        </div>
    </body>
</html>





