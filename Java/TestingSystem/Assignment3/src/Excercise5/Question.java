package Excercise5;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

public class Question {
    public static void main(String[] args) {

        // Nhap thong tin phong ban
        PhongBan phongBan1 = new PhongBan();
        phongBan1.setTenPhongBan("Accounting");
        phongBan1.setDiaChi("Ha Noi");

        PhongBan phongBan2 = new PhongBan();
        phongBan2.setTenPhongBan("Boss of director");
        phongBan2.setDiaChi("Ho Chi Minh");

        PhongBan phongBan3 = new PhongBan();
        phongBan3.setTenPhongBan("Marketing");
        phongBan3.setDiaChi("Da Nang");

        PhongBan phongBan4 = new PhongBan();
        phongBan4.setTenPhongBan("Sale");
        phongBan4.setDiaChi("Hai Phong");

        PhongBan phongBan5 = new PhongBan();
        phongBan5.setTenPhongBan("Waiting room");
        phongBan5.setDiaChi("Quang Ninh");

        // Question 1:
//        System.out.println("Thong tin phong ban 1 la: " + phongBan1.toString());

        // Question 2:
        ArrayList<PhongBan> listPhongBan = new ArrayList<PhongBan>();
        listPhongBan.add(phongBan1);
        listPhongBan.add(phongBan2);
        listPhongBan.add(phongBan3);
        listPhongBan.add(phongBan4);
        listPhongBan.add(phongBan5);
//        for (PhongBan phongBan : listPhongBan) {
//            System.out.println(phongBan.toString());
//        }

        // Question 3:
//        System.out.println("Dia chi cua phong ban 1 la: " + phongBan1.getDiaChi());

        // Question 4:
//        if (phongBan1.getTenPhongBan().equals("Phong A")) {
//            System.out.println("Phong ban 1 ten la Phong A");
//        } else {
//            System.out.println("Phong ban 1 khong ten la Phong A");
//        }

        // Question 5:
//        if (phongBan1.getTenPhongBan().equals(phongBan2.getTenPhongBan())) {
//            System.out.println("Phong ban 1 bang voi phong ban 2");
//        } else {
//            System.out.println("Phong ban 1 khong bang voi phong ban 2");
//        }

        // Quesiton 6:
//        String[] departments = {phongBan1.getTenPhongBan(), phongBan2.getTenPhongBan(), phongBan3.getTenPhongBan(), phongBan4.getTenPhongBan(), phongBan5.getTenPhongBan()};
//        Arrays.sort(departments);
//        for (String a: departments) {
//            System.out.print(a + "\t");
//        }
//        System.out.println(phongBan1.getTenPhongBan().substring(phongBan1.getTenPhongBan().lastIndexOf(" ")+1));
        // Question 7:
        String[] departments = {phongBan1.getTenPhongBan().substring(phongBan1.getTenPhongBan().lastIndexOf(" ")+1),
                phongBan2.getTenPhongBan().substring(phongBan2.getTenPhongBan().lastIndexOf(" ")+1),
                phongBan3.getTenPhongBan().substring(phongBan3.getTenPhongBan().lastIndexOf(" ")+1),
                phongBan4.getTenPhongBan().substring(phongBan4.getTenPhongBan().lastIndexOf(" ")+1),
                phongBan5.getTenPhongBan().substring(phongBan5.getTenPhongBan().lastIndexOf(" ")+1)};
        Arrays.sort(departments);
        for (String a: departments) {
            System.out.print(a + "\t");
        }
    }
}