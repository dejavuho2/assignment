<%-- 
    Document   : ConfirmDelete
    Created on : Feb 2, 2024, 9:17:07 PM
    Author     : ADMIN
--%>

<%@page import="Model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Deleted Student</h1>
        <%
            if (request.getAttribute("student") != null) {
                Student s = (Student) request.getAttribute("student");
        %>  

        <form action="delete" method="post">
            <div>
                <label>Id:</label>
                <input type="text" name="id" value="<%=s.getId()%>" readonly="" />
            </div>
            <div>
                <label>Name:</label>
                <input type="text" name="name" value="<%=s.getName()%>" readonly="" />
            </div>
            <div>
                <label>Gender:</label>
                <select name="gender">
                    <% if (s.getGender().startsWith("M")) {
                    %>
                    <option value="M">Male</option>
                    <%
                        }
                    %>
                    <% if (s.getGender().startsWith("F")) {
                    %>
                    <option value="F">Female</option>
                    <%
                        }
                    %>
                    <% if (s.getGender().startsWith("L")) {
                    %>
                    <option value="L">Other</option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div>
                <label>Date of Birth:</label>
                <input type="text" name="dob" value="<%=s.getDob()%>" readonly="" />
            </div>
            <div>
                <input type="submit" value="Deleted" />
                <input type="submit" value="Back" name="back" />
            </div>
        </form>


        <%
            }
        %>
    </body>
</html>
