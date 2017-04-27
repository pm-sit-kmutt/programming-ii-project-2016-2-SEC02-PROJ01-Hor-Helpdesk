package Servlet;

import Model.Announce;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnnounceServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        String announceId = (String)s.getAttribute("announceId");
        int aId = Integer.parseInt(announceId);
        Announce Announce = Model.Announce.getAnnounce(aId);
        String target = "/Announce.jsp";
        
        request.setAttribute("announce", Announce);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int id = Integer.parseInt(request.getParameter("id"));
        Announce Announce = Model.Announce.getAnnounce(id);
        String target = "/Announce.jsp";
        
        request.setAttribute("announce", Announce);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
