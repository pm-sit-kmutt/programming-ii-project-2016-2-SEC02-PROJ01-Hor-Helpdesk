<%-- 
    Document   : Announce
    Created on : Apr 8, 2017, 12:51:12 PM
    Author     : l3as
--%>

<%@page import="Model.User"%>
<%@page import="Model.Announce"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Announce</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
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
                    <h1>Announce</h1>
                </div>
            </div>
            <div clas="row">
                <div class="col-md-6 col-md-offset-2">
                    <h2>หัวข้อ : <%= an.getAnnounceTitle() %></h2>
                </div>
                <% if(userStatus.equals("admin")) { %>
                    <div class="col-md-2 text-right add">
                        <a href="/HelpDesk/AnnounceEdit">
                            <button type="button" class="btn btn-lg btn-login">แก้ไข</button>
                        </a>
                    </div>
                <% } %>
                <div class="col-md-8 col-md-offset-2">
                    <h3>คำอธิบาย :</h3>
                    <p class="descript"><%= an.getAnnounceDes() %></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <a href="/HelpDesk/ListAnnounce" target="_self">
                        <button class="btn btn-lg btn-login" id="back">Back</button>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
