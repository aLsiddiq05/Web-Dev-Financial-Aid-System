<%-- 
    Document   : doLogin
    Created on : May 25, 2023, 2:17:31 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");

            session.setAttribute("email", email);

            Class.forName("com.mysql.cj.jdbc.Driver");

            String myURL = "jdbc:mysql://localhost:3306/assignment";
            Connection myConnection = DriverManager.getConnection(myURL, "root", "admin");
            Statement st = myConnection.createStatement();
            ResultSet rs = st.executeQuery("SELECT email, password FROM student WHERE email='" + email + "' and password='" + password + "'");

            try {
                if (rs.next()) {
//                    String dbname = rs.getString("name");
                    String dbemail = rs.getString("email");
                    String dbpassword = rs.getString("password");

                    if (password.equals(dbpassword) && email.equals(dbemail)) {
                        response.sendRedirect("userInfo.jsp");
                    }
                } else {
                    String alertMessage = "Invalid email or password!";
                    String alertScript = "alert('" + alertMessage + "'); window.history.back();";
                    response.getWriter().println("<script>" + alertScript + "</script>");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>

    </body>
</html>

