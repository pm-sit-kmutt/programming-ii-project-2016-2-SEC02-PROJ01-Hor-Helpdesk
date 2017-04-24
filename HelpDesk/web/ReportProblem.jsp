<%-- 
    Document   : ReportProblem
    Created on : Mar 25, 2017, 10:42:22 AM
    Author     : Poppular
--%>
<%@page import="Model.Problem"%>
<%@page import="Model.Problem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.User"%>
<%@page import="Model.ReportProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Problem</title>
        <script src="assets/js/jquery-3.2.0.min.js"></script>
        <script src="assets/js/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/alertify.min.css">
        <script type="text/javascript">
            function confirmReport(num) {
                alertify.confirm(
                    "Are you sure?", 
                    "คุณจะแจ้งปัญหานี้แน่ใจหรือไม่", 
                    function(){
                        $('#report').val(""+num);
                        alertify.success('YES'); 
                        $('#form').submit(); 
                    }, 
                    function(){ 
                        alertify.error('NO');
                    }
                );
            }
        </script>
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        ReportProblem reportP = (ReportProblem)request.getAttribute("message");
        ArrayList<Problem> list = reportP.getList(); %>
        <%@include file="Navbar.jsp" %>
        <form method="post" action="/HelpDesk/ReportProblem" id="form">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Report Problem</h1>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover table-condensed table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>problem name</th>
                                <th class="text-center">report</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i = 0; i< reportP.getProblemName().size(); i++) { 
                                boolean have = false; 
                                for (int j = 0; j < list.size(); j++) { 
                                    if (list.get(j).getProblemId() == (i+1)) { 
                                        have = true; 
                                        break;  
                                    } 
                                } %>
                                <tr>
                                    <td class="text-center"><%= (i+1) %></td>
                                    <td><%= reportP.getProblemName().get(i) %></td>
                                    <td class="text-center">
                                        <% if(have) {
                                            for (int j = 0; j < list.size(); j++) {
                                                if (list.get(j).getProblemId() == (i+1)) {
                                                    if(list.get(j).getStatusId() == 3){ %>
                                                        <button type="button" class="btn btn-primary" onclick="confirmReport(<%= (i+1) %>)">Report</button>
                                                    <% }else if(list.get(j).getStatusId() == 1) { %>
                                                        <p class="btn btn-danger status" readonly><%= list.get(j).getStatus() %></p>
                                                    <% } else if(list.get(j).getStatusId() == 2) {%>
                                                        <p class="btn btn-warning status" readonly><%= list.get(j).getStatus() %></p>
                                                    <% }
                                                }
                                            }
                                        } else { %>
                                            <button type="button" class="btn btn-primary" onclick="confirmReport(<%= (i+1) %>)">Report</button> 
                                        <% }
                                        have = false; %>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>

                    </table>
                </div>
                <div style="display: none;">
                    <input type="text" name="report" id="report">
                </div>
                <%@include file="BackButton.jsp" %>
            </div>
        </form>
    </body>
</html>
