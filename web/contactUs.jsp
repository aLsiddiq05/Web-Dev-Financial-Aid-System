<%-- 
    Document   : contactUs
    Created on : 9 Jun 2023, 10:49:00 pm
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>About Us</title>
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Seymour+One&display=swap" rel="stylesheet" />
        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="styles.css" />
    </head>

    <body>
        <jsp:include page="studentNav.jsp" />
        <br>
        <main>
            <div class="bgimgs"></div>
            <div class="content flex-sm-row">
                <div class="left justify-content-sm-around gap-sm-4">
                    <div class="container-fluid-c container-fluid compbackground">
                        <p class="title text-sm-end" style="width: 80px">
                            <b>Concern</b>
                        </p>
                        <p>
                            Have any concern? You can send your concern through this form and
                            we will provide assistance through your email.🤗
                        </p>
                        <form action="${pageContext.request.contextPath}/submitConcern" method="POST">
                            <textarea
                                id="concern"
                                name="concern"
                                rows="8"
                                cols="70"
                                placeholder="Write your concern here"
                                ></textarea
                            ><br /><br />
                            <input 
                                style="margin-bottom: 20px; border-radius: 10px"
                                type="submit"
                                value="Submit"
                                />
                            <input
                                style="margin-left: 20px; border-radius: 10px"
                                type="reset"
                                value="Reset"
                                />
                        </form>
                    </div>
                    <div class="container-fluid-c container-fluid contact-us">
                        <p class="title" style="width: 110px"><b>Contact Us</b></p>
                        <!-- <h4>Contact Us</h4> -->
                        <div class="content">
                            <p>
                                <i class="fa-solid fa-phone"></i><b> No. Phone : 09-668 4111</b>
                            </p>
                            <p>
                                <a href="https://instagram.com/pejabat_bendahari_umt?igshid=MzRlODBiNWFlZA==" target="_blank" style="text-decoration: none; color: inherit;">
                                    <i class="fab fa-instagram"></i>
                                    <b>Instagram: pejabat_bendahari_umt</b>
                                </a>
                            </p>
                            <p>
                                <a href="https://www.facebook.com/pejabatbendahariumt?mibextid=ZbWKwL" target="_blank" style="text-decoration: none; color: inherit;">
                                    <i class="fab fa-facebook"></i>
                                    <b>Facebook: Pejabat Bendahari UMT</b>
                                </a>
                            </p>
                            <p>
                                <a href="https://bendahari.umt.edu.my/" target="_blank" style="text-decoration: none; color: inherit;">
                                    <i class="fas fa-globe"></i>
                                    <b>Website: bendahari.umt.edu.my</b>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="container-fluid-c container-fluid location">
                    <p class="title" style="width: 88px"><b>Location</b></p>
                    <div class="desc">
                        <img
                            src="canseloriUMT.jpg"
                            alt=""
                            width="120px"
                            height="100px"
                            />
                        <div class="description">
                            <h4>Pejabat Bendahari UMT</h4>
                            <p>
                                Universiti Malaysia Terengganu,<br />
                                21030 Kuala Nerus,<br />
                                Terengganu
                            </p>
                        </div>
                    </div>
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15888.236890882621!2d103.0871553!3d5.4079509!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31b7bd10413ee073%3A0x55a8c9b32cd1d293!2sPejabat%20Bendahari%2C%20UMT!5e0!3m2!1sen!2smy!4v1686365588296!5m2!1sen!2smy" 
                            class="w-auto"
                            width="600"
                            height="450"
                            style="border: 0; padding-bottom: 10px"
                            allowfullscreen=""
                            loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
            </div>
        </main>
        <jsp:include page="footer.jsp" />
        <!--<button onclick="window.location.href = 'userInfo.jsp'">Back</button>-->
        <!-- <footer class = "site-footer"align="center">
        <p>Copyright © 2022 Restorans Kita | ALL RIGHT RESERVED</p>
        </footer> -->
        <!-- Bootstrap JavaScript Libraries -->
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
            crossorigin="anonymous"
        ></script>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://kit.fontawesome.com/f039f0efa8.js"
            crossorigin="anonymous"
        ></script>
    </body>
</html>

