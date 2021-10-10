package Excercise4;

import java.util.Scanner;

public class Question13 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao mot chuoi: ");
        String chuoi = scan.nextLine();
        boolean flag = true;
        for (int i = 0; i < chuoi.length(); i++) {
            if (Character.isDigit(chuoi.charAt(i))) {
                flag = false;
                break;
            }
        }
        System.out.println(flag);
    }
}