<%-- 
    Document   : viewStudentApplication
    Created on : Jun 8, 2023, 10:31:52 PM
    Author     : User
--%>

<%@page import="HandlingStatus.StudentApplicationDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java"%>
<%@page import="java.sql.Date"%>
<%@ page import="HandlingStatus.ApplicationInfo" %>
<%@ page import="HandlingStatus.StudentApplication" %>
<%@ page import="HandlingStatus.ViewStudentInfo" %>
<%@ page import="financialAid.FinancialAid" %>
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

            .navbar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: #B3B6B7;
            }

            .navbar-nav.ml-auto {
                margin-left: auto;
            }

            .nav-link,
            .navbar-brand {
                color: #fff;
                cursor: pointer;
                background-color: #ECF0F1;
                padding: 5px;
                border-radius: 5px;
                border: #222;
                margin-left: 10px;
            }

            .nav-link {
                margin-right: 1em !important;
            }

            .nav-link:hover {
                color: #000;
            }

            .navbar-collapse {
                justify-content: flex-end;
            }

            .logout-button {
                color: #fff;
                background-color: rgb(235, 106, 106);
                padding: 5px;
                border-radius: 5px;
                border: none;
                margin-left: 10px;
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
        <%
            // Assuming you have obtained the application ID from the request parameter
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            ApplicationInfo applicationInfo = StudentApplicationDao.getApllicationInfo(applicationId);
            ViewStudentInfo studentInfo = applicationInfo.getStudentInfo();
            FinancialAid financialAid = applicationInfo.getFinancialAid();
        %>

        <header>
            <nav class="navbar navbar-expand-md">
                <a class="navbar-brand" href="index.html">UMTStudentFinancialAid</a>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="financialAidRegistration.jsp">Financial Aid</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Awarding.jsp">Student Application List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link logout-button" href="logout.html">Logout</a>
                    </li>
                </ul>
            </nav>
        </header>
        <main>
            <h1 style="padding: 20px; align-content: center;
                justify-content: center; background-color: wheat;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); margin-bottom: 20px;"> Financial Aid Management</h1>
            <div class="container">
                <div class="form-container">


                    <legend><h3>Student Info</h3></legend>


                    <div class="mb-3 form">
                        <label for="name" class="form-label">Name :</label>
                        <input type="text" class="form-control" name="name" id="name" value="<%= studentInfo.getName()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Email :</label>
                        <input type="text" class="form-control" name="email" id="email" value="<%= studentInfo.getEmail()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Phone Number :</label>
                        <input type="text" class="form-control" name="phoneNo" id="phoneNo" value="<%= studentInfo.getPhoneNumber()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Matric Number :</label>
                        <input type="text" class="form-control" name="matric" id="matric" value="<%= studentInfo.getMatric()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Family Income :</label>
                        <input type="text" class="form-control" name="income" id="income" value="<%= studentInfo.getIncome()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Bank Name :</label>
                        <input type="text" class="form-control" name="bank" id="bank" value="<%= studentInfo.getBank()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Account Number :</label>
                        <input type="text" class="form-control" name="acc" id="acc" value="<%= studentInfo.getAcc()%>}" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Race :</label>
                        <input type="text" class="form-control" name="race" id="race" value="<%= studentInfo.getRace()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Religion :</label>
                        <input type="text" class="form-control" name="religion" id="religion" value="<%= studentInfo.getReligion()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Marital Status :</label>
                        <input type="text" class="form-control" name="status" id="status" value="<%= studentInfo.getStatus()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">NRIC :</label>
                        <input type="text" class="form-control" name="ic" id="ic" value="<%= studentInfo.getIc()%>" placeholder="" readonly=""/>
                    </div>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Course :</label>
                        <input type="text" class="form-control" name="course" id="course" value="<%= studentInfo.getCourse()%>" placeholder="" readonly=""/>
                    </div>


                </div>
                <div class="form-container">
                    <h3 id="formTitle" style="margin-bottom: 20px;">Financial Aid Info</h3>
                    <div class="mb-3 form">
                        <label for="name" class="form-label">Name :</label>
                        <input type="text" class="form-control" name="name" id="name" value="<%= financialAid.getName()%>" placeholder="" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="program" class="form-label">Program Type:</label><br/>
                        <input type="text" class="form-control" name="program" id="program" value="<%= financialAid.getProgram()%>" placeholder="" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="overview" class="form-label">Overview :</label>
                        <textarea class="form-control" name="overview" id="overview" readonly><%= financialAid.getOverview()%></textarea>
                    </div>
                    <div class="mb-3 form">
                        <label for="overview" class="form-label">Criteria :</label>
                        <textarea class="form-control" name="criteria" id="criteria" readonly><%= financialAid.getCriteria()%></textarea>
                    </div>
                    <div class="mb-3 form">
                        <label for="amount" class="form-label">Amount (RM):</label>
                        <input type="number" class="form-control" name="amount" id="amount" placeholder="" step="1000"value="<%= financialAid.getAmount()%>" readonly/>
                    </div>
                    <div class="mb-3 form">
                        <label for="dateline" class="form-label">Dateline :</label>
                        <input type="date" class="form-control" name="dateline" id="dateline" placeholder="" value="<%= financialAid.getDateline()%>" readonly/>
                    </div>
                </div>
                <div>
                    <input type="button" class="btn btn-primary form" value="Back" onclick="goBack()" />
                </div>
            </div>
        </main>
        <script>
            function goBack() {
                history.back();
            }
        </script>

    </body>
</html>