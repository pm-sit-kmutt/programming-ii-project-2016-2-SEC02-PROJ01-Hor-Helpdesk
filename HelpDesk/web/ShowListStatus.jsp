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
        <%@include file="Navbar.jsp" %>
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
                    <tbody>
                        <% for(int i = 0; i < listS.getList().size(); i++) { %>
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
                        <% } %>
                    </tbody>
                </table>
            </div>
            <%@include file="BackButton.jsp" %>
        </div>
    </body>
</html>
