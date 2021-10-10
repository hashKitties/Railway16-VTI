package Excercise5.com.vti.backend;

import Excercise5.com.vti.entity.*;

import java.util.ArrayList;
import java.util.Scanner;

public class QuanLyCanBo {
    public static ArrayList<CanBo> listCanBo = new ArrayList<CanBo>();
    Scanner scan = new Scanner(System.in);

    // Them moi can bo
    public static void themCanBo(Scanner scan) {
        CanBo canBo = new CanBo();
        System.out.println("Moi nhap vao ho ten: ");
        canBo.setHoTen(scan.nextLine());
        System.out.println("Moi nhap vao tuoi: ");
        canBo.setTuoi(Integer.parseInt(scan.nextLine()));
        System.out.println("Moi nhap vao dia chi: ");
        canBo.setDiaChi(scan.nextLine());
        System.out.println("Moi nhap vao gioi tinh: ");
        canBo.setGioiTinh(scan.nextLine());
        listCanBo.add(canBo);
    }

    // Tim kiem theo ho ten
    public static void nameSearch(Scanner scan) {
        System.out.println("Moi ban nhap vao ten muon tim:");
        String name = scan.nextLine();
        boolean flag = false;
        for (CanBo canBo : listCanBo) {
            if (canBo.getHoTen().equalsIgnoreCase(name)) {
                System.out.println(canBo.toString());
                flag = true;
            }
        }
        if (!flag) {
            System.out.println("Khong co ai ten la \"" + name + "\"");
        }
    }

    // Hien thong tin ve danh sach can bo
    public static void infoListCanBo() {
        for (CanBo canBo : listCanBo) {
            System.out.println(canBo.toString());
        }
    }

    // Xoa can bo theo ten
    public static void nameDelete(Scanner scan) {
        System.out.println("Moi ban nhap vao ten muon xoa:");
        String name = scan.nextLine();
        boolean flag = false;
        for (CanBo canBo : listCanBo) {
            if (canBo.getHoTen().equals(name)) {
                System.out.println("Can bo duoc xoa: ");
                System.out.println(canBo.toString());
                listCanBo.remove(canBo);
                flag = true;
            }
        }
        if (!flag) {
            System.out.println("Khong co ai ten la \"" + name + "\"");
        }
    }

    // Thoat

}