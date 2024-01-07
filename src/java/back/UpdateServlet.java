
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
public class UpdateServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    
    @Override 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/auth";
            Connection con = DriverManager.getConnection(url, "root", "");

            String id = request.getParameter("productId");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String description = request.getParameter("description");
            String status = request.getParameter("status");
            
            
            Part file = request.getPart("image");
            String image = file.getSubmittedFileName();
            String uploadDirectory = "C:/Users/Falcon_9/Documents/NetBeansProjects/greensupermarket/web/images";
            String uploadPath = uploadDirectory + File.separator + image;

            try (FileOutputStream fos = new FileOutputStream(uploadPath); InputStream is = file.getInputStream()) {

                byte[] data = new byte[1024];
                int bytesRead;

                while ((bytesRead = is.read(data)) != -1) {
                    fos.write(data, 0, bytesRead);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

            String insertQuery = "UPDATE product SET name=?, price=?, description=?, status=?, image=? WHERE id=?";

            try (PreparedStatement insertPs = con.prepareStatement(insertQuery)) {
                insertPs.setString(1, name);
                insertPs.setString(2, price);
                insertPs.setString(3, description);
                insertPs.setString(4, status);
                insertPs.setString(5, image);
                insertPs.setString(6, id);

                int rowsAffected = insertPs.executeUpdate();

                if (rowsAffected > 0) {
                    System.out.println("success");
                    response.sendRedirect("home.jsp");
                } else {
                    System.out.println("error");
                    
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UpdateServlet.class.getName()).log(Level.SEVERE, null, ex);
            response.sendRedirect("error.jsp");
        }
    } 
    }

    


