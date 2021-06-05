<%@page import="br.academicsys.model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="br.academicsys.dao.StudentDAO"%>
<%@page import="br.academicsys.model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    StudentDAO sDAO = new StudentDAO();
    ArrayList<Student> students;
    boolean panelFilter = false;
    
    if(request.getParameter("idCurso") != null) {
     int idCurso = Integer.parseInt(request.getParameter("idCurso"));
     students = sDAO.getAllStudents(idCurso);
     panelFilter=true;
    } else {
        students = sDAO.getAllStudents();
    }
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AcademicSystem</title>
    </head>
    <body>
        <jsp:include page="../menu.jsp"></jsp:include>
        <script src="../js/modalExclusion.js"></script>
        
        <% if(panelFilter && students.size() > 0) { %>
        <div class="card mt-4" style="width: 90%; margin: 0 auto 0;">
            <div class="card-header bg-dark">
                <p class="text-white">Filter applied</p>
            </div>
            <div class="card-body">
                <h6>Showing only students from the course: <strong><%= students.get(0).getCourse().getCourseName() %></strong></h6>
                <a href="students.jsp" class="btn btn-primary">Clean filter</a>
            </div>
        </div>
        <% } %>
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
                        <td><a id="deleteStudent"  class="btn btn-danger" href="../StudentController?typeAction=delete">Delete</a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </body>
</html>
