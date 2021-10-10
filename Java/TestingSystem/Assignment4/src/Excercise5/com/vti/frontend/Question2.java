package Excercise5.com.vti.frontend;

import Excercise5.com.vti.backend.*;

import java.util.Scanner;

public class Question2 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int input;
        do {
            System.out.println("Moi ban lua chon: ");
            System.out.println("1: Them moi can bo ");
            System.out.println("2: Tim kiem theo ho ten");
            System.out.println("3: Hien thong tin danh sach can bo");
            System.out.println("4: Xoa can bo theo ten");
            System.out.println("5: Thoat");
            input = Integer.parseInt(scan.nextLine());
            switch (input) {
                case 1:
                    QuanLyCanBo.themCanBo(scan);
                    break;
                case 2:
                    QuanLyCanBo.nameSearch(scan);
                    break;
                case 3:
                    QuanLyCanBo.infoListCanBo();
                    break;
                case 4:
                    QuanLyCanBo.nameDelete(scan);
                    break;
                case 5:
                    System.out.println("Da thoat chuong trinh!");
                    break;
                default:
                    System.out.println("Lua chon khong hop le, moi chon lai!");
                    break;
            }
        } while (input != 5);
    }
}