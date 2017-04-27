package Servlet;

import Model.ConnectionBuilder;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnnounceFormServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String target = "/AnnounceForm.jsp";
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date = sdf.format(new Date());
        int dormId = 0;
        HttpSession s = request.getSession(true);
        User user = (User)s.getAttribute("user");
        
        try {
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement(
                "SELECT User.userId, Dormitory.dormId "
                + "FROM User "
                + "INNER JOIN Dormitory ON User.userId = Dormitory.User_userId "
                + "WHERE User.userId = ? ");
            ps.setLong(1,user.getUserId());
            ResultSet result = ps.executeQuery();
            while(result.next()){
                dormId = result.getInt("dormId");
            }
            ps.close();
            
            ps = connect.prepareStatement(
                "INSERT INTO Announce "
                + "VALUES (null, ?, ?, ?, ?)");
            ps.setString(1,description);
            ps.setString(2,date);
            ps.setString(3,title);
            ps.setInt(4,dormId);
            int record = ps.executeUpdate();
            ps.close();
            
            ps = connect.prepareStatement("SELECT MAX(AnnounceId) FROM Announce");
            result = ps.executeQuery();
            while(result.next()){
                String announceId = ""+result.getInt("MAX(AnnounceId)");
                s.setAttribute("announceId", announceId);
            }
            ps.close();
            connect.close();
        }
        catch(SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        String target = "/HelpDesk/Announce";
        response.sendRedirect(target);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
