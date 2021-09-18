import java.util.Scanner;
import java.text.DecimalFormat;

public class excercise1 {
    final static float cminchrate = 2.54f;
    final static float inchfootrate = 12;

    // Question 1:
    public static float cmToInch(Float x) {
        x *= cminchrate;
        return x;
    }

    public static float cmToFoot(Float y) {
        float x = cmToInch(y);
        x *= cminchrate;
        return x;
    }

    // Question 2:
    public static int getHours(int n) {
        return n / 3600;
    }

    public static int getMinutes(int n) {
        return n % 3600 / 60;
    }

    public static int getSeconds(int n) {
        return n % 3600 % 60;
    }

    // Question 3:
    public static int[] TaoMang(Scanner scan) {
        System.out.println("Nhap vao do dai mang");
        int n = Integer.parseInt(scan.nextLine());
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.print("a[" + i + "] = ");
            a[i] = Integer.parseInt(scan.nextLine());
        }
        System.out.println("Mang da tao la: ");
        for (int i : a) {
            System.out.print(i + "\t");
        }
        return a;
    }

    public static int getMax(int[] a) {
        int max = a[0];
        for (int i : a) {
            if (i > max) {
                max = i;
            }
        }
        return max;
    }

    public static int getMin(int[] a) {
        int min = a[0];
        for (int i : a) {
            if (i < min) {
                min = i;
            }
        }
        return min;
    }

    // Question 4:

    public static void soSanh(int a, int b) {
        if (a - b < 0) {
            System.out.println("So thu nhat nho hon so thu hai");
        } else if (a - b > 0) {
            System.out.println("So thu nhat lon hon so thu hai");
        } else {
            System.out.println("Hai so bang nhau");
        }
    }

    // Question 5:

    public static void divCheck(int a, int b) {
        if (a % b == 0) {
            System.out.println("So " + a + " chia het cho " + b);
        } else {
            System.out.println("So " + a + " khong chia het cho " + b);
        }
    }

    // Question 6:
    public static void XepLoaiSinhVien (int toan, int ly, int hoa) {
        float diemTB = ((toan * 2) + ly + hoa)/4;
        System.out.println("Diem trung binh cua hoc sinh la: "+ diemTB);
        if (diemTB < 5) {
            System.out.println("Hoc sinh loai kem");
        } else if (diemTB < 6) {
            System.out.println("Hoc sinh loai trung binh");
        } else if (diemTB < 7) {
            System.out.println("Hoc sinh loai trung binh kha");
        } else if (diemTB < 8) {
            System.out.println("Hoc sinh loai kha");
        } else if (diemTB < 9) {
            System.out.println("Hoc sinh loai gioi");
        } else {
            System.out.println("Hoc sinh loai xuat sac");
        }
    }

        public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        // Question 1:
        // DecimalFormat df = new DecimalFormat("#.##");
        // System.out.println("Nhap vao so cm: ");
        // Float x = Float.parseFloat(scan.nextLine());
        // System.out.println("Gia tri cua " + x + " cm sang inch la: " +
        // df.format(cmToInch(x)));
        // System.out.println("Gia tri cua " + x + " cm sang foot la: " +
        // df.format(cmToFoot(x)));

        // Question 2:
        // System.out.println("Nhap vao so giay: ");
        // DecimalFormat tf = new DecimalFormat("00");
        // int n = Integer.parseInt(scan.nextLine());
        // System.out.println("Gio quy doi: " + tf.format(getHours(n)) + ":" +
        // tf.format(getMinutes(n)) + ":" + tf.format(getSeconds(n)));

        // Question 3:
        // int[] a = TaoMang(scan);
        // System.out.println("\nSo lon nhat trong mang la: " + getMax(a));
        // System.out.println("So nho nhat trong mang la: " + getMin(a));

        // Question 4:
        // System.out.println("Nhap vao so a: ");
        // int a = Integer.parseInt(scan.nextLine());
        // System.out.println("Nhap vao so b: ");
        // int b = Integer.parseInt(scan.nextLine());
        // soSanh(a,b);

        // Question 5:
        // System.out.println("Nhap vao so a: ");
        // int a = Integer.parseInt(scan.nextLine());
        // System.out.println("Nhap vao so b: ");
        // int b = Integer.parseInt(scan.nextLine());
        // divCheck(a, b);

        // Question 6:
        // System.out.println("Nhap vao diem toan: ");
        // int toan = Integer.parseInt(scan.nextLine());
        // System.out.println("Nhap vao diem ly: ");
        // int ly = Integer.parseInt(scan.nextLine());
        // System.out.println("Nhap vao diem hoa: ");
        // int hoa = Integer.parseInt(scan.nextLine());
        // XepLoaiSinhVien(toan, ly, hoa);
    }
}
