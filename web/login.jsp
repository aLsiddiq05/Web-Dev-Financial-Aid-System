<%-- 
    Document   : login
    Created on : May 23, 2023, 10:38:12 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <style>

            html,
            body {
                height: 100%;
            }
            html {
                font-size: auto;
            }
            html, * {
                box-sizing: border-box;
            }
            body {
                display: flex;
                flex-direction: column;
                min-width: 32rem;
                font-size: 1.5rem;
                line-height: 1.8;
                font-family: 'Roboto', sans-serif;
                margin: 0;
            }
            .nav-link img {
                width: 150px; /* Adjust the width to your desired value */
                height: auto; /* Maintain the aspect ratio */
            }

            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                width: fit-content;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                margin-top: 90px;
            }

            .container-fluid-form {
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                max-width: fit-content;
                /* padding: 150px; */
            }

            .container-fluid-img {
                width: 80px;
                margin: 50px;
            }

            .form {
                width: 30vw;
            }
        </style>
        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
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

    </head>
    <body style="background-color: #FBFCFC">
           <nav class="navbar navbar-expand-lg navbar-primary bg-light sticky-top">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <!-- Toggle button -->
                <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>

                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left links -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">
                                <img src="logo.jpg" alt="UMT Financial Aid System Logo">
                            </a>
                        </li>

                    </ul>
                    <!-- Left links -->
                </div>
                <!-- Collapsible wrapper -->

                <!-- Right elements -->
                <div class="d-flex align-items-center">
                    <!-- Profile Picture -->
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
<!--                            <a class="nav-link" href="login.jsp">
                                <button type='submit' class='btn btn-primary form' id='submitBtn' style="background-color: #3D3D3D;">Login</button>
                            </a>-->
                        </li>
                    </ul>
                </div>
                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>
        <main>
            <form id="myForm" action="" method="POST">
                <div class="login-container">
                    <div class="container-fluid-form container-fluid form" style="padding-top: 50px;">
                        <h3>Login</h3>
                        <div class="mb-3 form">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" id="email"/>
                        </div>
                        <div class="mb-3 form">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" name="password" id="password"/>
                        </div>
                        <div class="mb-3 form">
                            <input type="radio" name="occupation" id="student" value="student" required/> Student
                        </div>
                        <div class="mb-3 form">
                            <input type="radio" name="occupation" id="admin" value="admin"/> Admin
                        </div>
                        <button type="submit" class="btn btn-primary form" name="action">Login</button>
                        <br />
                        <p>
                            Don't have an account?
                            <a href="signUp.jsp" class="text-muted">Sign up first!</a>
                        </p
                    </div>
                </div>
            </form>
        </main>
        <script>
            var form = document.getElementById("myForm");
            var studentRadio = document.getElementById("student");
            var adminRadio = document.getElementById("admin");

            form.addEventListener("submit", function (event) {
                event.preventDefault(); // Prevent the form from submitting

                if (studentRadio.checked) {
                    form.action = "doLogin.jsp"; // Set the action to doLogin.jsp
                } else if (adminRadio.checked) {
                    form.action = "AdminController"; // Set the action to AdminController.java
                }

                form.submit(); // Submit the form with the updated action
            });
        </script>
    </body>
</html>
