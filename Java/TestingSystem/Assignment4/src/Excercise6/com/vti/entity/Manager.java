package Excercise6.com.vti.entity;

public class Manager extends User{
    @Override
    public double calculatePay() {
        return getSalaryRatio()*520;
    }



}