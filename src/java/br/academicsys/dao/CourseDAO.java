package br.academicsys.dao;

import br.academicsys.model.Course;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class CourseDAO {
    
    private static Statement stm = null;
    
    public Map<Course, Integer> getAllCoursesCountStudents() throws SQLException {
        Map<Course, Integer> report = new HashMap<Course, Integer>();
        String query = "SELECT "
                +"      curso.\"idCurso\", "
                +"      curso.\"nome_curso\", "  
                +"      curso.\"tipo_curso\", "
                +"       (SELECT count(*)    "
                +"          FROM   \"tb_aluno\" "
                +"          WHERE curso.\"idCurso\" = \"idCurso\") as \"qtdAlunos\" " 
                +"          FROM \"tb_curso\" as curso";
        
        stm = ConnectionFactory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        
        ResultSet rs = stm.executeQuery(query);
        
        while(rs.next()) {
            Course c = new Course();
            int qtdStudents;
            
            c.setIdCourse(rs.getInt("idCurso"));
            c.setCourseName(rs.getString("nome_curso"));
            c.setCourseType(rs.getString("tipo_curso"));
            qtdStudents = rs.getInt("qtdAlunos");
            
            report.put(c, qtdStudents);
        }
        
        stm.getConnection().close();
        
        return report;
    }
}
