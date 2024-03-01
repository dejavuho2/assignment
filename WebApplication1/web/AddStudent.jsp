<%-- 
    Document   : AddStudent
    Created on : Jan 31, 2024, 12:37:31 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <h1>Add Student!</h1>
        <form action="Confirm.jsp" method="post">
        <div>
            <label>Name:</label>
            <input type="text" name="name" />
        </div>
        <div>
            <label>Gender:</label>
            <select name="gender">
                <option value="M">Male</option>
                <option value="F">Female</option>
                <option value="L">Other</option>
            </select>
        </div>
        <div>
            <label>Date of Birth:</label>
            <input type="text" name="dob" />
        </div>
        <div>
            <input type="submit" value="Add Student" />
        </div>
    </form>

    </body>
</html>
