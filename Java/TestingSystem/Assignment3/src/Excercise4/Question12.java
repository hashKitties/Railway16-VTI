package Excercise4;

import java.util.Scanner;

public class Question12 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao mot chuoi: ");
        String chuoi = scan.nextLine();
        String chuoiReverse = "";
        for (int i = chuoi.length() - 1; i >= 0; i--) {
            chuoiReverse = chuoiReverse + chuoi.charAt(i);
        }
        System.out.println("Chuoi dao nguoc la: " + chuoiReverse);
    }

}