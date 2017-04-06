package Servlet;

import Model.ConnectionBuilder;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        User u = new User();
        s.setAttribute("user", u);
        String target = null;
        
        u = (User)s.getAttribute("user");
        
        if(u.getUserId() == 0 || u.getUserId() == -1){
            target = "/Login.jsp";
        }
        else {
            target = "/Menu";
        }
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        try {
            HttpSession s = request.getSession();
            Connection connect = ConnectionBuilder.getConnection();
            PreparedStatement ps = connect.prepareStatement("SELECT userId FROM User WHERE userEmail = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet result = ps.executeQuery();
            String target = null;
            
            if(!result.isBeforeFirst()){
                User u = new User(-1);
                s.setAttribute("user", u);
                target = "/Login.jsp";
            }
            else {
                while(result.next()){
                    User u = new User(result.getLong("userId"));
                    s.setAttribute("user", u);
                }
                target = "/Menu";
            }
            
            getServletContext().getRequestDispatcher(target).forward(request, response);
        }
        catch(Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
