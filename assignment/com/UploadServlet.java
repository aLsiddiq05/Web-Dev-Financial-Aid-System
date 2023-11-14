/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)    // 1 GB
public class UploadServlet extends HttpServlet {

    PrintWriter out = null;
    Connection con = null;
    PreparedStatement ps = null;
    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            out = response.getWriter();
            session = request.getSession(false);
            String folderName = "resources";
            String application_status = "pending"; // Set the initial status as "pending"
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart1 = request.getPart("payslip");
            String fileName1 = filePart1.getSubmittedFileName();
            String path1 = folderName + File.separator + fileName1;
            InputStream is1 = filePart1.getInputStream();
            Files.copy(is1, Paths.get(uploadPath + File.separator + fileName1), StandardCopyOption.REPLACE_EXISTING);

            Part filePart2 = request.getPart("cgpa");
            String fileName2 = filePart2.getSubmittedFileName();
            String path2 = folderName + File.separator + fileName2;
            InputStream is2 = filePart2.getInputStream();
            Files.copy(is2, Paths.get(uploadPath + File.separator + fileName2), StandardCopyOption.REPLACE_EXISTING);

            String email = request.getParameter("email");
            String financialAidName = request.getParameter("financial_name");

            try {
                con = DB.getConnection();
                System.out.println("Connection established");

                String sql = "INSERT INTO applications (payslip, cgpa, path, stu_email, financial_name, application_status, submission_datetime) VALUES (?, ?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, fileName1);
                ps.setString(2, fileName2);
                ps.setString(3, path1 + "," + path2); // Store both file paths in a single column
                ps.setString(4, email);
                ps.setString(5, financialAidName);
                ps.setString(6, application_status);
                ps.setTimestamp(7, new Timestamp(new Date().getTime())); // Set the current date and time

                int status = ps.executeUpdate();

                if (status > 0) {
                    String msg = fileName1 + " and " + fileName2 + " files uploaded successfully...";
                    response.setContentType("text/html");
                    PrintWriter writer = response.getWriter();
                    writer.println("<script type=\"text/javascript\">");
                    writer.println("alert('Application Successful');");
                    writer.println("window.location.href = 'fileList.jsp';");
                    writer.println("</script>");
                    System.out.println("Files uploaded successfully...");
                    System.out.println("Uploaded Path: " + uploadPath);
                }
            } catch (SQLException e) {
                out.println("Exception: " + e);
                System.out.println("Exception1: " + e);
            } finally {
                try {
                    if (ps != null) {
                        ps.close();
                    }
                    if (con != null) {
                        con.close();
                    }
                } catch (SQLException e) {
                    out.println(e);
                }
            }

        } catch (IOException | ServletException e) {
            out.println("Exception: " + e);
            System.out.println("Exception2: " + e);
        }
    }
}
