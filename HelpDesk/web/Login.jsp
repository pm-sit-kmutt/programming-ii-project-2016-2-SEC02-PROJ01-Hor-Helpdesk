<%-- 
    Document   : Login
    Created on : Mar 29, 2017, 10:17:33 PM
    Author     : User
--%>

<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="assets/js/jquery-3.2.0.min.js"></script>
        <script>
            $( document ).ready(function() {
                <%User userId = (User) session.getAttribute("userId");
                if(userId.getUserId() == -1){%>
                    alert("No");
                <%}%>
            });
        </script>
    </head>
    <body>
        <form method="post" action="/LoginServlet">
            E-mail: <input type="text" name="email" id="email" required>
            <br>
            Password: <input type="password" name="password" id="password" required>
            <br>
            <input type="submit" value="Submit">
        </form>
    </body>
</html>
