package Servlet;

import Model.ReportProblem;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ReportProblemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession s = request.getSession(true);
        User user = (User)s.getAttribute("user");
        ReportProblem reportP = Model.ReportProblem.getReportProblem(user.getUserId());
        String target = "/ReportProblem.jsp";
        
        request.setAttribute("message", reportP);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int report = Integer.parseInt(request.getParameter("report"));
        HttpSession s = request.getSession(true);
        User user = (User)s.getAttribute("user");
        ReportProblem reportP = Model.ReportProblem.getReportProblem(user.getUserId());
        reportP.report(report);
        String target = "/ReportProblem.jsp";
        
        request.setAttribute("message", reportP);
        
        getServletContext().getRequestDispatcher(target).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
