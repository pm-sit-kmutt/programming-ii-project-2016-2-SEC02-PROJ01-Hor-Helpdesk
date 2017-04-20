<%-- 
    Document   : AnnounceForm
    Created on : Apr 8, 2017, 1:35:34 PM
    Author     : Poppular
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Announce Form</title>
    <style>
        #submit {
            float: right;
            
        }
        input[type=text]{
             width: 100%;
             padding: 12px 20px;
             margin: 8px 0;
             display: inline-block;
             border: 1px solid #ccc;
             border-radius: 4px;
             box-sizing: border-box;
        }
    </style>
    </head>
    <body>
        <div>
        <label for="fname">Title :</label>
        <input type="text"  name="Title"> 
        <label for="lname">Description :</label>
        <input type="text"  name="Description">      
        <input id="submit" type="submit" value="Submit">    
        </div>
    </body>
</html>
