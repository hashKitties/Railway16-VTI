package Excercise4;

import java.util.Random;

public class RandomNumber {
    public static void main(String[] args) {
        // Question 1:
        Random random = new Random();
        System.out.println("So nguyen ngau nhien la: " + random.nextInt());
        // Question 2:
        System.out.println("So thuc ngau nhien la: " + random.nextFloat());

        // Question 3
        String[] danhSach = {"A","B","C"};
        System.out.println("Ten ngau nhien trong danh sach la: " + danhSach[random.nextInt(3)]);

        // Question 4:

        // Question 5:

        // Question 6:

        // Question 7:

    }

}