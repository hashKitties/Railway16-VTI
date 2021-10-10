package Excercise4;

import java.util.Scanner;

public class Question3 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao ten: ");
        String name = scan.nextLine();
        if (Character.isUpperCase(name.charAt(0))) {
            System.out.println(name);
        } else {
            name = Character.toUpperCase(name.charAt(0)) + name.substring(1);
            System.out.println(name);
        }
    }
}