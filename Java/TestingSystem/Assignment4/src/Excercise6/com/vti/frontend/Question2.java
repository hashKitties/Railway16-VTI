package Excercise6.com.vti.frontend;

import Excercise6.com.vti.entity.Employee;
import Excercise6.com.vti.entity.User;

public class Question2 {
    public static void main(String[] args) {
        User u1 = new Employee();
        u1.setName("Nguyen");
        u1.setSalaryRatio(10);
        System.out.println(u1.calculatePay());
    }

}