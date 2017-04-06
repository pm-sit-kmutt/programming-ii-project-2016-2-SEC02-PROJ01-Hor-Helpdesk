<%-- 
    Document   : Help
    Created on : Apr 1, 2017, 2:07:47 PM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
    </head>
    <body>
        <% User user = (User)session.getAttribute("user");
        String userStatus = user.getStatus(); %>
        <h1><%= userStatus %></h1>
    </body>
</html>
