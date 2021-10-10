import java.util.HashSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Collections;

public class excercise2 {
    // Tao mang
    public static float[] TaoMang(Scanner scan) {
        System.out.println("Nhap vao do dai mang: ");
        int n = Integer.parseInt(scan.nextLine());
        float[] a = new float[n];
        for (int i = 0; i < n; i++) {
            System.out.print("a[" + i + "] = ");
            a[i] = Float.parseFloat(scan.nextLine());
        }
        return a;
    }

    public static int[] TaoMangInt(Scanner scan) {
        System.out.println("Nhap vao do dai mang: ");
        int n = Integer.parseInt(scan.nextLine());
        int[] a = new int[n];
        for (int i = 0; i < n; i++) {
            System.out.print("a[" + i + "] = ");
            a[i] = Integer.parseInt(scan.nextLine());
        }
        return a;
    }

    // Question 1: Liet ke cac phan tu xuat hien dung 1 lan
    public static void showNonDuplicate(float[] a) {
        int count;
        float checknum;
        int j = 0;
        do {
            count = 0;
            checknum = a[j];
            for (int i = 0; i < a.length; i++) {
                if (a[i] == checknum) {
                    count++;
                }
            }
            if (count == 1) {
                System.out.print(checknum + "\t");
            }
            j++;
        } while (j < a.length);
    }

    // Question 2: Liet ke cac phan tu xuat hien trong day dung 2 lan
    public static void showDoubleValues(float[] a) {
        int count;
        float checknum;
        int j = 0;
        do {
            count = 0;
            checknum = a[j];
            for (int i = 0; i < a.length; i++) {
                if (a[i] == checknum) {
                    count++;
                }
            }
            if (count == 2) {
                System.out.print(checknum + "\t");
            }
            j++;
        } while (j < a.length);
    }

    // Question 3: In ra man hinh so lan xuat hien cac phan tu xuat
    public static void countShowUpTime(float[] a) {
        int count;
        HashSet<Float> myset = new HashSet<Float>();
        for (float i : a) {
            myset.add(i);
        }
        for (float j : myset) {
            count = 0;
            for (int i = 0; i < a.length; i++) {
                if (a[i] == j) {
                    count++;
                }
            }
            System.out.println("So lan xuat hien cua phan tu " + j + " la: " + count);
        }
    }

    // Question 4: Tinh tong cac chu so cua mot so nguyen
    public static int sumOfCharacters(int n) {
        int sum = 0;
        int i;
        do {
            i = n % 10;
            sum += i;
            n /= 10;
        } while (n != 0);
        return sum;
    }

    // Question 5: Phan tich mot so thanh tich cac thua so nguyen tong
    // Kiem tra so nguyen to
    public static boolean isNT(int n) {
        boolean flag = true;
        if (n <= 1) {
            flag = false;
        } else {
            for (int i = 2; i <= Math.sqrt(n); i++) {
                if (n % i == 0) {
                    flag = false;
                    break;
                }
            }
        }
        return flag;
    }

    // Phan tich thanh cac thua so nguyen to
    public static HashMap<Integer, Integer> phanTichNT(int n) {
        HashMap<Integer, Integer> mymap = new HashMap<Integer, Integer>();
        int count;
        int i = 2;
        if (isNT(n)) {
            mymap.put(1, 1);
            mymap.put(n, 1);
        } else {
            do {
                count = 0;
                while (n % i == 0) {
                    count++;
                    n /= i;
                }
                mymap.put(i, count);
                do {
                    i++;
                } while (!isNT(i));
            } while (n != 1);
        }
        return mymap;

    }

    // Question 6: Liet ke cac so nguyen to nho hon so n cho truoc
    public static void listOfNTLessThan(int n) {
        System.out.println("Cac so nguyen to nho hon " + n + " la: ");
        for (int i = 0; i < n; i++) {
            if (isNT(i)) {
                System.out.print(i + "\t");
            }
        }
    }

    // Question 7: Liet ke n so nguyen to dau tien
    public static void listOfNTIn(int n) {
        int count = 0;
        int i = 2;
        System.out.println(n + " so nguyen to dau tien la: ");
        while (count < n) {
            if (isNT(i)) {
                System.out.print(i + "\t");
                count++;
            }
            i++;
        }
    }

    // Question 8: Tim uoc chung lon nhat, boi chung nho nhat cua a va b
    public static int UCLN(int a, int b) {
        int ucln;
        if (a < b) {
            while (a < b) {
                b -= a;
            }
            ucln = b;
        } else if (a > b) {
            while (a > b) {
                a -= b;
            }
            ucln = a;
        } else {
            ucln = a;
        }
        return ucln;
    }

