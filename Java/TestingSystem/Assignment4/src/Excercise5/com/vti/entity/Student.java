package Excercise5.com.vti.entity;

public abstract class Student extends Person {
    private int id;

    public Student() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Student(String name, int id) {
        super(name);
        this.id = id;
    }
}