<%-- 
    Document   : AnnounceEdit
    Created on : Apr 30, 2017, 7:13:28 PM
    Author     : User
--%>

<%@page import="Model.Announce"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Announce</title>
        <script src="assets/js/jquery-3.2.0.min.js"></script>
        <script src="assets/js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/sweetalert.css">
        <script>
            function confirmUpdate() {
                var title = $('#title').val();
                swal({
                    title: "Are you sure?",
                    text: "คุณจะแก้ไขประกาศนี้แน่ใจหรือไม่<br><p>Title : " + title + "</p>",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "Yes",
                    cancelButtonText: "No",
                    closeOnConfirm: false,
                    html: true
                },
                function(){
                    swal("UPDATE!", "แก้ไขประกาศเสร็จสิ้น", "success");
                    $('#form').submit();
                });
            }
        </script>
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        Announce an = (Announce)request.getAttribute("announce"); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Edit Announce</h1>
                </div>
            </div>
            <div class="row">
                <form method="post" action="/HelpDesk/AnnounceEdit" id="form">
                    <div class="col-md-10 col-md-offset-1">
                        Title : <input type="text" class="form-control" name="title" id="title" maxlength="100" value="<%= an.getAnnounceTitle() %>">
                    </div>
                    <div class="col-md-10 col-md-offset-1">
                        Description :
                        <br>
                        <textarea rows="10" cols="100" name="description" class="form-control"><%= an.getAnnounceDes() %></textarea>
                    </div>
                </form>
            </div>
            <div class="row marginUpdate">
                <div class="col-md-4 col-md-offset-4 text-center">
                    <button type="button" class="btn btn-login" onclick="confirmUpdate()">EDIT</button>
                    <a href="/HelpDesk/Announce" target="_self">
                        <button class="btn btn-login" id="back">Back</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
