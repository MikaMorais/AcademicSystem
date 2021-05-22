package br.academicsys.model;

public class Student {
    private int idStudent;
    private int ra;
    private String studentName;
    private Course course;

    
    public Student() {
    }

    public Student(int idStudent, int ra, String studentName, Course course) {
        this.idStudent = idStudent;
        this.ra = ra;
        this.studentName = studentName;
        this.course = course;
    }
    
    
    public int getIdStudent() {
        return idStudent;
    }

    public void setIdStudent(int idStudent) {
        this.idStudent = idStudent;
    }

    public int getRa() {
        return ra;
    }

    public void setRa(int ra) {
        this.ra = ra;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    
}
