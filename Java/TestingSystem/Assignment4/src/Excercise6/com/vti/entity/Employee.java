package Excercise6.com.vti.entity;

public class Employee extends User {
    @Override
    public double calculatePay() {
        return getSalaryRatio()*420;
    }
}