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
        <script src="assets/js/jquery-3.2.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <script>
            $(document).ready(function () {
                var d = new Date();
                var current = d.getFullYear() + 543;
                var past = current - 1;
                $('.current').append("ปี " + current);
                $('.past').append("ปี " + past);
            });
        </script>
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        Summary summary = (Summary)request.getAttribute("summary");
        int[] past = summary.getPast();
        int[] maxPast = summary.getMaxPast();
        ArrayList<Integer>[] roomPastMax = summary.getRoomMaxPast();
        int[] current = summary.getCurrent();
        int[] maxCurrent = summary.getMaxCurrent();
        ArrayList<Integer>[] roomCurrentMax = summary.getRoomMaxCurrent();
        String search = (String)request.getAttribute("search"); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>List Status</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-right">
                    <form method="post" action="/HelpDesk/Summary">
                        ค้นหา : 
                        <select name="search">
                            <option value="current" class="current"></option>
                            <option value="past" class="past"></option>
                        </select>
                        <button type="submit" class="btn btn-login">ค้นหา</button>
                    </form>
                </div>
            </div>
            <div class="row">
                <ul>
                    <li>จำนวนปัญหาที่เกิดขึ้นภายใน<% if(search.equals("current")) { %><span class="current"></span><% } else { %><span class="past"></span><% } %></li>
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
                                    <td class="text-center"><% if(search.equals("current")) { %><%= current[i] %><% } else { %><%= past[i] %><% } %></td>
                                </tr>
                            <% } %>
                        </tbody>
                    </table>
                    <li>ห้องที่เกิดปัญหามากที่สุดและจำนวนครั้งของ<% if(search.equals("current")) { %><span class="current"></span><% } else { %><span class="past"></span><% } %></li>
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
                                        <% if(search.equals("current")) {
                                            if( roomCurrentMax[i].get(0) != 0 ) { %>
                                                <% for (int j = 0; j < roomCurrentMax[i].size(); j++) { %>
                                                    <p class="text-center"><%= roomCurrentMax[i].get(j) %></p>
                                                <% }
                                            } else { %>
                                                <p class="text-center">ไม่มี</p>
                                            <% }
                                        }
                                        else {
                                            if( roomPastMax[i].get(0) != 0 ) { %>
                                                <% for (int j = 0; j < roomPastMax[i].size(); j++) { %>
                                                    <p class="text-center"><%= roomPastMax[i].get(j) %></p>
                                                <% }
                                            } else { %>
                                                <p class="text-center">ไม่มี</p>
                                            <% }
                                        } %>
                                    </td>
                                    <td class="text-center">
                                        <% if(search.equals("current")) {
                                            if(maxCurrent[i] == 0) { %>
                                                <p class="text-center">-</p>
                                            <% } else { %>
                                                <%= maxCurrent[i] %>
                                            <% }
                                        }
                                        else { 
                                            if(maxPast[i] == 0) { %>
                                                <p class="text-center">-</p>
                                            <% } else { %>
                                                <%= maxPast[i] %>
                                            <% }
                                        } %>
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
