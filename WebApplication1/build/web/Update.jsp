<%-- 
    Document   : Update
    Created on : Jan 31, 2024, 3:59:56 PM
    Author     : ADMIN
--%>

<%@page import="Model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sv" class="Model.Student" scope="session" />
<jsp:setProperty name="sv" property="*" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Update Student</h1>
        <%
            if (request.getAttribute("student") != null) {
                Student s = (Student) request.getAttribute("student");
        %>  

        <form action="update" method="post">
            <div>
                <label>Id:</label>
                <input type="text" name="id" value="<%=s.getId()%>" readonly="" />
            </div>
            <div>
                <label>Name:</label>
                <input type="text" name="name" value="<%=s.getName()%>" />
            </div>
            <div>
                <label>Gender:</label>
                <select name="gender">
                    <% if (s.getGender().startsWith("M")) {
                    %>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                    <option value="L">Other</option>
                    <%
                        }
                    %>
                    <% if (s.getGender().startsWith("F")) {
                    %>
                    <option value="F">Female</option>
                    <option value="M">Male</option>
                    <option value="L">Other</option>
                    <%
                        }
                    %>
                    <% if (s.getGender().startsWith("L")) {
                    %>
                    <option value="L">Other</option>
                    <option value="M">Male</option>
                    <option value="F">Female</option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div>
                <label>Date of Birth:</label>
                <input type="text" name="dob" value="<%=s.getDob()%>" />
            </div>
            <div>
                <input type="submit" value="Update Student" />
            </div>
        </form>


        <%
            }
        %>
    </body>
</html>
