<%-- 
    Document   : ChnageStatus1
    Created on : Apr 6, 2017, 5:14:02 PM
    Author     : Poppular
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
        <title>Update Status</title>
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
            <form method="post" action="/HelpDesk/UpdateStatus1">
                <div class="row">
                    <div class="col-md-12">
                        <h1>Update Status</h1>
                    </div>
                </div>
                <div class="row">
                    <table class="table table-hover table-condensed table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>problem name</th>
                                <th class="text-center">room</th>
                                <th class="text-center">status</th>
                                <th></th>
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
                                        <% if(listS.getList().get(i).getStatusId() == 1) { %>
                                            <p class="btn btn-danger status"><%= listS.getList().get(i).getStatus() %></p>
                                        <% }
                                        else if(listS.getList().get(i).getStatusId() == 2) {%>
                                            <p class="btn btn-warning status"><%= listS.getList().get(i).getStatus() %></p>
                                        <% } else { %>
                                            <p class="btn btn-success status"><%= listS.getList().get(i).getStatus() %></p>
                                        <% } %>
                                    </td>
                                    <td><button type="submit" name="causeId" value='<%= listS.getList().get(i).getCauseId() %>' class="btn btn-primary">Update</button></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <%@include file="BackButton.jsp" %>
            </form>
        </div>
    </body>
</html>
