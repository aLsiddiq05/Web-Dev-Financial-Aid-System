<%-- 
    Document   : studentNav
    Created on : 13 Jun 2023, 11:35:46 am
    Author     : User
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Base64" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Step 1: Load JDBC driver...
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Step 2: Establish the connection...
    String myURL = "jdbc:mysql://localhost:3306/assignment";
    Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");

    // Step 3: Create statement object....
    Statement myStatement = myConnection.createStatement();

    // Step 4: Retrieve the profile picture from the database
    String email = (String) session.getAttribute("email");
    String profilePictureQuery = "SELECT pro_pict FROM student WHERE email='" + email + "'";
    ResultSet profilePictureResult = myStatement.executeQuery(profilePictureQuery);
    String base64Image = "";

    if (profilePictureResult.next()) {
        byte[] imageData = profilePictureResult.getBytes("pro_pict");
        if (imageData != null && imageData.length > 0) {
            base64Image = Base64.getEncoder().encodeToString(imageData);
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        <!-- Bootstrap CSS -->
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
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-primary bg-light">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Navbar brand -->
                    <div  class="navbar-brand mt-2 mt-lg-0" href="#" id="img-logo">
                        <img
                            src="logo.jpg"
                            width="150px"
                            alt="FinancialAid Logo"
                            loading="lazy"
                            />
                    </div>
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <div class="dropdown">
                                <a
                                    class="dropdown-toggle d-flex align-items-center hidden-arrow nav-link"
                                    href="#"
                                    id="navbarDropdownMenuAvatar"
                                    role="button"
                                    data-mdb-toggle="dropdown"
                                    aria-expanded="false"
                                    >Profile</a
                                >
                                <ul
                                    class="dropdown-menu dropdown-menu-end"
                                    aria-labelledby="navbarDropdownMenuAvatar"
                                    >
                                    <li>
                                        <a class="dropdown-item" href="userInfo.jsp">Student's Information</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="editData.jsp">Edit Information</a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="fileList.jsp">Application List</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="financialAid.jsp">Financial Aid</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contactUs.jsp">Contact Us</a>
                        </li>
                    </ul>
                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Profile Picture -->
                    <div class="dropdown">
                        <a class="dropdown-toggle d-flex align-items-center hidden-arrow" href="#" id="navbarDropdownMenuAvatar" role="button" data-mdb-toggle="dropdown" aria-expanded="false">
                            <img src="data:image/jpeg;base64, <%= base64Image%>" alt="Profile Picture" style="width: 50px; height: 50px; border-radius: 50%;">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                            <li>
                                <a class="dropdown-item" href="userInfo.jsp">My profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="LogoutServlet" onclick="return confirm('Are you sure you want to log out?')">Logout</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <!-- Navbar -->
        <script>
            // Get the current page URL
            var currentPageUrl = window.location.href;

            // Remove the previous "active" class, if any, from main navigation links
            var currentLink = document.querySelector(".navbar-nav .active");
            if (currentLink) {
                currentLink.classList.remove("active");
            }

            // Find the link with a matching href and add the "active" class to main navigation links
            var links = document.querySelectorAll(".navbar-nav .nav-link");
            for (var i = 0; i < links.length; i++) {
                if (links[i].href === currentPageUrl) {
                    links[i].classList.add("active");
                    break;
                }
            }

            // Remove the previous "active" class, if any, from dropdown menu links
            var currentDropdownLink = document.querySelector(".dropdown-menu .active");
            if (currentDropdownLink) {
                currentDropdownLink.classList.remove("active");
            }

            // Find the link with a matching href and add the "active" class to dropdown menu links
            var dropdownLinks = document.querySelectorAll(".dropdown-menu .dropdown-item");
            for (var j = 0; j < dropdownLinks.length; j++) {
                if (dropdownLinks[j].href === currentPageUrl) {
                    dropdownLinks[j].classList.add("active");

                    // Highlight the dropdown toggle
                    var dropdownToggle = document.querySelector(".dropdown-toggle");
                    dropdownToggle.classList.add("active");

                    break;
                }
            }
        </script>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"
        ></script>
        <!-- MDB -->
        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.1/mdb.min.js"
        ></script>
    </body>
</html>

