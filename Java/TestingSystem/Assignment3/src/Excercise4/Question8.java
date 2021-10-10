package Excercise4;

import java.util.Scanner;

public class Question8 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String[] group = {"Java 1", "Java 2" , "Update", "Java"};
        for (int i = 0; i < group.length; i++) {
            if (group[i].contains("Java")) {
                System.out.println(group[i]);
            }
        }
    }
}