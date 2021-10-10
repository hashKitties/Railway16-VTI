package Excercise4;

import java.util.Scanner;

public class Question7 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao ho va ten: ");
        String hoTen = scan.nextLine();
        hoTen = hoTen.trim();
        hoTen = hoTen.toLowerCase();
        String[] a = hoTen.split("\s++");
        String tenChuanHoa = "";
        for (int i = 0; i < a.length; i++) {
            tenChuanHoa = tenChuanHoa + Character.toUpperCase(a[i].charAt(0)) + a[i].substring(1) + " ";
        }
        tenChuanHoa = tenChuanHoa.trim();
        System.out.println("Ten chuan hoa la: " + tenChuanHoa);
    }
}