package Servlet;

import Model.Announce;
import Model.ConnectionBuilder;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnnounceEditServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        String announceId = (String)s.getAttribute("announceId");
        int id = Integer.parseInt(announceId);
        Announce announce = Model.Announce.getAnnounce(id);
        String target = "/AnnounceEdit.jsp";
        
        request.setAttribute("announce", announce);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        System.out.println("-------------------------------------------------------");
        System.out.println(title);
        System.out.println(description);
        System.out.println("-------------------------------------------------------");
        HttpSession s = request.getSession(true);
        String announceId = (String)s.getAttribute("announceId");
        int id = Integer.parseInt(announceId);
        Announce announce = Model.Announce.getAnnounce(id);
        
        if (!(announce.getAnnounceTitle().equals(title) && announce.getAnnounceDes().equals(description))) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String date = sdf.format(new java.util.Date());
            try {
                Connection connect = ConnectionBuilder.getConnection();
                PreparedStatement ps = connect.prepareStatement(
                    "UPDATE Announce "
                    + "SET announceDes = ?, announceTime = ?, announceTitle = ?"
                    + "WHERE AnnounceId = ?");
                ps.setString(1,description);
                ps.setString(2,date);
                ps.setString(3,title);
                ps.setInt(4,id);
                int record = ps.executeUpdate();
                ps.close();
                connect.close();
            }
            catch(SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            }
            catch(Exception e) {
                System.out.println(e.getMessage());
            }
        }
        
        String target = "/HelpDesk/Announce";
        response.sendRedirect(target);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
