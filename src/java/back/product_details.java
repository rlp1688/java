package back;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class product_details extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            PrintWriter out = response.getWriter();

            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/auth";
            Connection con = DriverManager.getConnection(url, "root", "");

            String id = request.getParameter("id");
            String name = request.getParameter("productName");
            String price = request.getParameter("productPrice");
            String description = request.getParameter("productDescription");
            String status = request.getParameter("productStatus");

            Part file = request.getPart("file2");
            String imagefile = file.getSubmittedFileName();
            String uploadDirectory = "C:/Users/Falcon_9/Documents/NetBeansProjects/greensupermarket/web/images";
            String uploadPath = uploadDirectory + File.separator + imagefile;

            try (FileOutputStream fos = new FileOutputStream(uploadPath); InputStream is = file.getInputStream()) {

                byte[] data = new byte[1024];
                int bytesRead;

                while ((bytesRead = is.read(data)) != -1) {
                    fos.write(data, 0, bytesRead);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            
            String insertQuery = "INSERT INTO product (id, name, price, description, status, image) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement insertPs = con.prepareStatement(insertQuery)) {
                insertPs.setString(1, id);
                insertPs.setString(2, name);
                insertPs.setString(3, price);
                insertPs.setString(4, description);
                insertPs.setString(5, status);
                insertPs.setString(6, imagefile);

                int rowsAffected = insertPs.executeUpdate();

                if (rowsAffected > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Product added');");
                    out.println("window.location.href = 'home.jsp';");
                    out.println("</script>");
                } else {
                    response.sendRedirect("error.jsp");
                }
            }

            con.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(product_details.class.getName()).log(Level.SEVERE, null, ex);
        }

        processRequest(request, response);
    }
}
