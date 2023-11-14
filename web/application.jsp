<%-- 
    Document   : application
    Created on : Jun 2, 2023, 3:10:28 PM
    Author     : User
--%>

<%--<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>--%>
<!--<!DOCTYPE html>
<html>
<head>
    <title>Financial Aid Application</title>
</head>
<body>
    <h1>Financial Aid Application</h1>
    <%
        // Get the parameter from the URL
//        String financial_name = request.getParameter("financial_name");
//
//        if (financial_name != null && !financial_name.isEmpty()) {
//            // Check if the user has already applied for this financial aid
//            String userEmail = (String) session.getAttribute("email");

            // Establish the connection...
//            String myURL = "jdbc:mysql://localhost:3306/assignment";
//
//            try {
//                // Load the MySQL driver
//                Class.forName("com.mysql.jdbc.Driver");
//
//                // Connect to the database
//                Connection connection = DriverManager.getConnection(myURL, "root", "admin");

                // Check if the financial aid program has already closed
//                String deadlineQuery = "SELECT deadline FROM financial WHERE financial_name = ?";
//                PreparedStatement deadlineStatement = connection.prepareStatement(deadlineQuery);
//                deadlineStatement.setString(1, financial_name);
//                ResultSet deadlineResultSet = deadlineStatement.executeQuery();
//
//                if (deadlineResultSet.next()) {
//                    String deadline = deadlineResultSet.getString("deadline");
//
//                    // Get the current date
//                    java.util.Date currentDate = new java.util.Date();
//
//                    // Compare the deadline with the current date
//                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
//                    java.util.Date deadlineDate = sdf.parse(deadline);
//
//                    if (currentDate.after(deadlineDate)) {
//                        // The financial aid program has already closed
//                        out.println("<p>The program has already closed.</p>");
//                        out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
//                    } else {
//                        // Check if the user has already applied for this financial aid
//                        String applicationQuery = "SELECT * FROM applications WHERE financial_name = ? AND stu_email = ?";
//                        PreparedStatement applicationStatement = connection.prepareStatement(applicationQuery);
//                        applicationStatement.setString(1, financial_name);
//                        applicationStatement.setString(2, userEmail);
//                        ResultSet applicationResultSet = applicationStatement.executeQuery();
//
//                        if (applicationResultSet.next()) {
//                            // User has already applied for this financial aid
//                            out.println("<p>You have already applied for this financial aid.</p>");
//                            out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
//                        } else {
//                            // User can apply for this financial aid
//                            // Display the application form
//                            out.println("<form action=\"UploadServlet?financial_name=" + request.getParameter("financial_name") + "\" method=\"post\" enctype=\"multipart/form-data\">");
//                            out.println("<input type=\"hidden\" name=\"email\" value=\"" + session.getAttribute("email") + "\">");
//                            out.println("<input type=\"hidden\" name=\"financial_name\" value=\"" + financial_name + "\">");
//                            out.println("<label for=\"payslip\">Payslip File:</label>");
//                            out.println("<input type=\"file\" name=\"payslip\" required><br><br>");
//                            out.println("<label for=\"cgpa\">CGPA File:</label>");
//                            out.println("<input type=\"file\" name=\"cgpa\" required><br><br>");
//                            out.println("<button type=\"submit\">Submit Application</button>");
//                            out.println("<button onclick=\"window.location.href='viewFinancial.jsp?financial_name=" + request.getParameter("financial_name") + "'\">Back</button>");
//                            out.println("</form>");
//                        }
//                    }
//                } else {
//                    out.println("<p>No data found for the selected financial aid.</p>");
//                    out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
//                }

//                // Close the database connection
//                connection.close();
//
//            } catch (Exception e) {
//                out.println("<p>Error retrieving application details: " + e.getMessage() + "</p>");
//                e.printStackTrace();
//            }
//        } else {
//            out.println("<p>No financial aid selected.</p>");
//            out.println("<button onclick=\"window.location.href='financialAid.jsp'\">Back</button>");
//        }
//    %>
</body>
</html>-->

