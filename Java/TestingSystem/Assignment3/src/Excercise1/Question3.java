package Excercise1;

import java.util.Random;

public class Question3 {
    public static void main(String[] args) {
        Random random = new Random();
        String n = Integer.toString(random.nextInt(100000));
        n = String.format("%5s",n).replace(" ","0");
        System.out.println(n);
        // Method 1: print String
        System.out.println(n.charAt(3) + "" + n.charAt(4));
        // Method 2: print int
        int i = Integer.parseInt(n);
        System.out.println(i%100);
    }
}