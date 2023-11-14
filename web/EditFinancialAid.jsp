<%-- 
    Document   : EditFinancialAid
    Created on : 11 Jun 2023, 3:51:20 pm
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
                <div class="form-container">
                    <form id="myForm" name="myForm" action="EditFinancialAid2" method="post">

                        <legend><h3>Edit Financial Aid </h3></legend>


                        <div class="mb-3 form">
                            <label for="name" class="form-label">Name :</label>
                            <input type="text" class="form-control" name="name" id="name" value="${name}" placeholder="" />
                        </div>
                        <div class="mb-3 form">
                            <label for="program" class="form-label">Program Type:</label><br/>
                            <select name="program" class="form-control">
                                <option value=""></option>
                                <option value="Education Loan" ${program == 'Education Loan' ? 'selected' : ''}>Education Loan</option>
                                <option value="Endowment" ${program == 'Endowment' ? 'selected' : ''}>Endowment</option>
                                <option value="Scholarship" ${program == 'Scholarship' ? 'selected' : ''}>Scholarship</option>
                                <option value="Grant" ${program == 'Grant' ? 'selected' : ''}>Grant</option>
                                <option value="One Off" ${program == 'One Off' ? 'selected' : ''}>One Off</option>
                            </select>
                        </div>
                        <div class="mb-3 form">
                            <label for="overview" class="form-label">Overview :</label>
                            <textarea class="form-control" name="overview" id="overview">${overview}</textarea>
                        </div>
                        <div class="mb-3 form">
                            <label for="overview" class="form-label">Criteria :</label>
                            <textarea class="form-control" name="criteria" id="criteria">${criteria}</textarea>
                        </div>
                        <div class="mb-3 form">
                            <label for="amount" class="form-label">Amount (RM):</label>
                            <input type="number" class="form-control" name="amount" id="amount" placeholder="" step="500"value="${amount}"/>
                        </div>
                        <div class="mb-3 form">
                            <label for="dateline" class="form-label">Dateline :</label>
                            <input type="date" class="form-control" name="dateline" id="dateline" placeholder="" value="${dateline}"/>
                        </div>
                        <input type="hidden" name="id" value="${id}" />
                        <div>
                            <input type="submit" class="btn btn-primary form" id="submitBtn" value="Update"/>
<!--                            <input type="cancel" class="btn btn-primary form" value="Cancel" onclick="redirectToRegistrationPage()" />-->
                        </div>
                    </form>
                </div>
                <div class="output-container">
                    <h3 id="formTitle" style="margin-bottom: 20px;">Financial Aid Program List</h3>
                    <jsp:include page="/ViewFinancialAid"/>
                </div>
            </div>
        </main>
        <script>
            function redirectToRegistrationPage() {
                window.location.href = "http://localhost:8080/Assignment/financialAidRegistration.jsp";
            }
        </script>

    </body>
</html>