package Excercise4;

import java.util.Scanner;

public class Question4 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao ten: ");
        String name = scan.nextLine();
        int j = 0;
        for (int i = 0; i < name.length(); i++) {
            j++;
            System.out.println("Ky tu thu " + j + " la: " + Character.toUpperCase(name.charAt(i)));
        }
    }
}