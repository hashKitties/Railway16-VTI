package Excercise4;

import java.util.Scanner;

public class Question15 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao chuoi: ");
        String chuoi = scan.nextLine();
        chuoi = chuoi.trim();
        String[] a = chuoi.split("\s+");
        String chuoiReverse = "";
        for (int i = a.length - 1; i >= 0; i--) {
            chuoiReverse = chuoiReverse + a[i] + " ";
        }
        chuoiReverse = chuoiReverse.trim();
        System.out.println("Chuoi dao nguoc la: " + chuoiReverse);
    }
}