<%-- 
    Document   : ChnageStatus1
    Created on : Apr 6, 2017, 5:14:02 PM
    Author     : Poppular
--%>

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
        <% ListProblem listS = (ListProblem)request.getAttribute("message"); %>
        <table>
            <tr>
                <th>no.</th>
                <th>problem name</th>
                <th>room</th>
                <th>status</th>
                <th></th>
            </tr>
            <% for(int i = 0; i < listS.getList().size(); i++){ %>
                <tr>
                    <td><%= (i+1) %></td>
                    <td><%= listS.getList().get(i).getName() %></td>
                    <td><%= listS.getList().get(i).getRoom() %></td>
                    <td><%= listS.getList().get(i).getStatus() %></td>
                    <td> <button type="button">Update</button></td>
                </tr>                    
            <% } %>
         </table>
    </body>
</html>
