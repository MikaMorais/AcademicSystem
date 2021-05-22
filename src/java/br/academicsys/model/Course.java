package br.academicsys.model;

public class Course {
    private int idCourse;
    private String courseName;
    private String courseType;

    public Course() {
    }

    public Course(int idCourse, String courseName, String courseType) {
        this.idCourse = idCourse;
        this.courseName = courseName;
        this.courseType = courseType;
    }

    public int getIdCourse() {
        return idCourse;
    }

    public void setIdCourse(int idCourse) {
        this.idCourse = idCourse;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseType() {
        return courseType;
    }

    public void setCourseType(String courseType) {
        this.courseType = courseType;
    }

    
}
