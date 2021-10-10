package Excercise4;

import java.util.Scanner;

public class Question11 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao mot chuoi: ");
        String chuoi = scan.nextLine();
        int count = 0;
        for (int i = 0; i < chuoi.length(); i++) {
            if (Character.toString(chuoi.charAt(i)).equals("a")) {
                count++;
            }
        }
        System.out.println("So lan xuat hien ky tu a trong chuoi la: " + count);
    }
}