
public class excercise3 {
    public static void printA () {
        int count;
        for (int i = 0; i < 8; i ++) {
            count = 0;
            while (count <= i) {
                System.out.print('*');
                count ++;
            }
            System.out.print("\n");
        }
    }
    
    public static void printB () {
        int count;
        int i = 8;
        do {
            count = 0;
            while (count < i) {
                System.out.print('*');
                count ++;
            }
            System.out.print("\n");
            i--;
        } while (i > 0);
    }

    public static void printBReverse () {
        int count;
        int i = 8;
        String text;
        do {
            text = "";
            count = 0;
            while (count < i) {
                text = text.concat("*");
                count ++;
            }
            text = String.format("%8s",text);
            System.out.println(text);
            i--;
        } while (i > 0);
    }

    public static void printAReverse () {
        int count;
        String text;
        for (int i = 0; i < 8; i ++) {
            text = "";
            count = 0;
            while (count <= i) {
                text = text.concat("*");
                count ++;
            }
            text = String.format("%8s",text);
            System.out.println(text);
        }
    }

    public static int giaithua(int n) {
        int giaithua = 1;
        if (n > 0 && n <= 1) {
            return giaithua;
        } else if (n > 1) {
            for (int i = 1; i <= n; i++) {
                giaithua *= i;
            }
        }
        return giaithua;
    }
    
    public static void main(String[] args) {
        // printA();
        printAReverse();
    }
}