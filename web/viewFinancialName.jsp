<%-- 
    Document   : EditFinancialAid
    Created on : Jun 4, 2023, 12:20:19 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.Date"%>
<%@page import="financialAid.ViewFinancialAidNameApplication" %>
<%@page import="financialAid.financialAidDao" %>
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

            .nav-link img {
                width: 150px; /* Adjust the width to your desired value */
                height: auto; /* Maintain the aspect ratio */
            }

        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" 
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
            crossorigin="anonymous"
            />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
            />

        <!-- Font Awesome -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            rel="stylesheet"
            />
        <!-- Google Fonts -->
        <link
            href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
            rel="stylesheet"
            />
        <!-- MDB -->
        <link
            href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.css"
            rel="stylesheet"
            />
        <link rel="stylesheet" type="text/css" href="userInfo.css">
        <title>Home</title>
        <style>
            .navbar-nav .nav-link.active,
            .dropdown-menu .dropdown-item.active,
            .dropdown-toggle.active {
                font-weight: bold;
                color: red;
            }
        </style>
        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
    </head>

    <body style="background-color: #FBFCFC">
        <%--<jsp:include page="adminNav.jsp" />--%>
        
        <main>
            <div class="container">
                <div class="form-container">
                    <legend><h3> Financial Aid </h3></legend>

                    <div class="mb-3 form">
                        <label for="name" class="form-label">Name :</label>
                        <input type="text" class="form-control" name="name" id="name" value="${name}" placeholder="" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="program" class="form-label">Program Type:</label><br/>
                        <input type="text" class="form-control" name="program" id="program" placeholder="" value="${program}" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="overview" class="form-label">Overview :</label>
                        <textarea class="form-control" name="overview" id="overview" readonly>${overview}</textarea>
                    </div>
                    <div class="mb-3 form">
                        <label for="overview" class="form-label">Criteria :</label>
                        <textarea class="form-control" name="criteria" id="criteria" readonly>${criteria}</textarea>
                    </div>  
                    <div class="mb-3 form">
                        <label for="amount" class="form-label">Amount (RM):</label>
                        <input type="number" class="form-control" name="amount" id="amount" placeholder="" step="1000"value="${amount}" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="dateline" class="form-label">Dateline :</label>
                        <input type="date" class="form-control" name="dateline" id="dateline" placeholder="" value="${dateline}" readonly/>
                    </div>

                    
                </div>
            </div>
        </main>
        <script>
            function goBack() {
                history.back();
            }

            // Get the logout link element
            var logoutLink = document.getElementById('logout-link');

            // Add a click event listener to the logout link
            logoutLink.addEventListener('click', function (event) {
                // Prevent the default click behavior
                event.preventDefault();

                // Show a confirmation dialog
                var confirmLogout = confirm('Are you sure you want to log out?');

                // If the user confirms the logout, redirect to index.jsp
                if (confirmLogout) {
                    window.location.href = 'index.jsp';
                }
            });
        </script>

    </body>
</html>
