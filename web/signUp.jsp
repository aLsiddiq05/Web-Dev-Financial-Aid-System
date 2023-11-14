<%-- 
    Document   : signUp
    Created on : May 16, 2023, 10:01:21 PM
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
                margin-top: 50px;
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

            .form{
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
    <body>
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
            <form name="myForm" action="SignUpServlet" method="post">
                <div class="login-container">
                    <div class="container-fluid container-fluid-form login-form" style="padding-top: 50px;">
                        <h3>Sign Up</h3>
                        <p>Sign up with us now to get futher</p>
                        <div class="mb-3 form">
                            <label class="form-label">Name</label>
                            <input type="text" class="form-control" name="name" id="name" placeholder=""
                                   required="required" />
                            <div class="mb-3 form">
                                <label class="form-label">Password</label>
                                <input type="password" class="form-control" name="password" id="password" placeholder=""
                                       required="required" oninput="validatePassword(this)" />
                                <div id="passwordError" style="color: red;"></div>
                            </div>
                            <div class="mb-3 form">
                                <label class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder=""
                                       required="required" oninput="validateConfirmPassword(this)" />
                                <div id="confirmPasswordError" style="color: red;"></div>
                            </div>
                            <div class="mb-3 form">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" name="email" id="email" placeholder="" />
                            </div>
                            <div class="mb-3 form">
                                <label class="form-label">Phone Number</label>
                                <input type="tel" class="form-control" name="phone" id="phone" placeholder=""
                                       required="required" oninput="validatePhoneNumber(this)" />
                                <div id="phoneNumberError" style="color: red;"></div>
                            </div>
                            <input class="btn btn-primary form" type="submit" value="Sign Up"> 
                            <br/>
                            <p>
                                Already have an account?
                                <a href="login.jsp" class="text-muted">Log now</a>
                            </p>
                        </div>
                    </div>
            </form>
        </main>


        <script>
            function validatePassword(input) {
                var password = input.value;
                var passwordError = document.getElementById("passwordError");

                // Regular expression to match the password requirements
                var regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;

                if (!regex.test(password)) {
                    passwordError.textContent = "Password must be at least 8 characters long, contain an uppercase letter, a numeric character, and a special character.";
                    input.setCustomValidity("Invalid password");
                } else {
                    passwordError.textContent = "";
                    input.setCustomValidity("");
                }
            }

            function validateConfirmPassword(input) {
                var password = document.getElementsByName("password")[0].value;
                var confirmPassword = input.value;
                var confirmPasswordError = document.getElementById("confirmPasswordError");

                if (password !== confirmPassword) {
                    confirmPasswordError.textContent = "Passwords do not match.";
                    input.setCustomValidity("Passwords do not match");
                } else {
                    confirmPasswordError.textContent = "";
                    input.setCustomValidity("");
                }
            }

            function validatePhoneNumber(input) {
                var phoneNumber = input.value;
                var phoneNumberError = document.getElementById("phoneNumberError");

                // Regular expression to match numbers only
                var regex = /^[0-9]+$/;

                if (!regex.test(phoneNumber)) {
                    phoneNumberError.textContent = "Please enter a valid number.";
                    input.setCustomValidity("Invalid phone number");
                } else {
                    phoneNumberError.textContent = "";
                    input.setCustomValidity("");
                }
            }
        </script>

    </body>
</html>
