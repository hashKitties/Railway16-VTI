package Excercise4;

import java.util.Scanner;

public class Question5 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao ho: ");
        String ho = scan.nextLine();
        System.out.println("Nhap vao ten: ");
        String ten = scan.nextLine();
        System.out.println("Ho ten day du la " + ho + " " + ten);
    }
}