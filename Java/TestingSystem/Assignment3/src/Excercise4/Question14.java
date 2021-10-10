package Excercise4;

import java.util.Scanner;

public class Question14 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao chuoi: ");
        String chuoi = scan.nextLine();
        System.out.println("Nhap vao ky tu muon thay the: ");
        String a = scan.nextLine();
        System.out.println("Nhap vao ky tu thay the: ");
        String b = scan.nextLine();
        chuoi = chuoi.replace(a,b);
        System.out.println("Chuoi da thay la: " + chuoi);
    }
}