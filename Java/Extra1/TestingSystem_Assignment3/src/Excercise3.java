import java.util.Scanner;

public class Excercise3 {
    /*
     * Question 1: Hãy thiết kế giao diện console trong Java để thực hiện chương
     * trình quay sổ xố. Kết quả đề bằng 2 số cuối của giải đặc biệt. Kết quả lô
     * bằng 2 số cuối của tất cả các giải. Nếu trúng đề. tiền thắng = tiền cược*70 .
     ** Nếu trúng lô. tiền thắng = (tiền cược/23)*80*số lần giải về. Ví dụ lô 37 về 2
     * nháy :))
     */
    public static void quaySoXo(int n, Scanner scan) {
        int giainhat = (int) (Math.random() * 100);
        int giainhi = (int) (Math.random() * 100);
        int giaiba = (int) (Math.random() * 100);
        int giaitu = (int) (Math.random() * 100);
        int giaikhuyenkhich = (int) (Math.random() * 100);
        int count = 0;
        int a[] = new int[5];
        boolean flag = false;
        a[0] = giainhat;
        a[1] = giainhi;
        a[2] = giaiba;
        a[3] = giaitu;
        a[4] = giaikhuyenkhich;
        System.out.println("Nhap vao so tien dat cuoc: ");
        int amount = Integer.parseInt(scan.nextLine());
        int lo = amount;
        int de = amount;
        System.out.println("Giai nhat hom nay la: " + giainhat);
        System.out.println("Giai nhi hom nay la: " + giainhi);
        System.out.println("Giai ba hom nay la: " + giaiba);
        System.out.println("Giai tu hom nay la: " + giaitu);
        System.out.println("Giai khuyen khich hom nay la: " + giaikhuyenkhich);
        if (n == a[0]) {
            System.out.println("Xin chuc mung ban da trung de " + n);
            lo *= 70;
        } else {
            lo = 0;
        }
        for (int i : a) {
            if (n == i) {
                count++;
                flag = true;
            }
        }
        de = (de / 23) * 80 * count;
        if (flag) {
            System.out.println("Xin chuc mung ban da trung de " + n + " ve " + count + " nhay");
        } else {
            System.out.println("Chuc ban may man lan sau!");
        }
        System.out.println("So tien ban da trung thuong la: " + (lo + de));
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Nhap so may man cua ban: ");
        int n = Integer.parseInt(scan.nextLine());

        quaySoXo(n, scan);
    }
}
