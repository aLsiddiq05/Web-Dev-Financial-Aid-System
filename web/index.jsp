<%-- 
    Document   : index
    Created on : 15 Jun 2023, 12:49:31 am
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%-- 
     Document   : index.jsp
     Created on : Jun 10, 2023, 9:47:30 PM
     Author     : User
    --%>

    <head>
        <title>Financial Aid</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, 
              initial-scale=1">

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


            .header {
                position: relative;
                height: 100vh;
                font-size: 62.5%;
                margin-top: -50px;
            }

            .header:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: white;
                background-size: cover;
                background-position: center;
                opacity: 0;
                font-size: 62.5%;
            }
            .signup{

                text-align: center;
                padding: 30px 0 30px;
                font-weight: 300;
                font-size: 1.8rem;
                line-height: 3rem;

            }

            .description {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                text-align: center;
                color: #0D3842;
                padding: 0 15px;
                max-width: 600px;
                margin: 0 auto;
            }

            .content * {
                box-sizing: border-box;
            }
            .content {
                box-sizing: border-box;
                width: auto;
                margin: 25rem 0 0;
                padding: 0;
                max-width: none;
            }
            .content-top {
                max-width: 76.7rem;
                margin: 13rem auto 0;
                text-align: center;
                font-family: Roboto;
                font-size: 62.5%;
            }
            .content-top-title {
                font-weight: 900;
                font-size: 3.8rem;
                line-height: 4.5rem;
                letter-spacing: 0.06em;
                text-transform: uppercase;
                margin: 0 0 0.2rem;
            }
            .content-top-subtitle {
                font-size: 21px;
                font-style: italic;
                line-height: 3rem;
                margin: 0;
                font-weight: 400;
            }
            .content-top-subtitle-strong {
                color: var(--green);
                font-weight: bold;
            }
            .content-top-text {
                font-weight: 100;
                font-size: 2.1rem;
                line-height: 3rem;
                padding: 0 .5rem 0;
            }
            .content-top-separator {
                width: 10rem;
                height: 1px;
                background-color: black;
                border: none;
                margin: 3.5rem auto 0;
                padding: 0;
            }

            .description h1,
            .description p {
                font-size: 1.3rem;
                line-height: 1.5;
            }

            .description button {
                border: 1px solid #fff;
                background: #B3B6B7;
                border-radius: 5px;
                color: #fff;
                padding: 10px 20px;
                margin-top: 20px;
                font-size: 1rem;
            }

            .description button:hover {
                border: 1px solid #fff;
                background: #fff;
                color: #000;
            }

            /*        .overlay {
                        position: absolute;
                        min-height: 100%;
                        min-width: 100%;
                        top: 0;
                        left: 0;
                        background: rgba(0, 0, 0, 0.6);
                    }*/


            .features {
                margin: 4em auto;
                padding: 1em;
                position: relative;
            }

            .features-title {
                color: black;
                font-size: 1.3rem;
                font-weight: 700;
                margin-bottom: 20px;
                text-transform: uppercase;
            }

            .features img {
                -webkit-box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
                -moz-box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
                box-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
                margin-bottom: 16px;
            }

            /*        .features .form-control,
                    .features-input {
                        border-radius: 0;
                    }*/

            .features .btn {
                background-color: #6d47b3;
                border: 1px solid #5e2eb8;
                color: #fff;
                margin-top: 20px;
                border-radius: 5px;
            }

            .features .btn:hover {
                background-color: #333;
                border: 1px solid #333;
            }

            .background {
                background: #dedec8;
                padding: 4em 0;
            }

            .page-footer {
                background-color: #222;
                color: #ccc;
                padding: 30px 0 20px;
                text-align: center;
            }

            .footer-copyright {
                color: #666;
                padding: 0 15px;
            }

            @media (max-width: 991.98px) {
                .team {
                    padding: 0 15px;
                }
            }

            @media (max-width: 575.98px) {
                .description {
                    left: 0;
                    padding: 0 15px;
                    position: absolute;
                    top: 10%;
                    transform: none;
                    text-align: center;
                }

                .description h1 {
                    font-size: 2em;
                }

                .description p {
                    font-size: 1.2rem;
                }

                .features {
                    margin: 0;
                }

                .team {
                    max-width: 60%;
                }
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
                            <a class="nav-link" href="#">
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
                            <a class="nav-link" href="login.jsp">
                                <button type='submit' class='btn btn-primary form' id='submitBtn' style="background-color: #3D3D3D;">Login</button>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Right elements -->
            </div>
            <!-- Container wrapper -->
        </nav>


        <!--    <header class="header">
                <div class="overlay"></div>
                <div class="description">
                    <h1>Welcome to UMT Student Financial Aid System</h1>
                    <p>Apply for financial aid to support your education</p>
                    <a href="signup.html"><button class="btn btn-outline-secondary btn-lg">Apply Now</button></a>
                </div>
            </header>-->
        <header class="header">
            <div class="overlay">
                <section class="content-top">
                    <h3 class="content-top-title" style="font-size: 700%;">
                        UMT Financial Aid
                    </h3>
                    <p class="content-top-subtitle">
                        More than
                        <strong class="content-top-subtitle-strong">
                            80% of most Financial Aid companies
                        </strong>
                        with us.
                    </p>
                    <br>
                    <p class="content-top-text" style="font-size: 350%;">
                        UMT financial aid system is designed to alleviate the burden of tuition fees, 
                        living expenses, and other educational costs, allowing you to focus on your studies and personal growth. 
                        We offer a range of financial assistance programs, scholarships, grants, and loans tailored to meet the 
                        diverse needs of our student community.
                    </p>
                    <hr class="content-top-separator" />
                </section>
            </div>
        </header>
        <div class="signup" style="font-size: 120%;">
            <a href="signUp.jsp"><p style="color: green;">Sign up with us now!</p></a>
        </div>
        <div class="background" style="background-color:#E1F5FA;">
            <div class="container features">
                <h1 style="margin-bottom: 80px;">Step by Step and Criteria to Apply for Financial Aid Program</h1>
                <div class="row">
                    <div class="col-lg-6">
                        <h3 class="features-title">Sequential Application Procedure</h3>
                        <ol>
                            <li>Gather required documents and information.</li>
                            <li>Complete the online application form.</li>
                            <li>Submit supporting documents, such as financial statements.</li>
                            <li>Review and confirm application details.</li>
                            <li>Await notification of the application status.</li>
                        </ol>
                    </div>
                    <div class="col-lg-6">
                        <h3 class="features-title">Application Criteria</h3>
                        <ul>
                            <li>Must be a current student enrolled at UMT.</li>
                            <li>Must demonstrate financial need.</li>
                            <li>Must maintain satisfactory academic progress.</li>
                            <li>Must submit all required documentation.</li>
                            <li>Must meet any additional eligibility criteria set by the financial aid office.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="background">
            <div class="container features">
                <div class="row">
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <h3 class="features-title">Our Skill</h3>
                        <p>At UMT, we excel in managing the Financial Aid System with expertise and precision. 
                            With a streamlined process and advanced technology, we ensure transparent and efficient allocation 
                            of financial support to our students. Our knowledgeable team stays up to date with 
                            regulations and industry best practices, guaranteeing fairness and compliance. Count on our skill to
                            guide you through the financial aid process and support your educational journey.</p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <h3 class="features-title">Interaction</h3>
                        <p>The competition among students for financial aid is intense. 
                            Our University Students Financial Aid System fosters a competitive environment, 
                            encouraging students to showcase their unique strengths  leadership, communication, 
                            and strategic thinking skills is essential for qualifications. Through advanced technology 
                            and personalized guidance, we empower students to excel in the application process and secure the 
                            financial support they need for their academic pursuits..</p>
                    </div>
                    <div class="col-lg-4 col-md-4 col-sm-6">
                        <form action="SaveConcern">
                            <h3>Get in Touch!</h3>

                            <div>
                                <input type="email" class="form-control" placeholder="Email Address" name="email" required="">
                            </div>
                            <br/>
                            <div>
                                <textarea class="form-control" rows="4" name="concern"required=""></textarea>
                            </div>
                            <input type="submit" class="btn btn-secondary btn-block" value="Send" name="submit">
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <footer class="page-footer">
            <div class="container">
                <div class="">
                    <h6 class="text-uppercase font-weight-bold">Contact Us Here</h6>
                    <p>
                        <i class="fa-solid fa-phone"></i><b> No. Phone : 09-668 4111</b>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <a href="https://instagram.com/pejabat_bendahari_umt?igshid=MzRlODBiNWFlZA==" target="_blank" style="text-decoration: none; color: inherit;">
                            <i class="fab fa-instagram"></i>
                            <b>Instagram: pejabat_bendahari_umt</b>
                        </a>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <a href="https://www.facebook.com/pejabatbendahariumt?mibextid=ZbWKwL" target="_blank" style="text-decoration: none; color: inherit;">
                            <i class="fab fa-facebook"></i>
                            <b>Facebook: Pejabat Bendahari UMT</b>
                        </a>
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        &nbsp;
                        <a href="https://bendahari.umt.edu.my/" target="_blank" style="text-decoration: none; color: inherit;">
                            <i class="fas fa-globe"></i>
                            <b>Website: bendahari.umt.edu.my</b>
                        </a>
                    </p>
                </div>
            </div>
        </div>
        <div class="footer-copyright text-center">� 2023 Copyright: UMTStudentFinancialAid.com</div>
    </footer>

    <script src="WEB-INF/js/jquery-3.6.4.min.js"></script>
    <script src="WEB-INF/js/bootstrap.min.js"></script>
    <script src="WEB-INF/js/main.js"></script>
</body>
</html>

