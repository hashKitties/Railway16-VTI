package Excercise6.com.vti.entity;

public class Waiter extends User{
    @Override
    public double calculatePay() {
        return getSalaryRatio()*220;
    }
}