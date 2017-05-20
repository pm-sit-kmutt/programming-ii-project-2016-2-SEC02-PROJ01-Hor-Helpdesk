package Servlet;

import Model.ListProblem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateStatus1Servlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        if(s.getAttribute("causeId") == null || !(((String)s.getAttribute("causeId")).equals("-1"))){
            s.setAttribute("causeId", "-1");
        }
        User user = (User)s.getAttribute("user");
        ListProblem listS = Model.ListProblem.getShowListProblem(user.getUserId());
        String target = "/UpdateStatus1.jsp";
        
        request.setAttribute("message", listS);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int causeId = Integer.parseInt(request.getParameter("causeId"));
        HttpSession s = request.getSession(true);
        String cId = causeId + "";
        s.setAttribute("causeId", cId);
        String target = "/HelpDesk/UpdateStatus2";
        response.sendRedirect(target);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
