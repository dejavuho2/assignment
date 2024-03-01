<%-- 
    Document   : listStudent
    Created on : Jan 31, 2024, 2:59:01 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            List<Student> list = (List<Student>) request.getAttribute("list");
            if (list != null && list.size() != 0) {
        %>
        <table border="1">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Gender</th>
                <th>DOB</th>
                <th></th>
            </tr>
            <%
                for (Student s : list) {
            %>           
            <tr>
                <td><%=s.getId()%></td>
                <td><%=s.getName()%></td>
                <td><%=s.getGender()%></td>
                <td><%=s.getDob()%></td>
                <td><a href="update?id=<%= s.getId()%>&name=<%= s.getName()%>&gender=<%= s.getGender()%>&dob=<%= s.getDob()%>">Update</a> <a href="delete?id=<%= s.getId()%>">Delete</a></td>
            </tr>

            <%
                }
            %>
        </table>
        <%
            }
        %>
        <a href="addstudent">Create</a>
    </body>
</html>