    public static int BCNN(int a, int b) {
        int bcnn;
        bcnn = (a * b) / UCLN(a, b);
        return bcnn;
    }

    // Question 9: Tim so fibonannci thu n
    public static int findNfibonannci(int n) {
        int f1 = 1;
        int f2 = 1;
        int f = 0;
        int count = 2;
        if (n <= 2) {
            return f2;
        } else {
            while (count < n) {
                f = f1 + f2;
                f1 = f2;
                f2 = f;
                count++;
            }
        }
        return f;
    }

    // Question 10: Liet ke cac so thuan nghich doc co 6 chu so: VD 558855
    public static boolean isThuanNghich(int n) {
        boolean flag = true;
        int checknum1, checknum2;
        int num = n;
        int sochia = 1;
        int count = 0;
        // check so chu so
        while (num != 0) {
            num /= 10;
            count++;
        }
        if (count % 2 == 0) {
            for (int i = 0; i < count / 2; i++) {
                sochia *= 10;
            }
            checknum1 = n / sochia;
            checknum2 = n % sochia;
            while (checknum1 != 0) {
                sochia /= 10;
                if (checknum1 / sochia == checknum2 % 10) {
                    checknum1 %= sochia;
                    checknum2 /= 10;
                    continue;
                } else {
                    flag = false;
                    break;
                }
            }
        } else {
            for (int i = 0; i < count / 2; i++) {
                sochia *= 10;
            }
            checknum1 = n / (sochia * 10);
            checknum2 = n % sochia;
            while (checknum1 != 0 | checknum2 != 0) {
                sochia /= 10;
                if (checknum1 / sochia == checknum2 % 10) {
                    checknum1 %= sochia;
                    checknum2 /= 10;
                    continue;
                } else {
                    flag = false;
                    break;
                }
            }
        }
        return flag;
    }

    // Question 11: Liet ke tat ca cac hoan vi cua n (n!)
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

    // Question 12: Cho 2 day so thuc tang dan, lay hop cua 2 day tren co thu tu
    // tang dan su dung tinh chat xap sep cua day
    public static ArrayList<Float> hopHaiMang(float[] a, float[] b) {
        ArrayList<Float> mylist = new ArrayList<Float>();
        for (float i : a) {
            for (float j : b) {
                if (i <= j) {
                    mylist.add(i);
                    break;
                } else {
                    if (!mylist.contains(j)) {
                        mylist.add(j);
                        continue;
                    }
                    continue;
                }
            }
        }
        for (float i : b) {
            if (!mylist.contains(i)) {
                mylist.add(i);
                continue;
            }
        }
        return mylist;
    }

