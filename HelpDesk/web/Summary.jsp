<%-- 
    Document   : summary
    Created on : Apr 20, 2017, 10:35:47 AM
    Author     : User
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.Summary"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Summary</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        Summary summary = (Summary)request.getAttribute("message");
        ArrayList<Integer>[] roomCurrentMax = summary.getRoomMaxCurrent(); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>List Status</h1>
                </div>
            </div>
            <div class="row">
                <ul>
                    <li>จำนวนปัญหาที่เกิดขึ้นภายในปีนี้</li>
                    <table class="table table-hover table-condensed table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>problem name</th>
                                <th class="text-center">count</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i = 0; i < summary.getProblemName().size(); i++) { %>
                                <tr>
                                    <td class="text-center"><%= (i+1) %></td>
                                    <td><%= summary.getProblemName().get(i) %></td>
                                    <td class="text-center"><%= summary.getCurrent()[i] %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <li>ห้องที่เกิดปัญหามากที่สุดของในปีนี้และจำนวนครั้ง</li>
                    <table class="table table-hover table-condensed table-responsive">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>problem name</th>
                                <th class="text-center">room</th>
                                <th class="text-center">count</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(int i = 0; i < summary.getProblemName().size(); i++) { %>
                                <tr>
                                    <td class="text-center"><%= (i+1) %></td>
                                    <td><%= summary.getProblemName().get(i) %></td>
                                    <td class="text-center">
                                        <% if( roomCurrentMax[i].get(0) != 0 ) { %>
                                            <% for (int j = 0; j < roomCurrentMax[i].size(); j++) { %>
                                                <p class="text-center"><%= roomCurrentMax[i].get(j) %></p>
                                            <% }
                                        } else { %>
                                            <p class="text-center">ไม่มี</p>
                                        <% } %>
                                    </td>
                                    <td class="text-center">
                                        <% if(summary.getMaxCurrent()[i] == 0) { %>
                                            <p class="text-center">-</p>
                                        <% } else { %>
                                            <%= summary.getMaxCurrent()[i] %>
                                        <% } %>
                                    </td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                </ul>
            </div>
            <%@include file="BackButton.jsp" %>
        </div>
    </body>
</html>
