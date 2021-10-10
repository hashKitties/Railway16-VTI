package Excercise4;

import java.util.Scanner;

public class Question2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao xau thu nhat: ");
        String s1 = scan.nextLine();
        System.out.println("Nhap vao xau thu hai: ");
        String s2 = scan.nextLine();
        String s = s1 + s2;
        System.out.println("Xau sau khi noi la: " + s);
    }
}