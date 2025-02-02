<%-- 
    Document   : UpdateStatus2
    Created on : Apr 6, 2017, 5:27:40 PM
    Author     : Poppular
--%>

<%@page import="Model.User"%>
<%@page import="Model.Problem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Status</title>
        <script src="assets/js/jquery-3.2.0.min.js"></script>
        <script src="assets/js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/sweetalert.css">
        <script>
            function confirmUpdate() {
                var statusId = $('#statusId').val();
                swal({
                    title: "Are you sure?",
                    text: "คุณจะเปลี่ยนสถานะนี้แน่ใจหรือไม่",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes",
                    cancelButtonText: "No",
                    closeOnConfirm: false
                },
                function(){
                    swal("UPDATE!", "เปลี่ยนสถานะเสร็จสิ้น", "success");
                    $('#form').submit();
                });
            }
        </script>
    </head>
    <body>      
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        Problem p = (Problem)request.getAttribute("message"); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Update Status</h1>
                </div>
            </div>
            <div clas="row">
                <div class="col-md-4 col-md-offset-4">
                    <h2>Room : <%= p.getRoom() %></h2>
                </div>
            </div>
            <div class="row marginUpdate">
                <div class="col-md-4 col-md-offset-4">
                    Problem Name : <%= p.getName() %>
                </div>
            </div>
            <div class="row marginUpdate">
                <div class="col-md-4 col-md-offset-4">
                    Status : <%= p.getStatus() %>
                </div>
            </div>
            <div class="row marginUpdate">
                <div class="col-md-4 col-md-offset-4">
                    Update Status : 
                    <form method="post" action="/HelpDesk/UpdateStatus2" id="form">
                        <select name="statusId" id="statusId">
                            <% for (int i = 0; i < p.getStatusName().size(); i++) { %>
                                <option value='<%= (i+1) %>'><%= p.getStatusName().get(i) %></option>
                            <% } %>
                        </select>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-4 text-center">
                    <button type="button" class="btn btn-login" onclick="confirmUpdate()">Update</button>
                    <a href="/HelpDesk/UpdateStatus1" target="_self">
                        <button class="btn btn-login" id="back">Back</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
