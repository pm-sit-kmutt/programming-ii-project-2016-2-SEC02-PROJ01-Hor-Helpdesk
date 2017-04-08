<%-- 
    Document   : ChnageStatus1
    Created on : Apr 6, 2017, 5:14:02 PM
    Author     : Poppular
--%>

<%@page import="Model.ListAnnounce"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Problem"%>
<%@page import="Model.ListProblem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
    </head>
    <body>      
        <% ListAnnounce an = (ListAnnounce)request.getAttribute("message"); %>
        <table>
            <tr>
                <th>no</th>
                <th>News Announce</th>
            </tr>
            <% for(int i = 0; i < an.getList().size(); i++){ %>
                <tr>
                    <td><%= (i+1) %></td>
                    <td><%= an.getList().get(i).getAnnounceTitle() %></td>                    
                </tr>                    
            <% } %>
         </table>
    </body>
</html>
