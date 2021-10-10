package Excercise4;

import javax.swing.text.Position;
import java.util.Scanner;

public class Question6 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao ho va ten day du: ");
        String hoTen = scan.nextLine();
        String[] a = hoTen.split(" ");
        System.out.println("Ho la: " + a[0]);
        String tenDem = "";
        for (int i = 1; i < a.length - 1; i++) {
            tenDem = tenDem + a[i] + " ";
        }
        tenDem = tenDem.trim();
        System.out.println("Ten dem la: " + tenDem);
        System.out.println("Ten la: " + a[a.length-1]);
    }
}