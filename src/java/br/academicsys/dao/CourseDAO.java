package br.academicsys.dao;

import br.academicsys.model.Course;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class CourseDAO {
    
    public Map<Course, Integer> getAllCoursesCountStudents() throws SQLException {
        Map<Course, Integer> report = new HashMap<Course, Integer>();
        
        return report;
    }
}
