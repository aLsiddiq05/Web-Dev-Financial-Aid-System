<%-- 
    Document   : studentInfo
    Created on : 14 Jun 2023, 11:09:45 pm
    Author     : User
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="userInfo.css">
    </head>
    <body>
        <%
            String stuEmail = request.getParameter("stuEmail");

            // Step 1: Load JDBC driver...
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Establish the connection...
            String myURL = "jdbc:mysql://localhost:3306/assignment";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

            // Step 3: Create statement object....
            Statement myStatement = myConnection.createStatement();

            // Step 4: Perform retrieve record from Student's table....(Retrieve)
            String myQuery = "SELECT name, email, phoneNo, matric, income, bank, acc, race, religion, status, ic, pro_pict, course FROM student WHERE email='" + stuEmail + "'";
            ResultSet myResultSet = myStatement.executeQuery(myQuery);

            if (myResultSet.next()) {
                // Display the current data
                // Display the profile picture
                String profilePicture = myResultSet.getString(12);
                if (profilePicture == null || profilePicture.isEmpty() || profilePicture.equals("profilepicture.png")) {
                    // Default profile picture is not present in the database
                    // Set the profile picture as the default picture
                    profilePicture = "profilepicture.png";
                } else {
                    // Retrieve the image from the database
                    byte[] imageData = myResultSet.getBytes(12);
                    if (imageData != null && imageData.length > 0) {
                        String base64Image = Base64.getEncoder().encodeToString(imageData);
                        profilePicture = "data:image/jpeg;base64," + base64Image;
                    }
                }
        %>
        <div class="card-group">
            <div class="card" style="margin-top: 50px;">
                <br>
                <img src="<%= profilePicture%>" alt="Profile Picture" class="profile-picture">
                <div class="card-body">
                    <h5 style="text-align: center;" class="card-title"><u>Student Information</u></h5>
                    <div class="student-info">
                        <table class="student-info-table">
                            <tr>
                                <td><label>Name</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(1)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Email</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(2)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Phone Number</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(3)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Matric Number</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(4)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Income</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(5)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Bank</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(6)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Account Number</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(7)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Race</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(8)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Religion</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(9)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Marital Status</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(10)%></span></td>
                            </tr>
                            <tr>
                                <td><label>IC Number</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(11)%></span></td>
                            </tr>
                            <tr>
                                <td><label>Course</label></td>
                                <td><label>:</label></td>
                                <td><span><%= myResultSet.getString(13)%></span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%
            } else {
                out.print("Record not found!");
            }

            // Step 5: Close connection and cleanup...
            myStatement.close();
            myConnection.close();
        %>
    </body>
</html>

