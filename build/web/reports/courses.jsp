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
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>
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
                        <% if(c.getValue() == 0) { %>
                        <td>
                            <span class="d-inline-block" tabindex="0" data-toggle="tooltip" title="No students to display">
                                <button class=" btn btn-secondary" disabled style="pointer-events: none;" type="button">Show students</button>
                            </span>
                        </td>
                        <% } else {%>
                        <td><a href="./students.jsp?idCurso=<%= c.getKey().getIdCourse()%>" class="btn btn-success">Show students</a></td>
                        <% } %>
                        <td>Button Edit</td>
                        <td>Button Delete</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
