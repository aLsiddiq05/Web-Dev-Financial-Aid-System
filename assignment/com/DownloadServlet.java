/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package assignment.com;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DownloadServlet", urlPatterns = {"/DownloadServlet"})
public class DownloadServlet extends HttpServlet {

    public static int BUFFER_SIZE = 1024 * 100;
    public static final String UPLOAD_DIR = "resources";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        if (fileName == null || fileName.equals("")) {
            response.setContentType("text/html");
            response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
        } else {
            String applicationPath = getServletContext().getRealPath("");
            String downloadPath = applicationPath + File.separator + UPLOAD_DIR;
            String filePath = downloadPath + File.separator + fileName;
            File file = new File(filePath);

            if (file.exists()) {
                String mimeType = "application/octet-stream";
                response.setContentType(mimeType);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", file.getName());
                response.setHeader(headerKey, headerValue);

                try (OutputStream outStream = response.getOutputStream();
                     FileInputStream inputStream = new FileInputStream(file)) {

                    byte[] buffer = new byte[BUFFER_SIZE];
                    int bytesRead = -1;

                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outStream.write(buffer, 0, bytesRead);
                    }
                }
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<h3>File " + fileName + " Is Not Present .....!</h3>");
            }
        }
    }
}

