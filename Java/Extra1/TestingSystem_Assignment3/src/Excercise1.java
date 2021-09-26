import java.util.Scanner;

public class Excercise1 {
    // Tao mang
    public static float[] taoMang(Scanner scan) {
        System.out.println("Nhap vao do dai mang: ");
        int n = Integer.parseInt(scan.nextLine());
        float a[] = new float[n];
        for (int i = 0; i < n; i++) {
            System.out.print("a[" + i + "] = ");
            a[i] = Float.parseFloat(scan.nextLine());
        }
        return a;
    }

    // Question 1: Nhập vào dãy n số thực. Tính tổng dãy, trung bình dãy, tổng các
    // số âm, dương và tổng các số ở vị trí chẵn, vị trí lẻ trong dãy.
    public static float sumArray(float n[]) {
        float sum = 0;
        for (float i : n) {
            sum += i;
        }
        return sum;
    }

    public static float avgArray(float n[]) {
        float sum = 0;
        float avg = 0;
        for (float i : n) {
            sum += i;
        }
        avg = sum / n.length;
        return avg;
    }

    public static float sumOfNeg(float n[]) {
        float sum = 0;
        for (float i : n) {
            if (i < 0) {
                sum += i;
            }
        }
        return sum;
    }

    public static float sumOfPos(float n[]) {
        float sum = 0;
        for (float i : n) {
            if (i >= 0) {
                sum += i;
            }
        }
        return sum;
    }

    public static float sumOfOdd(float n[]) {
        float sum = 0;
        for (int i = 0; i < n.length; i++) {
            if (i % 2 == 0) {
                sum += i;
            }
        }
        return sum;
    }

    public static float sumOfEven(float n[]) {
        float sum = 0;
        for (int i = 0; i < n.length; i++) {
            if (i % 2 != 0) {
                sum += i;
            }
        }
        return sum;
    }

    // Question 2: Tìm và chỉ ra vị trí xuất hiện đầu tiên của phần tử x trong dãy.
    public static void findX(float x, float a[]) {
        for (int i = 0; i < a.length; i++) {
            if (a[i] == x) {
                System.out.println("Vi tri cua " + x + "la: " + i);
                break;
            }
        }
    }

    // Question 3: Hãy nhập vào 16 số nguyên. In ra thành 4 dòng, 4 cột.
    public static int[][] taoMang2chieu(Scanner scan) {
        int row = 4;
        int col = 4;
        int a[][] = new int[row][col];
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                System.out.print("a [" + i + "][" + j + "] = ");
                a[i][j] = Integer.parseInt(scan.nextLine());
            }
        }
        System.out.println("Mang da tao la: ");
        for (int i = 0; i < row; i++) {
            for (int j = 0; j < col; j++) {
                System.out.print(a[i][j] + "\t");
            }
            System.out.println("\n");
        }
        return a;
    }

    // Question 4: Nhập vào dãy số. In ra dãy đã được sắp xếp tăng dần, giảm dần
    public static int[] sortDESC(int a[]) {
        int temp;
        int i;
        int j;
        int count = 0;
        int landoi = a.length;
        do {
            i = a.length - 1;
            count = 0;
            do {
                j = i - 1;
                if (a[i] > a[j]) {
                    temp = a[j];
                    a[j] = a[i];
                    a[i] = temp;
                }
                i = j;
                count++;
            } while (count < landoi - 1);
            landoi = count;
        } while (landoi > 1);
        return a;
    }

    public static int[] sortASC(int a[]) {
        int temp;
        int i;
        int j;
        int count = 0;
        int landoi = a.length;
        do {
            i = a.length - 1;
            count = 0;
            do {
                j = i - 1;
                if (a[i] < a[j]) {
                    temp = a[j];
                    a[j] = a[i];
                    a[i] = temp;
                }
                i = j;
                count++;
            } while (count < landoi - 1);
            landoi = count;
        } while (landoi > 1);
        return a;
    }

    // Question 5: Cho một dãy các số sau: 10, 20, 90, 50, 100, 60, 30, 80, 70, 40.
    // Hãy sắp xếp các dãy này theo chiều tăng dần, giảm dần
    // Yêu cầu:
    // Thiết kế giao diện console nhập từng phần tử và hiển thị kết quả ra màn hình.
    public static int[] nhapSo(Scanner scan) {
        int a[] = new int[10];
        for (int i = 0; i < a.length; i++) {
            System.out.print("a[" + i + "] = ");
            a[i] = Integer.parseInt(scan.nextLine());
        }
        System.out.println("\nDay da nhap la: ");
        for (int i : a) {
            System.out.print(i + "\t");
        }
        return a;
    }
    // Sau khi nhập đủ 10 phần tử theo đúng thứ tự như đề bài thì thực hiện sắp xếp
    // theo chiều tăng dần, giảm dần

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int a[]= nhapSo(scan);
        a = sortDESC(a);
        System.out.println("\nMang theo thu tu giam dan: ");
        for (int i: a) {
            System.out.print(i + "\t");
        } 
        a = sortASC(a);
        System.out.println("\nMang theo thu tu tang dan: ");
        for (int i: a) {
            System.out.print(i + "\t");
        }
    }
}
