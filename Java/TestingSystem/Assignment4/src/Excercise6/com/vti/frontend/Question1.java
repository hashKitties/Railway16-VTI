package Excercise6.com.vti.frontend;

import Excercise6.com.vti.entity.VietnamesePhone;

import java.util.ArrayList;

public class Question1 {
    public static void main(String[] args) {
        VietnamesePhone vnPhone = new VietnamesePhone();
        vnPhone.insertContact("Nguyen","123");
        vnPhone.removeContact("Van");
        vnPhone.updateContact("Nguyen","456");
        vnPhone.searchContact("Nguyen");
    }
}