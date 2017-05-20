package Servlet;

import Model.Summary;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SummaryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        User user = (User)s.getAttribute("user");
        Summary summary = Model.Summary.getSummary(user.getUserId());
        String search = "current";
        String target = "/Summary.jsp";

        request.setAttribute("summary", summary);
        request.setAttribute("search", search);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String search = request.getParameter("search");
        HttpSession s = request.getSession(true);
        User user = (User)s.getAttribute("user");
        Summary summary = Model.Summary.getSummary(user.getUserId());
        String target = "/Summary.jsp";

        request.setAttribute("summary", summary);
        request.setAttribute("search", search);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
