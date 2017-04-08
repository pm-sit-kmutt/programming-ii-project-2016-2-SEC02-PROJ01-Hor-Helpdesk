<%-- 
    Document   : Announce
    Created on : Apr 8, 2017, 12:51:12 PM
    Author     : l3as
--%>

<%@page import="Model.Announce"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Announce An = (Announce)request.getAttribute("message");  %>
        <table border="2" width="100%">
        <tr>

            <th>Title</th>
            <th>Des</th> 
        </tr>   
        <tr>
                <td><%= An.getAnnounceTitle() %></td>
                <td><%= An.getAnnounceDes() %></td>
        </tr>                                       
        </table>
    </body>
</html>
