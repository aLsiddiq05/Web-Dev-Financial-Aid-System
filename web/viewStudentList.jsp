<%-- 
    Document   : viewStudentList
    Created on : Jun 11, 2023, 3:46:28 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.Date"%>
<%@page  %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Admin Page</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <style>
            * {
                padding: 0;
                margin: 0;
            }

            
            
            .container {
                display: flex;
                justify-content: center;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                margin-top: 20px;
            }

            .form-container {
                width: 50%;
                margin-right: 20px;
            }

            .output-container {
                width: 50%;
            }
            .financial-aid-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .financial-aid-table th,
            .financial-aid-table td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .financial-aid-table th {
                background-color: #f2f2f2;
            }
        </style>
        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
    </head>

    <body style="background-color: #FBFCFC">
        <jsp:include page="adminNav.jsp" />
        <main>
            <h1 style="padding: 20px; align-content: center;
                justify-content: center; background-color: wheat;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); margin-bottom: 20px;"> Financial Aid Management</h1>
            <div class="container">
                <div class="output-container">
                    <h3 id="formTitle" style="margin-bottom: 20px;">Financial Aid Student List</h3>
                    <jsp:include page="/ListStudentServlet"/>
                </div>
            </div>
        </main>
                
                <script>
                    var confirmation = document.getElementById('confimation');

            // Add a click event listener to the logout link
            logoutLink.addEventListener('click', function (event) {
                // Prevent the default click behavior
                event.preventDefault();

                // Show a confirmation dialog
                var confirmLogout = confirm('Are you sure you want to delete?');

                // If the user confirms the logout, redirect to index.jsp
                if (confirmLogout) {
                    window.location.href = 'index.jsp';
                }
            });
                </script>
    </body>
</html>