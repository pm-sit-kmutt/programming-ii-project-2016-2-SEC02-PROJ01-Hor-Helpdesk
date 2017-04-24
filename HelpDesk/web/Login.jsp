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
        <script src="assets/js/alertify.min.js"></script>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/alertify.min.css">
        <script type="text/javascript">
            $(document).ready(function () {
                <% User user = (User) session.getAttribute("user");
                if (user.getUserId() == -1) { %>
                    alertify.alert("Login ERROR", "กรุณากรอก E-mail และ Password ให้ถูกต้อง");
                <% }%>
            });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row top-space">
                <div class="col-md-offset-4 col-md-4 text-center">
                    <img src="assets/img/logo.png" alt="logo">
                </div>
            </div>
            <div class="row">
                <form method="post" action="/HelpDesk/Login" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-md-1 control-label col-md-offset-4">E-mail :</label>
                        <div class="col-md-3 input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-user"></i>
                            </div>
                            <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label col-md-offset-3 text-right">Password :</label>
                        <div class="col-md-3 input-group">
                            <div class="input-group-addon">
                                <i class="fa fa-lock"></i>
                            </div>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-8 text-right">
                            <button type="submit" class="btn btn-login">Login</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
