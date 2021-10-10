package Excercise5.com.vti.frontend;

import Excercise5.com.vti.backend.QuanLyThuVien;

import java.util.Scanner;

public class Question4 {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        int input;
        do {
            System.out.println("Moi ban lua chon: ");
            System.out.println("1: Them moi tai lieu ");
            System.out.println("2: Xoa tai lieu theo ma");
            System.out.println("3: Hien thong tin tai lieu");
            System.out.println("4: Tim kiem theo loai");
            System.out.println("5: Thoat");
            input = Integer.parseInt(scan.nextLine());
            switch (input) {
                case 1:
                    QuanLyThuVien.addTaiLieu(scan);
                    break;
                case 2:
                    QuanLyThuVien.xoaTaiLieuTheoMa(scan);
                    break;
                case 3:
                    QuanLyThuVien.showInfo();
                    break;
                case 4:
                    QuanLyThuVien.typeSearch(scan);
                    break;
                case 5:
                    System.out.println("Thoat chuong trinh!");
                    break;
                default:
                    System.out.println("Nhap vao khong hop le!");
                    break;
            }

        } while (input != 5);
    }
}