<%-- 
    Document   : UpdateStatus2
    Created on : Apr 6, 2017, 5:27:40 PM
    Author     : Poppular
--%>

<%@page import="Model.Problem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>      
        <% Problem p = (Problem)request.getAttribute("message"); %>
        <table>
        <tr>

            <th>problem name</th>
            <th>room</th>
            <th>status</th>
        </tr>   
        <tr>
                <td><%= p.getName() %></td>
                <td><%= p.getRoom() %></td>
                <td><%= p.getStatus() %></td>    
        </tr>                                       
        </table>
        <div>
        <select>
             <option value="รอ">รอ</option>
             <option value="กำลังดำเนินการ">กำลังดำเนินการ</option>
             <option value="เสร็จสิ้น">เสร็จสิ้น</option>
        </select>
        </div>
        <div>
             <input type="submit" value="Submit">
        </div>
    </body>
</html>
