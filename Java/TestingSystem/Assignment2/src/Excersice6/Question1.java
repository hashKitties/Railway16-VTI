package Excersice6;

public class Question1 {
    public static void printEvenNumberLessThan10(){
        System.out.println("So chan nguyen duong nho hon 10 la:");
        for (int i = 0; i < 10; i++){
            if (i%2 == 0) {
                System.out.print(i + "\t");
            }
        }
    }
    public static void main(String[] args) {
        printEvenNumberLessThan10();
    }
}