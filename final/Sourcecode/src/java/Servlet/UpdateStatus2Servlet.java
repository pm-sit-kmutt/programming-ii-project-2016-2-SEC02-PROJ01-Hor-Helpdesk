package Servlet;

import Model.Problem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateStatus2Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession s = request.getSession(true);
        String cId = (String)s.getAttribute("causeId");
        int causeId = Integer.parseInt(cId);
        s.setAttribute("causeId", cId);
        Problem p = Model.Problem.getProblem(causeId);
        String target = "/UpdateStatus2.jsp";
        
        request.setAttribute("message", p);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int statusId = Integer.parseInt(request.getParameter("statusId"));
        HttpSession s = request.getSession(true);
        Problem p = Model.Problem.getProblem(Integer.parseInt((String)s.getAttribute("causeId")));
        p.setStatusId(statusId);
        String target = "/UpdateStatus2.jsp";
        
        request.setAttribute("message", p);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
