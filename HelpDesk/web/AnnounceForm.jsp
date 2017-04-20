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
            textArea{
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
            Title : <br>
            <textarea></textarea>
            Description : <br>
            <textarea></textarea><br>
            <script>
                var today = new Date();
                var dd = today.getDate();
                var mm = today.getMonth() + 1; //January is 0!
                var yyyy = today.getFullYear();

                if (dd < 10) {
                    dd = '0' + dd ;
                }

                if (mm < 10) {
                    mm = '0' + mm ;
                }

                today = mm + '/' + dd + '/' + yyyy;
                document.write(today);
            </script>
            <input id="submit" type="submit" value="Submit">    
        </div>
    </body>
</html>
