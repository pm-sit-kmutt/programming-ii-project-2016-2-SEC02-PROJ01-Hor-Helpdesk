<%-- 
    Document   : ChnageStatus1
    Created on : Apr 6, 2017, 5:14:02 PM
    Author     : Poppular
--%>

<%@page import="Model.Announce"%>
<%@page import="Model.User"%>
<%@page import="Model.ListAnnounce"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Problem"%>
<%@page import="Model.ListProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <title>Announce Menu</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus();
        String userName = user.getName();
        ListAnnounce listA = (ListAnnounce)request.getAttribute("listAnnounce");
        ArrayList<Announce> list = listA.getList(); %>
        <%@include file="Navbar.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-left">
                    <h1>Announce Menu</h1>
                </div>
                <% if(userStatus.equals("admin")) { %>
                    <div class="col-md-6 text-right">
                        <a href="/HelpDesk/AnnounceForm" target="_self">
                            <button type="button" class="btn btn-lg btn-login add">เพิ่มประกาศ</button>
                        </a>
                    </div>
                <% } %>
            </div>
            <form method="post" action="/HelpDesk/Announce">
                <div class="row list-group menu-list">
                    <%  for(int i = 0; i < list.size(); i++){ %>
                        <button type="submit" class="list-group-item col-md-12" name="id" value='<%= list.get(i).getAnnounceId() %>'>
                            <%= list.get(i).getAnnounceTitle() %>
                            <img src="assets/img/arrow.png" alt="icon">
                        </button>
                    <% } %>
                </div>
            </form>
            <%@include file="BackButton.jsp" %>
        </div>
    </body>
</html>
