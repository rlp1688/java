
package back;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class logout extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet logout</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet logout at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String sqlQuery = "DELETE FROM cart";

    try {PrintWriter out = response.getWriter();
        
        Class.forName("com.mysql.jdbc.Driver");

        
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/auth", "root", "");
                PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery)) {

            int rowsDeleted = preparedStatement.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Logout success.');");
                out.println("window.location.href = 'login_1.jsp';");
                out.println("</script>");
                
            } else {
                out.println("<script type=\"text/javascript\">");
                
                out.println("window.location.href = 'login_1.jsp';");
                out.println("</script>");
            }
        }
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        response.getWriter().println("Error: " + e.getMessage());
    }
    processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }
    
}
