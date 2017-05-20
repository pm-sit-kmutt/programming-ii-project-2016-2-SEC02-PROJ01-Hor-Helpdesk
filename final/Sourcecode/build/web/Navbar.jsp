<%-- 
    Document   : nav
    Created on : Apr 6, 2017, 9:17:42 AM
    Author     : User
--%>

<nav class="navbar navbar-default no-margin-buttom">
    <div class="container-fluid">
        <div class="navbar-header">
            <img class="navbar-brand logo-padding" src="assets/img/logo.png" alt="logo">
        </div>
        <div class="navbar-left">
            <p class="navbar-text navbar-left"><%= userName.toUpperCase() %> sign in as <%= userStatus.toUpperCase() %></p>
        </div>
        <div class="navbar-right">
            <a href="/HelpDesk/Help" target="_blank">
                <button type="button" class="btn btn-default navbar-btn" id="help">
                    <i class="fa fa-question-circle"></i>
                    Help
                </button>
            </a>
            <a href="/HelpDesk/Logout" target="_self">
                <button type="button" class="btn btn-default navbar-btn" id="logout">Logout</button>
            </a>
        </div>
    </div>
</nav>