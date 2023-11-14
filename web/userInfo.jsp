<%-- 
    Document   : userInfo
    Created on : May 22, 2023, 10:07:32 PM
    Author     : User
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
        <link rel="stylesheet" type="text/css" href="userInfo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
        <style>
            table tr td{
                padding-bottom: 10px;
                padding-left: 40px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="studentNav.jsp" />
        <br>
        <h1>Details of Student</h1>
        <div class="container-profile-picture">
            <%
                String email = (String) session.getAttribute("email");

                // Step 1: Load JDBC driver...
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Step 2: Establish the connection...
                String myURL = "jdbc:mysql://localhost:3306/assignment";
                Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

                // Step 3: Create statement object....
                Statement myStatement = myConnection.createStatement();

                // Step 4: Perform retrieve record from Student's table....(Retrieve)
                String myQuery = "SELECT name, email, phoneNo, matric, income, bank, acc, race, religion, status, ic, pro_pict, course FROM student WHERE email='" + email + "'";
                ResultSet myResultSet = myStatement.executeQuery(myQuery);

                while (myResultSet.next()) {
                    // Display the current data
                    // Display the profile picture
                    String profilePicture = myResultSet.getString(12);
                    if (profilePicture == null || profilePicture.isEmpty() || profilePicture.equals("profilepicture.png")) {
                        // Default profile picture is not present in the database
                        // Insert the default picture into the database
                        String defaultPicturePath = "C:/Users/User/Desktop/web development/Assignment/Assignment/web/profilepicture.png";
                        File defaultPicture = new File(defaultPicturePath);
                        FileInputStream fis = new FileInputStream(defaultPicture);
                        ByteArrayOutputStream baos = new ByteArrayOutputStream();
                        byte[] buffer = new byte[4096];
                        int bytesRead;
                        while ((bytesRead = fis.read(buffer)) != -1) {
                            baos.write(buffer, 0, bytesRead);
                        }
                        byte[] imageData = baos.toByteArray();
                        fis.close();
                        baos.close();

                        PreparedStatement updateStatement = myConnection.prepareStatement("UPDATE student SET pro_pict = ? WHERE email = ?");
                        updateStatement.setBytes(1, imageData);
                        updateStatement.setString(2, email);
                        updateStatement.executeUpdate();

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
                <div class="card">
                    <br>
                    <img src="<%= profilePicture%>" alt="Profile Picture" class="profile-picture">
                    <div class="card-body">
                        <h5 class="card-title"><u>Student Information</u></h5>
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
                                    <td><label>Family Income</label></td>
                                    <td><label>:</label></td>
                                    <td><span>RM <%= String.format("%.2f", myResultSet.getDouble(5))%></span></td>
                                </tr>
                                <tr>
                                    <td><label>Bank Name</label></td>
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
                                    <td><label>NRIC</label></td>
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
                        <div class="card-footer">
                            <a href="editData.jsp" class="btn btn-primary"><b>Update Data</b></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <% }%>
        <jsp:include page="footer.jsp" />
    </body>
</html>









