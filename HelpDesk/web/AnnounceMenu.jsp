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
        <style>
            table, th, td {
                 border: 1px solid black;
                 border-collapse: collapse;
            }  
        </style>
    </head>
    <body>      
        <button type="button"> >>Add<< </button>
        <hr>
        <% ListAnnounce an = (ListAnnounce)request.getAttribute("message"); %>
        <table style="width: 100%">
            <tr>
                <th>News Announce</th>
            </tr>
            <%  for(int i = (an.getList().size()-1) ; i >= 0 ; i--){ %>
                <tr>
                    <td><%= an.getList().get(i).getAnnounceTitle() %></td>                    
                </tr>                    
            <% } %>
         </table>
    </body>
</html>
