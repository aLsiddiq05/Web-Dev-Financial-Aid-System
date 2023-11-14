<%-- 
    Document   : fileList
    Created on : Jun 2, 2023, 4:15:44 PM
    Author     : User
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="assignment.com.DB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            tr, td, th {
                padding: 20px;
                text-align: center;
            }
            .student-pic{
                width:200px; 
                height:200px;
            }
        </style>
        <link rel="stylesheet" type="text/css" href="applicationList.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
    </head>
    <body>
        <jsp:include page="studentNav.jsp" />
        <br><br><br>
    <center>
        <%!
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>

        <center>
            <h1 style="margin-top: -50px;">Application List</h1>
            <div class="profilePicture">
            <%
                String email = (String) session.getAttribute("email");

                Connection con = DB.getConnection();

                Statement myStatement = con.createStatement();

                String myQuery = "SELECT email, phoneNo, pro_pict FROM student WHERE email='" + email + "'";
                ResultSet myResultSet = myStatement.executeQuery(myQuery);

                if (myResultSet.next()) {
                    // Display the profile picture
                    String profilePicture = myResultSet.getString("pro_pict");
                    if (profilePicture == null || profilePicture.isEmpty()) {
                        // Assign the URL of the default profile picture image
                        profilePicture = "profilepicture.png";
                    } else {
                        // Retrieve the image from the database
                        byte[] imageData = myResultSet.getBytes("pro_pict");
                        if (imageData != null && imageData.length > 0) {
                            String base64Image = Base64.getEncoder().encodeToString(imageData);
                            profilePicture = "data:image/jpeg;base64," + base64Image;
                        }
                    }
                    out.print("<div class='container-fluid'>");
                    out.print("<img src='" + profilePicture + "' alt='Profile Picture' class='profile-picture'><br>");
                    out.print("</div>");
                    out.print(myResultSet.getString("email") + "<br>");
                    out.print(myResultSet.getString("phoneNo") + "<br>");
                }

                // Close database connection
                myResultSet.close();
                myStatement.close();
                con.close();
            %>
            </div>
        </center>

        <table border="2">
            <tr>
                <!--<th>Email</th>-->
                <th>Financial Aid</th>
                <th>Payslip File</th>
                <th>CGPA File</th>
                <th>Date</th>
                <th>Time</th>
                <th>Application Status</th>
                <th>Action</th>
            </tr>
            <% // Continue with the existing code for displaying the table
                con = DB.getConnection();
                String sql = "SELECT * FROM applications WHERE stu_email=?";
                ps = con.prepareStatement(sql);
                ps.setString(1, email);
                rs = ps.executeQuery();
                while (rs.next()) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
                    String submissionDate = dateFormat.format(rs.getTimestamp("submission_datetime"));
                    String submissionTime = timeFormat.format(rs.getTimestamp("submission_datetime"));
            %>
            <tr>
                <!--<td><%=rs.getString("stu_email")%></td>-->
                <td><%=rs.getString("financial_name")%></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString("payslip")%>"><%=rs.getString("payslip")%></a></td>
                <td><a href="DownloadServlet?fileName=<%=rs.getString("cgpa")%>"><%=rs.getString("cgpa")%></a></td>
                <td><%=submissionDate%></td>
                <td><%=submissionTime%></td>
                <td><%=rs.getString("application_status")%></td>
                <td>
                    <form method="post" action="DeleteApplicationServlet">
                        <input type="hidden" name="applicationId" value="<%=rs.getInt("applicationId")%>">
                        <button type="submit" onclick="return confirm('Are you sure you want to delete this application?');">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>

        </table><br>
        <button onclick="window.location.href = 'financialAid.jsp'">Financial Aid</button>
    </center>
    <br>
    <jsp:include page="footer.jsp" />
</body>
</html>








