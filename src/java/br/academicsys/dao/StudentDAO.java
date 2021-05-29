package br.academicsys.dao;

import br.academicsys.model.Course;
import br.academicsys.model.Student;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentDAO {

    private static Statement stm = null;

    public ArrayList<Student> getAllStudents(Integer... idCurso) throws SQLException {
        ArrayList<Student> students = new ArrayList<>();
        String query = "SELECT"
                + "    \"tb_aluno\".\"idAluno\", "
                + "    \"tb_aluno\".\"ra\", "
                + "    \"tb_aluno\".\"nome\", "
                + "    \"tb_curso\".\"idCurso\", "
                + "    \"tb_curso\".\"nome_curso\", "
                + "    \"tb_curso\".\"tipo_curso\" "
                + "FROM \"tb_aluno\" "
                + "INNER JOIN \"tb_curso\" ON \"tb_aluno\".\"idCurso\" = \"tb_curso\".\"idCurso\"";
        
        if (idCurso.length != 0) {
            query += "WHERE \"tb_curso\".\"idCurso\" = " + idCurso[0];
        }
        
        query += " ORDER BY \"nome\"";
        
        stm = ConnectionFactory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet rs = stm.executeQuery(query);
        
        while(rs.next()){
            Student s = new Student();
            Course c = new Course();
            
            s.setIdStudent(rs.getInt("idAluno"));
            s.setStudentName(rs.getString("nome"));
            s.setRa(rs.getInt("ra"));
            
            c.setIdCourse(rs.getInt("idCurso"));
            c.setCourseName(rs.getString("nome_curso"));
            c.setCourseType(rs.getString("tipo_curso"));
            
            s.setCourse(c);
            students.add(s);
        }
       
        stm.getConnection().close();
        
        return students;
    }
}
