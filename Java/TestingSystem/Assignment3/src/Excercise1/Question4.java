package Excercise1;

import java.awt.*;
import java.util.Scanner;

public class Question4 {
    public static void tinhThuong (int a, int b) {
        System.out.println("Thuong cua " + a + " va " + b + " la: " + a*1.0f/b);
    }
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao so a: ");
        int a = Integer.parseInt(scan.nextLine());
        System.out.println("Nhap vao so b: ");
        int b = Integer.parseInt(scan.nextLine());
        tinhThuong(a,b);
    }
}