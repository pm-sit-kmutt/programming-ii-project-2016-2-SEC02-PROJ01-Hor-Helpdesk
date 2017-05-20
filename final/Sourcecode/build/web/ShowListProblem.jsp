<%-- 
    Document   : ShowListProblem
    Created on : Mar 22, 2017, 9:27:21 PM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Problem"%>
<%@page import="Model.ListProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show List Problem</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        ListProblem listP = (ListProblem)request.getAttribute("message"); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>List Problem</h1>
                </div>
            </div>
            <div class="row">
                <table class="table table-hover table-condensed table-responsive">
                    <% int count = 1; %>
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th>problem name</th>
                            <% if(userStatus.equals("admin")) { %>
                                <th class="text-center">room</th>
                            <% } %>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(int i = 0; i < listP.getList().size(); i++) {
                            if(listP.getList().get(i).getStatusId() != 3) { %>
                                <tr>
                                    <td class="text-center"><%= count++ %></td>
                                    <td><%= listP.getList().get(i).getName() %></td>
                                    <% if(userStatus.equals("admin")) { %>
                                        <td class="text-center"><%= listP.getList().get(i).getRoom() %></td>
                                    <% } %>
                                </tr>
                            <% }
                        } %>
                    </tbody>
                </table>
            </div>
            <%@include file="BackButton.jsp" %>
        </div>
    </body>
</html>
