import java.util.Scanner;

public class Excercise2 {
    // Question 1: Nhập xâu họ tên, in ra họ, tên dưới dạng viết hoa
    public static void getHoVietHoa(String a) {
        a.trim();
        String str[] = a.split("\s+");
        System.out.println("Ho la: " + str[1].toUpperCase());
    }

    public static void getTenVietHoa(String a) {
        a.trim();
        String str[] = a.split("\s+");
        System.out.println("Ho la: " + str[str.length - 1].toUpperCase());
    }

    // Question 2: Nhập xâu. In ra tất các các vị trí của chữ ‘a’ trong xâu và tổng
    // số lần xuất hiện của nó.
    public static void findA(String a) {
        int count = 0;
        System.out.println("Vi tri cua chu a la: ");
        for (int i = 0; i < a.length(); i++) {
            if (a.charAt(i) == 'a') {
                System.out.print(i + "\t");
                count++;
            }
        }
        System.out.println("Chu a xuat hien " + count + " lan");
    }

    // Question 3: Thay kí tự x trong xâu s bởi kí tự y (s, x, y được đọc vào từ bàn
    // phím)
    public static void replaceXSY(String x, String a, String y) {
        System.out.println("Chuoi sau khi thay doi la: " + a.replace(x, y));
    }

    // Question 4: Hãy nhập một xâu kí tự. In ra màn hình đảo ngược của xâu đó.
    public static void showReverse(String a) {
        System.out.println("Xau dao nguoc la: ");
        for (int i = a.length() - 1; i > 0; i--) {
            System.out.print(i);
        }
        System.out.println("\n");
    }

    // Question 5: Nhập xâu. Thống kê số các chữ số ‘0’, số chữ số ‘1’, ..., số chữ
    // số ‘9’ trong xâu
    public static void showNumberCount(String a) {
        int n = 0;
        int count;
        do {
            count = 0;
            for (int i = 0; i < a.length(); i++) {
                if (a.charAt(i) == n) {
                    count++;
                }
            }
            System.out.println("Xau cho truoc co " + count + " chu so " + n);
            n++;
        } while (n < 9);

    }

    // Question 6: Cho một chuỗi ký tự như sau: “Java – Nơi trí tưởng tượng bay xa”.
    // Hãy chuyển chuỗi này thành một mảng, trong đó mỗi phần tử là một từ.
    // Ví dụ a[0] = Java, a[1] = Nơi, a[2] = Trí,...
    // Sau đó in kết quả ra màn hình
    public static void tachXau(String a) {
        a.trim();
        a.replace("-", " ");
        String str[] = a.split("\s+");
        for (int i = 0; i < str.length; i++) {
            System.out.println("a[" + i + "] = " + str[i]);
        }
    }

    // Question 7: Viết chương trình kiểm tra mật khẩu người dùng khi đăng nhập.
    // Người dùng phải đăng nhập khi đến khi nào đúng username và password thì thôi.
    // (username và password được định nghĩa trước trong chương trình)
    
    public static void login(Scanner scan) {
        final String user = "admin" ;
        final String pwd = "password" ;

        String username = "";
        String password = "";
        while (username != user | password != pwd) {
            System.out.print("Nhap vao username: ");
            username = scan.nextLine();
            System.out.print("Nhap vao password: ");
            password = scan.nextLine();
            if (username.equals(user) && password.equals(pwd)) {
                System.out.println("Dang nhap thanh cong!");
                break;
            } else {
                System.out.println("Dang nhap that bai!");
                continue;
            }
        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        login(scan);
    }
}
