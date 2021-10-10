package Excercise4.com.vti.backend;

import Excercise4.com.vti.entity.Student;

public class Question1 {
    public static void question1() {
        Student student = new Student();
        student.setName("Student");
        student.setDiemHocLuc(1);
        System.out.println(student.toString());
    }
}