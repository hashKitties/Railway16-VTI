package Excercise5.com.vti.entity;

public class HighSchoolStudent extends Student {
    private String clazz;
    private String desiredUniversity;


    public String showInfo() {
        return "HighSchoolStudent{" +
                "id='" + super.getId() + '\'' +
                ", Name='" + super.getName() + '\'' +
                ", clazz='" + clazz + '\'' +
                ", desiredUniversity='" + desiredUniversity + '\'' +
                '}';
    }

    public HighSchoolStudent(){

    }
    public HighSchoolStudent(String name, int id, String clazz, String desiredUniversity) {
        super.setName(name);
        super.setId(id);
        this.clazz = clazz;
        this.desiredUniversity = desiredUniversity;
    }
}