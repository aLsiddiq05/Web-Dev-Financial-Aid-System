<%-- 
    Document   : editData
    Created on : May 25, 2023, 11:49:52 AM
    Author     : User
--%>
<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Data</title>
        <link rel="stylesheet" type="text/css" href="userInfo.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
        <style>
            table tr td{
                padding-bottom: 10px;
                padding-left: 40px;
            }
        </style>
        <script>
            // Function to validate file type for profile picture
            function validateFileType() {
                var fileInput = document.getElementById('profilePicture');
                var filePath = fileInput.value;
                var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

                if (!allowedExtensions.exec(filePath)) {
                    alert('Please upload file having extensions .jpeg/.jpg/.png only.');
                    fileInput.value = '';
                    return false;
                }
                return true;
            }

            // Function to validate number inputs
            function validateNumberInput(inputName) {
                var numberInputs = document.getElementsByName(inputName);

                for (var i = 0; i < numberInputs.length; i++) {
                    var numberInput = numberInputs[i];
                    var numberValue = numberInput.value;

                    if (isNaN(numberValue)) {
                        alert('Please enter a valid number.');
                        numberInput.value = '';
                    }
                }
            }

            // Function to validate family income
            function validateFamilyIncome() {
                var incomeInput = document.getElementsByName('income')[0];
                var incomeValue = parseFloat(incomeInput.value);

                if (incomeValue === 0.0) {
                    alert('Please fill in the family income.');
                    incomeInput.value = '';
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="studentNav.jsp" />
        <br>
        <h1>Edit Data</h1>
        <div class="container">
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

                if (myResultSet.next()) {
                    // Display the current data in editable input fields
                    // Display the current profile picture
                    String base64Image = "";
                    Blob profilePictureBlob = myResultSet.getBlob(12);
                    if (profilePictureBlob != null) {
                        byte[] imageBytes = profilePictureBlob.getBytes(1, (int) profilePictureBlob.length());
                        base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    }
            %>
            <div class="card-group">
                <div class="card"><div class="card-body">
                        <h5 class="card-title"><center>Edit User Information</center></h5>
                        <div class="student-info">
                            <%
                                out.print("<br>");
                                out.print("<img src='data:image/jpeg;base64," + base64Image + "' width='200' height='200' class='profile-picture'><br>");

                                // Allow the user to upload a new profile picture
                                out.print("<form method='post' action='UpdateDataServlet' enctype='multipart/form-data' onsubmit='return validateFamilyIncome()'>");
                            %>
                            <table class="student-info-table">
                                <%
                                    out.print("<tr><td>Profile Picture:</td><td> <input type='file' name='profilePicture' id='profilePicture' onchange='validateFileType()'></td><tr>");
                                    out.print("<input type='hidden' name='keepProfilePicture' value='true'>");
                                %>
                                <%
                                    out.print("<br>");
                                    out.print("<tr><td>Name: </td><td><input type='text' size='24' name='name' required='required'  value='" + myResultSet.getString(1) + "'></td></tr>");
                                    out.print("<tr><td>Email:</td><td> <input type='email' size='24' name='email' readonly value='" + myResultSet.getString(2) + "'></td></tr>");
                                    out.print("<tr><td>Phone Number: </td><td><input type='tel' size='24' name='phoneNo' required='required' value='" + myResultSet.getString(3) + "' onblur=\"validateNumberInput('phoneNo')\"></td></tr>");
                                    out.print("<tr><td>Matric Number: </td><td><input type='text' size='24' name='matric' required='required' value='" + myResultSet.getString(4) + "'></td></tr>");
                                    double income = myResultSet.getDouble(5);
                                    String formattedIncome = String.format("%.2f", income);
                                    out.print("<tr><td>Family Income: <br> (In RM) </td><td> <input type='text' size='24' name='income' required='required' value='" + formattedIncome + "' onblur=\"validateNumberInput('income')\"></td></tr>");
                                    out.print("<tr><td>Bank Name: </td><td><select name='bank'>");
                                    String currentBank = myResultSet.getString(6);
                                    out.print("<option value='CIMB Bank' " + (currentBank.equals("CIMB Bank") ? "selected" : "") + ">CIMB Bank</option>");
                                    out.print("<option value='Maybank' " + (currentBank.equals("Maybank") ? "selected" : "") + ">Maybank</option>");
                                    out.print("<option value='Public Bank Berhad' " + (currentBank.equals("Public Bank Berhad") ? "selected" : "") + ">Public Bank Berhad</option>");
                                    out.print("<option value='RHB Bank Berhad' " + (currentBank.equals("RHB Bank Berhad") ? "selected" : "") + ">RHB Bank Berhad</option>");
                                    out.print("<option value='Hong Leong Bank Berhad' " + (currentBank.equals("Hong Leong Bank Berhad") ? "selected" : "") + ">Hong Leong Bank Berhad</option>");
                                    out.print("<option value='Affin Bank Berhad' " + (currentBank.equals("Affin Bank Berhad") ? "selected" : "") + ">Affin Bank Berhad</option>");
                                    out.print("<option value='Bank Islam Malaysia Berhad' " + (currentBank.equals("Bank Islam Malaysia Berhad") ? "selected" : "") + ">Bank Islam Malaysia Berhad</option>");
                                    out.print("<option value='Bank Simpanan Nasional' " + (currentBank.equals("Bank Simpanan Nasional") ? "selected" : "") + ">Bank Simpanan Nasional</option>");
                                    out.print("<option value='Bank Rakyat' " + (currentBank.equals("Bank Rakyat") ? "selected" : "") + ">Bank Rakyat</option>");
                                    out.print("<option value='Bank Muamalat' " + (currentBank.equals("Bank Muamalat") ? "selected" : "") + ">Bank Muamalat</option>");
                                    out.print("</select></td></tr>");
                                    out.print("<tr><td>Account Number: </td><td><input type='text' name='acc' size='24' required='required' value='" + myResultSet.getString(7) + "' onblur=\"validateNumberInput('acc')\"></td></tr>");
                                    out.print("<tr><td>Race: </td><td><select name='race'>");
                                    String currentRace = myResultSet.getString(8);
                                    out.print("<option value='Malay' " + (currentRace.equals("Malay") ? "selected" : "") + ">Malay</option>");
                                    out.print("<option value='Chinese' " + (currentRace.equals("Chinese") ? "selected" : "") + ">Chinese</option>");
                                    out.print("<option value='Indian' " + (currentRace.equals("Indian") ? "selected" : "") + ">Indian</option>");
                                    out.print("</select></td></tr>");
                                    out.print("<tr><td>Religion: </td><td><select name='religion'>");
                                    String currentReligion = myResultSet.getString(9);
                                    out.print("<option value='Islam' " + (currentReligion.equals("Islam") ? "selected" : "") + ">Islam</option>");
                                    out.print("<option value='Buddha' " + (currentReligion.equals("Buddha") ? "selected" : "") + ">Buddha</option>");
                                    out.print("<option value='Christian' " + (currentReligion.equals("Christian") ? "selected" : "") + ">Christian</option>");
                                    out.print("<option value='Hindu' " + (currentReligion.equals("Hindu") ? "selected" : "") + ">Hindu</option>");
                                    out.print("</select></td></tr>");
                                    out.print("<tr><td>Marital Status: </td><td><select name='status'>");
                                    String currentStatus = myResultSet.getString(10);
                                    out.print("<option value='Single' " + (currentStatus.equals("Single") ? "selected" : "") + ">Single</option>");
                                    out.print("<option value='Married' " + (currentStatus.equals("Married") ? "selected" : "") + ">Married</option>");
                                    out.print("<option value='Divorced' " + (currentStatus.equals("Divorced") ? "selected" : "") + ">Divorced</option>");
                                    out.print("</select></td></tr>");
                                    out.print("<tr><td>NRIC: <br>(xxxxxxxxxxxx)</td><td> <input type='text' name='ic' size='24' required='required' minlength='12' maxlength='12' value='" + myResultSet.getString(11) + "' onblur=\"validateNumberInput('ic')\"></td></tr>");
                                    out.print("<tr><td>Course:</td><td> <input type='text' name='course' size='24' required='required' value='" + myResultSet.getString(13) + "'></td></tr>");
                                %>
                            </table>
                            <div class="card-footer">
                                <%
                                    out.print("<input type='submit' class='btn btn-primary' style='font-weight: bold;' value='Update'>");
                                    out.print("</form>");
                                %>
                            </div>
                            <%
                                    out.print("<button  class='btn btn-primary' value='Back' onclick='goBack()'>Back</button>");
                                } else {
                                    // If no record is found, display an error message or perform some other action
                                    out.print("No record found!");
                                }

                                // Close database connection
                                myConnection.close();
                            %>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" />
        <script>
            function goBack() {
                history.back();
            }
        </script>
    </body>
</html>









