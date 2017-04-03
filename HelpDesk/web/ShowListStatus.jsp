<%-- 
    Document   : ShowListStatus
    Created on : Mar 25, 2017, 11:04:45 AM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page import="Model.ListProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Status</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        ListProblem listS = (ListProblem)request.getAttribute("message"); %>
        <nav class="navbar navbar-default no-margin-buttom">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img class="navbar-brand logo-padding" src="assets/img/logo.png" alt="logo">
                </div>
                <div class="navbar-left">
                    <p class="navbar-text navbar-left"><%= userName.toUpperCase() %> sign in as <%= userStatus.toUpperCase() %></p>
                </div>
                <div class="navbar-right">
                    <a href="/Help" target="_blank">
                        <button type="button" class="btn btn-default navbar-btn" id="help">
                            <i class="fa fa-question-circle"></i>
                            Help
                        </button>
                    </a>
                    <a href="/Logout" target="_self">
                        <button type="button" class="btn btn-default navbar-btn" id="logout">Logout</button>
                    </a>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>List Status</h1>
                </div>
            </div>
            <div class="row">
                <table class="table table-hover table-condensed table-responsive">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th>problem name</th>
                            <% if(userStatus.equals("admin")) { %>
                                <th class="text-center">room</th>
                            <% } %>
                            <th class="text-center">status</th>
                        </tr>
                    </thead>
                    <% for(int i = 0; i < listS.getList().size(); i++) { %>
                        <tbody>
                            <tr>
                                <td class="text-center"><%= (i+1) %></td>
                                <td><%= listS.getList().get(i).getName() %></td>
                                <% if(userStatus.equals("admin")) { %>
                                    <td class="text-center"><%= listS.getList().get(i).getRoom() %></td>
                                <% } %>
                                <td class="text-center">
                                    <% if(listS.getList().get(i).getStatus().equals("รอดำเนินการ")) { %>
                                        <p class="btn btn-danger status"><%= listS.getList().get(i).getStatus() %></p>
                                    <% }
                                    else if(listS.getList().get(i).getStatus().equals("กำลังดำเนินการ")) {%>
                                        <p class="btn btn-warning status"><%= listS.getList().get(i).getStatus() %></p>
                                    <% } else { %>
                                        <p class="btn btn-success status"><%= listS.getList().get(i).getStatus() %></p>
                                    <% } %>
                                </td>
                            </tr>
                        </tbody>
                    <% } %>
                </table>
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <a href="/Menu" target="_self">
                        <button class="btn btn-lg btn-login" id="back">กลับสู่เมนูหลัก</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
