package Excercise4;
import java.util.Scanner;
public class Question1 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap vao chuoi: ");
        String text = scan.nextLine();
        int count = 0;
        for (int i = 0; i < text.length(); i++) {
            if (text.substring(i,i+1).equals(" ")) {
                continue;
            } else {
                count++;
            }
        }
        System.out.println("So ky tu trong chuoi la: " + count);
    }
}