<%@page import="br.academicsys.model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="br.academicsys.dao.StudentDAO"%>
<%@page import="br.academicsys.model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StudentDAO sDAO = new StudentDAO();
    ArrayList<Student> students = sDAO.getAllStudents();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AcademicSystem</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
        <div class="container mt-4">
            <table class="table justify-content-center">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">RA</th>
                        <th scope="col">Name</th>
                        <th scope="col">Course</th>
                        <th scope="col">Course Type</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Student s : students) { %>
                    <tr>
                        <td><%= s.getRa() %></td>
                        <td><%= s.getStudentName()%></td>
                        <td><%= s.getCourse().getCourseName()%></td>
                        <td><%= s.getCourse().getCourseType()%></td>
                        <td>Button Edit</td>
                        <td>Button Delete</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
