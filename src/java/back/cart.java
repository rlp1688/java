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

public class cart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cart at " + request.getContextPath() + "</h1>");
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

            String id = request.getParameter("productId");
            String name = request.getParameter("name");
            String price = request.getParameter("price");

            PreparedStatement selectPs = con.prepareStatement("SELECT id FROM cart WHERE id = ?");
            selectPs.setString(1, id);
            ResultSet selectRs = selectPs.executeQuery();

            if (selectRs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Item already exist !!');");
                out.println("window.location.href = 'home.jsp';");
                out.println("</script>");
            } else {

                PreparedStatement insertPs = con.prepareStatement("INSERT INTO cart (id, name, price) VALUES (?, ?, ?);");

                insertPs.setString(1, id);
                insertPs.setString(2, name);
                insertPs.setString(3, price);

                int rowsAffected = insertPs.executeUpdate();
                System.out.println(rowsAffected);
                if (rowsAffected > 0) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Added to the cart');");
                    out.println("window.location.href = 'home.jsp';");
                    out.println("</script>");

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
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
