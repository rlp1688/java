package back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class insert extends HttpServlet {

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
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", "");

            String id = request.getParameter("id");
            String fname = request.getParameter("fname");
            String email = request.getParameter("email");
            String contact_no = request.getParameter("contactno");
            String username = request.getParameter("username");
            String pwd = request.getParameter("password");
            String cs = request.getParameter("confirm_password");

            
            PreparedStatement selectPs = con.prepareStatement("SELECT id FROM user WHERE id = ?");
            selectPs.setString(1, id);
            ResultSet selectRs = selectPs.executeQuery();

            
            if (selectRs.next()) {
                
                out.println("Id already exists. Please choose a different Id.");
            } else {
               
                PreparedStatement insertPs = con.prepareStatement("INSERT INTO user (id, fname, email,contact_no, username, password,confirm_password) VALUES (?, ?, ?, ?, ?, ?, ?);");

                insertPs.setString(1, id);
                insertPs.setString(2, fname);
                insertPs.setString(3, email);
                insertPs.setString(4, contact_no);
                insertPs.setString(5, username);
                insertPs.setString(6, pwd);
                insertPs.setString(7, cs);

                int rowsAffected = insertPs.executeUpdate();
                System.out.println(rowsAffected);
                if (rowsAffected > 0) {
                    out.println("alert('Registration Successful');");
                    response.sendRedirect("login_1.jsp");
                } else {

                    out.println("window.location.href = 'index.jsp';"); 

                }

                insertPs.close(); 
            }

            con.close(); 

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insert.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
