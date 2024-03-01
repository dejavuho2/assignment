<%-- 
    Document   : Confirm
    Created on : Jan 31, 2024, 12:39:32 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sv" class="Model.Student" scope="session" />
<jsp:setProperty name="sv" property="name"/>
<jsp:setProperty name="sv" property="gender"/>
<jsp:setProperty name="sv" property="dob"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Add Student </h1>
       
        <form action="addstudent" method="post">
            <li>Student Name: ${sv.name}
            <li>Student Gender: ${sv.gender}
            <li>Student DOB: ${sv.dob}
                <hr>    
                <input type="submit" value="Confirm"  />
                <input type="submit" value="Back" name="back" />
        </form>

    </body>
</html>
