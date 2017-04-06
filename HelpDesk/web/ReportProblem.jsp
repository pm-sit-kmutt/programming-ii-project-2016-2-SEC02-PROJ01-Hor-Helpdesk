<%-- 
    Document   : ReportProblem
    Created on : Mar 25, 2017, 10:42:22 AM
    Author     : Poppular
--%>
<%@page import="Model.User"%>
<%@page import="Model.ReportProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Problem</title>
        <script src="assets/js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/sweetalert.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        ReportProblem reportP = (ReportProblem)request.getAttribute("message"); %>
        <%@include file="Navbar.jsp" %>
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
                            <th>report</th>
                        </tr>
                    </thead>
                    <form method="post" action="/ReportProblem" id="form" onsubmit="return confirmReport()"></form>
                    <tbody>
                        <% for(int i = 0; i< reportP.getProblemName().size(); i++) { 
                            boolean have = false; 
                            for (int j = 0; j < reportP.getList().size(); j++) { 
                                if (reportP.getList().get(j).getProblemId() == (i+1)) { 
                                    have = true; 
                                    break;  
                                } 
                            } %>
                            <tr>
                                <td class="text-center"><%= (i+1) %></td>
                                <td><%= reportP.getProblemName().get(i) %></td>
                                <% if(have) {
                                    for (int j = 0; j < reportP.getList().size(); j++) {
                                        if (reportP.getList().get(j).getProblemId() == (i+1)) {
                                            if(reportP.getList().get(j).getStatusId() == 3){ %>
                                            <td><button type="submit" name="report" value='<%= (i+1) %>' form="form" class="btn btn-warning">Report</button></td>
                                            <% }else{ %>
                                                <td><button type="submit" name="report" value='<%= (i+1) %>' form="form" class="btn btn-default" disabled="disabled">Report</button></td>
                                            <% }
                                        }
                                    }
                                } else { %>
                                    <td><button type="submit" name="report" value='<%= (i+1) %>' form="form" class="btn btn-warning">Report</button></td>    
                                <% }
                                have = false; %>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <%@include file="BackButton.jsp" %>
        </div>
        <script type="text/javascript">
            function confirmReport(){
                swal({
                    title: "Are you sure?",
                    text: "คุณจะแจ้งปัญหานี้",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes",
                    cancelButtonText: "No",
                    closeOnConfirm: true,
                    closeOnCancel: false
                },
                function(isConfirm){
                    if (isConfirm) {
                        swal("Report!", "คุณได้แจ้งปัญหาเรียบร้อบแล้ว", "success");
                    }
                });
            }
        </script>
    </body>
</html>
