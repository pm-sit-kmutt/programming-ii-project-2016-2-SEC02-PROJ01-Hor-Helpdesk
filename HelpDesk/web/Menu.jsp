<%-- 
    Document   : Menu
    Created on : Mar 27, 2017, 12:31:26 PM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <% /*User user = (User) session.getAttribute("userId");
        long userId = user.getUserId();
        String userStatus = user.getStatus(); */%>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img class="navbar-brand logo-padding" src="assets/img/logo.png" alt="logo">
                </div>
                <div class="navbar-left">
                    <p class="navbar-text navbar-left">Signed in as </p>
                </div>
                <div class="navbar-right">
                    <a href="#" target="_self">
                        <button type="button" class="btn btn-default navbar-btn" id="logout">Logout</button>
                    </a>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Menu</h1>
                </div>
            </div>
            <div class="row list-group menu-list">
                <a href="#" target="_self">
                    <div class="list-group-item col-md-12">
                        รายงานปัญหา
                        <img src="assets/img/arrow.png" alt="icon">
                    </div>
                </a>
                <a href="#" target="_self">
                    <div class="list-group-item col-md-12">
                        แสดงรายการแจ้งปัญหา
                        <img src="assets/img/arrow.png" alt="icon">
                    </div>
                </a>
                <a href="#" target="_self">
                    <div class="list-group-item col-md-12">
                        แสดงสถานะแจ้งปัญหา
                        <img src="assets/img/arrow.png" alt="icon">
                    </div>
                </a>
                <a href="#" target="_self">
                    <div class="list-group-item col-md-12">
                        เปลี่ยนแปลงสถานะปัญหา
                        <img src="assets/img/arrow.png" alt="icon">
                    </div>
                </a>
            </div>
        </div>
    </body>
</html>