    // Question 13: Nhap so n va day cac so thuc. Khong doi cho va khong dung mang
    // so thuc, hien day tren theo thu tu tang dan
    public static void chenMangASC(float a[], float n) {
        int b[] = new int[a.length];
        float min = a[0];
        boolean flag;
        int index = 0;
        int count = 0;
        for (int i = 0; i < a.length; i++) {
            if (a[i] < min) {
                min = a[i];
            }
        }
        do {
            // Gan b[index]
            for (int i = 0; i < a.length; i++) {
                if (min == a[i]) {
                    b[index] = i;
                    break;
                }
            }
            // Gan lai min
            for (int i = 0; i < a.length; i++) {
                flag = true;
                for (int j = 0; j <= index; j++) {
                    if (i == b[j]) {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    min = a[i];
                    break;
                } else {
                    continue;
                }
            }
            // Tim min tiep theo
            for (int i = 0; i < a.length; i++) {
                flag = true;
                for (int j = 0; j <= index; j++) {
                    if (i == b[j]) {
                        flag = false;
                        break;
                    }
                }
                if (flag) {
                    if (a[i] < min) {
                        min = a[i];
                    }
                } else {
                    continue;
                }
            }
            index++;
        } while (index < b.length);
        if (a[b.length - 1] < n) {
            for (int i : b) {
                System.out.print(a[i] + "\t");
            }
            System.out.print(n + "\t");
        } else if (a[b[0]] > n) {
            System.out.print(n + "\t");
            for (int i : b) {
                System.out.print(a[i] + "\t");
            }
        } else {
            flag = true;
            for (int i : b) {
                if (a[i + 1] < n) {
                    System.out.print(a[i] + "\t");
                } else if (a[i + 1] == n && flag) {
                    System.out.print(a[i] + "\t");
                    System.out.print(n + "\t");
                    flag = false;
                } else if (a[i] > n && flag) {
                    System.out.print(n + "\t");
                    System.out.print(a[i] + "\t");
                    flag = false;
                } else {
                    System.out.print(a[i] + "\t");

                }

            }
        }
    }

    // Question 14: Liet ke so Fibonanci < n va la so nguyen to
    public static int getFibonanci(int n) {
        int f1 = 1;
        int f2 = 1;
        int f = 0;
        int count = 0;
        if (n <= 1) {
            return f2;
        } else {
            while (count <= n) {
                f = f1 + f2;
                f1 = f2;
                f2 = f;
                count = f;
            }
        }
        return f1;
    }

    public static boolean isFibonanci(int n) {
        boolean flag = true;
        if (n != getFibonanci(n)) {
            flag = false;
        }
        return flag;
    }

    public static void getNTFibonanci(int n) {
        for (int i = 0; i < n; i++) {
            if (isNT(i) && isFibonanci(i)) {
                System.out.print(i + "\t");
            } else {
                continue;
            }
        }
    }

    // Question 15: Nhap so n va a. tinh tong cac chu so, b. Phan tich n thanh cac
    // thua so nguyen to

    // Question 16: Nhap n, liet ke cac uoc so cua n, liet ke cac uoc so la so
    // nguyen to
    public static void uocSo(int n) {
        for (int i = 1; i <= n; i++) {
            if (n % i == 0) {
                System.out.print(i + "\t");
            }
        }
    }

    public static void uocSoNT(int n) {
        for (int i = 1; i <= n; i++) {
            if (n % i == 0 && isNT(i)) {
                System.out.print(i + "\t");
            }
        }
    }
    // Question 17: LIet ke so nguyen to co 7 chu so la so thuan nghich, tong cac
    // chu so cua so do la so thuan nghich

    // Question 18: Nhap A co n phan tu nguyen >0 va < 100, tim phan tu lon nhat va
    // lon thu 2, sap xep mang theo thu tu giam dan
    // nhap so nguyen x va chen so vao mang sao cho van giam dan
    public static void getMax(int a[]) {
        ArrayList<Integer> mylist = new ArrayList<Integer>();
        for (int i : a) {
            mylist.add(i);
        }
        Collections.sort(mylist, Collections.reverseOrder());
        System.out.println("So lon nhat la: " + mylist.get(0));
    }

    public static void get2ndMax(int a[]) {
        ArrayList<Integer> mylist = new ArrayList<Integer>();
        for (int i : a) {
            mylist.add(i);
        }
        Collections.sort(mylist, Collections.reverseOrder());
        System.out.println("So lon thu hai la: " + mylist.get(1));
    }

    public static void MangSorted(int a[]) {
        ArrayList<Integer> mylist = new ArrayList<Integer>();
        for (int i : a) {
            mylist.add(i);
        }
        Collections.sort(mylist, Collections.reverseOrder());
        System.out.println("Mang theo thu tu giam dan la: ");
        for (int i : mylist) {
            System.out.print(i + "\t");
        }
    }

    public static void chenMangSorted(int a[], int n) {
        ArrayList<Integer> mylist = new ArrayList<Integer>();
        for (int i : a) {
            mylist.add(i);
        }
        mylist.add(n);
        Collections.sort(mylist, Collections.reverseOrder());
        System.out.println("Mang theo thu tu giam dan la: ");
        for (int i : mylist) {
            System.out.print(i + "\t");
        }
    }

    // Question 19: Nhap A co n phan tu nguyen >0 va < 100, tim phan tu lon nhat va
    // lon thu 2, sap xep mang theo thu tu giam dan
    // nhap so nguyen x va chen so vao mang sao cho van giam dan
    // Giong bai 18


    // Question 20: chuan hoa xau ky tu: bo dau cach thua, viet hoa chu cai dau cau,
    // cac ky tu khac thanh ky tu thuong
    public static void chuanHoaString(String a) {
        a.trim();
        String firstletter;
        String fullstr = "";
        String str[] = a.split("\s+");
        for (String i : str) {
            i.toLowerCase();
            firstletter = i.substring(0, 1).toUpperCase();
            i = firstletter.concat(i.substring(1));
            fullstr = fullstr.concat(i).concat(" ");
        }
        fullstr.trim();
        System.out.println("Chuoi da chuan hoa la: " + fullstr);
    }

    // Question 21: Nhap xau ky tu: tim tu dai nhat trong xau / vi tri xuat hien cua
    // tu do (neu bang nhau chon tu dau tien)
    public static void findLongestWord(String a) {
        a.trim();
        String str[] = a.split("\s+");
        int maxlength = str[0].length();
        int index = 0;
        for (int i = 0; i < str.length; i++) {
            if (str[i].length() > maxlength) {
                maxlength = str[i].length();
                index = i;
            }
        }
        System.out.println("Tu dai nhat la \"" + str[index] + "\" co vi tri thu " + index);
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        // Tao mang va in gia tri
        // float a[] = TaoMang(scan);
        // System.out.println("Mang da tao la: ");
        // for (float i : a) {
        // System.out.print(i + "\t");
        // }
        // System.out.print("\n");
        // Question 1:
        // System.out.println("Cac phan tu xuat hien dung 1 lan la: ");
        // showNonDuplicate (a);

        // Question 2:
        // System.out.println("Cac phan tu xuat hien dung 2 lan la: ");
        // showDoubleValues(a);

        // Question 3:
        // countShowUpTime(a);

        // Question 4:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // System.out.println("Tong cac chu so cua " + n + " la " + sumOfCharacters(n));

        // Question 5:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // HashMap<Integer, Integer> mymap = phanTichNT(n);
        // for (int i : mymap.keySet()) {
        // if (mymap.get(i) != 0) {
        // System.out.print(i + "^" + mymap.get(i) + "\t");
        // }
        // }

        // Question 6:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // listOfNTLessThan(n);

        // Question 7:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // listOfNTIn(n);

        // Question 8:
        // System.out.println("Nhap vao mot so nguyen thu nhat: ");
        // int a = Integer.parseInt(scan.nextLine());
        // System.out.println("Nhap vao mot so nguyen thu hai: ");
        // int b = Integer.parseInt(scan.nextLine());
        // System.out.println("Boi chung nho nhat la: " + BCNN(a, b));
        // System.out.println("Uoc chung lon nhat la: " + UCLN(a, b));

        // Question 9:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // int f = findNfibonannci(n);
        // System.out.println("So fibonannci thu " + n + " la " + f);

        // Question 10:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // System.out.println(isThuanNghich(n));

        // Question 11:
        // System.out.println("Nhap vao mot so nguyen: ");
        // int n = Integer.parseInt(scan.nextLine());
        // System.out.println(n + "! = " + giaithua(n));

        // Question 12:
        // float a[] = TaoMang(scan);
        // float b[] = TaoMang(scan);
        // ArrayList<Float> c = hopHaiMang(a, b);
        // System.out.println("Hop hai mang la: ");
        // for (float i : c) {
        // System.out.print(i + "\t");
        // }

        // Question 13:
        // System.out.println("Nhap vao mot so: ");
        // float n = Float.parseFloat(scan.nextLine());
        // float a[] = TaoMang(scan);
        // chenMangASC(a, n);

        // Question 14:
        // System.out.println("Nhap vao mot so: ");
        // int n = Integer.parseInt(scan.nextLine());
        // getNTFibonanci(n);

        // // Question 15:
        // System.out.println("Nhap vao mot so: ");
        // int n = Integer.parseInt(scan.nextLine());
        // HashMap<Integer, Integer> mymap = phanTichNT(n);
        // System.out.println("Tich cac thu so nguyen to la: ");
        // for (int i : mymap.keySet()) {
        // if (mymap.get(i) != 0) {
        // System.out.print(i + "^" + mymap.get(i) + "\t");
        // }
        // }
        // System.out.println("Tong cac chu so la: " + sumOfCharacters(n));

        // Question 16:
        // System.out.println("Nhap vao mot so: ");
        // int n = Integer.parseInt(scan.nextLine());
        // System.out.println("Cac uoc so la so nguyen to: ");
        // uocSoNT(n);
        // System.out.println("\nCac uoc so la: ");
        // uocSo(n);

        // Question 17:
        // for (int i = 1000000; i <= 9999999; i++){
        // if (isThuanNghich(i) && isThuanNghich(sumOfCharacters(i))) {
        // System.out.print(i + "\t");
        // }
        // }

        // Question 18:
        // System.out.println("Nhap vao mot so: ");
        // int n = Integer.parseInt(scan.nextLine());
        // int a[] = TaoMangInt(scan);
        // getMax(a);
        // get2ndMax(a);
        // MangSorted(a);
        // chenMangSorted(a, n);

        // Question 20:
        // System.out.println("Nhap vao mot chuoi: ");
        // String a = scan.nextLine();
        // chuanHoaString(a);

    //     // Question 21:
    //     System.out.println("Nhap vao mot chuoi: ");
    //     String a = scan.nextLine();
    //     findLongestWord(a);
    }
}
