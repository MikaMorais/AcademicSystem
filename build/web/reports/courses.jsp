<%@page import="java.util.Map"%>
<%@page import="br.academicsys.dao.CourseDAO"%>
<%@page import="br.academicsys.model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    CourseDAO cDAO = new CourseDAO();
    Map<Course, Integer> courses = cDAO.getAllCoursesCountStudents();
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
                        <th scope="col">Course</th>
                        <th scope="col">Course Type</th>
                        <th scope="col">Qtd. Students</th>
                        <th scope="col">Students List</th>
                        <th scope="col">Edit</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Map.Entry<Course, Integer> c : courses.entrySet()) { %>
                    <tr>
                        <td><%= c.getKey().getCourseName() %></td>
                        <td><%= c.getKey().getCourseType()%></td>
                        <td><%= c.getValue()%></td>
                        <td>Button Students List<</td>
                        <td>Button Edit</td>
                        <td>Button Delete</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
