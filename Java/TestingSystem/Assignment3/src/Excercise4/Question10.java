package Excercise4;

import java.util.Scanner;

public class Question10 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao chuoi thu nhat: ");
        String chuoi1 = scan.nextLine();
        System.out.println("Nhap vao chuoi thu hai: ");
        String chuoi2 = scan.nextLine();
        boolean flag = true;
        int i = 0;
        int j = chuoi2.length() - 1;
        do {
            if (chuoi1.length() != chuoi2.length()) {
                flag = false;
                break;
            } else if (chuoi1.substring(i, i + 1).equals(chuoi2.substring(j, j + 1))) {
                i++;
                j--;
                continue;
            } else {
                flag = false;
                break;
            }
        } while (i < chuoi1.length());
        if (flag) {
            System.out.println(chuoi2 + " la nghich dao cua " + chuoi1);
        } else {
            System.out.println(chuoi2 + " khong la nghich dao cua " + chuoi1);
        }
    }

}