package Excercise4;

import java.util.Scanner;

public class Question16 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao mot chuoi: ");
        String chuoi = scan.nextLine();
        System.out.println("Nhap vao mot so: ");
        int n = Integer.parseInt(scan.nextLine());
        String chuoiSub = "";
        int count = 0;
        if (chuoi.length() % n == 0) {
            for (int i = 0; i < chuoi.length(); i++) {
                chuoiSub = chuoiSub + chuoi.charAt(i);
                count++;
                if (count == n) {
                    System.out.print(chuoiSub + "\t");
                    chuoiSub = "";
                    count = 0;
                }
            }
        } else
            System.out.println("KO");
    }
}