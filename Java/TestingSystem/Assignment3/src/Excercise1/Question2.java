package Excercise1;

import java.util.Random;

public class Question2 {
    public static void main(String[] args) {
        Random random = new Random();
        String n = Integer.toString(random.nextInt(100000));
        n = String.format("%5s",n).replace(" ","0");
        System.out.println(n);

    }
}