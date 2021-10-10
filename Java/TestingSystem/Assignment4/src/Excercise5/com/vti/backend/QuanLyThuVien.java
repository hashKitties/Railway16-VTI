package Excercise5.com.vti.backend;

import Excercise5.com.vti.entity.*;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class QuanLyThuVien {
    private static ArrayList<ThuVien> listTaiLieu = new ArrayList<ThuVien>();
    Scanner scan = new Scanner(System.in);

    // Them moi tai lieu
    public static void addTaiLieu(Scanner scan) {
        System.out.println("Moi ban chon loai tai lieu: ");
        System.out.println("1: Sach");
        System.out.println("2. Tap chi");
        System.out.println("3. Bao");
        int loaiTaiLieu = Integer.parseInt(scan.nextLine());
        System.out.println("Nhap vao ma tai lieu: ");
        String maTaiLieu = scan.nextLine();
        System.out.println("Moi nhap vao ten nha xuat ban: ");
        String tenNhaXuatBan = scan.nextLine();
        System.out.println("Moi nhap vao so ban phat hanh: ");
        int soBanPhatHanh = Integer.parseInt(scan.nextLine());
        switch (loaiTaiLieu) {
            case 1:
                System.out.println("Moi nhap vao ten tac gia: ");
                String tenTacGia = scan.nextLine();
                System.out.println("Moi nhap vao so trang:");
                int soTrang = Integer.parseInt(scan.nextLine());
                ThuVien sach = new Sach(maTaiLieu, tenNhaXuatBan, soBanPhatHanh, tenTacGia, soTrang);
                listTaiLieu.add(sach);
                break;
            case 2:
                System.out.println("Moi nhap vao so phat hanh: ");
                int soPhatHanh = Integer.parseInt(scan.nextLine());
                System.out.println("Moi nhap vao thang phat hanh:");
                String thangPhatHanh = scan.nextLine();
                ThuVien tapChi = new TapChi(maTaiLieu, tenNhaXuatBan, soBanPhatHanh, soPhatHanh, thangPhatHanh);
                listTaiLieu.add(tapChi);
                break;
            case 3:
                System.out.println("Moi nhap vao ngay phat hanh:");
                String ngayPhatHanh = scan.nextLine();
                ThuVien bao = new Bao(maTaiLieu, tenNhaXuatBan, soBanPhatHanh, ngayPhatHanh);
                listTaiLieu.add(bao);
                break;
            default:
                System.out.println("So nhap khong hop le!");
                break;
        }
    }

    // Xoa tai lieu theo ma
    public static void xoaTaiLieuTheoMa(Scanner scan) {
        System.out.println("Moi ban nhap vao ma tai lieu muon xoa");
        String maTaiLieu = scan.nextLine();
        boolean flag = false;
        for (ThuVien taiLieu : listTaiLieu) {
            if (taiLieu.getMaTaiLieu().equals(maTaiLieu)) {
                System.out.println("Tai lieu duoc xoa: ");
                System.out.println(taiLieu.toString());
                listTaiLieu.remove(taiLieu);
                flag = true;
            }
        }
        if (!flag) {
            System.out.println("Khong co tai lieu nao co ma la \"" + maTaiLieu + "\"");
        }
    }

    // Hien thong tin tai lieu
    public static void showInfo() {
        for (ThuVien taiLieu : listTaiLieu) {
            if (taiLieu instanceof Sach) {
                System.out.println(((Sach) taiLieu).toStringSach());
            } else if (taiLieu instanceof Bao) {
                System.out.println(((Bao) taiLieu).toStringBao());
            } else if (taiLieu instanceof TapChi) {
                System.out.println(((TapChi) taiLieu).toStringTapChi());
            } else {
                System.out.println(taiLieu.toString());
            }
        }
    }

    // Tim kiem theo loai (sach, bao, tap chi)
    public static void typeSearch(Scanner scan) {
        System.out.println("Moi ban chon loai tai lieu: ");
        System.out.println("1: Sach");
        System.out.println("2. Tap chi");
        System.out.println("3. Bao");
        int loaiTaiLieu = Integer.parseInt(scan.nextLine());
        switch (loaiTaiLieu) {
            case 1:
                for (ThuVien sach : listTaiLieu) {
                    if (sach instanceof Sach) {
                        System.out.println(((Sach) sach).toStringSach());
                    }
                }
                break;
            case 2:
                for (ThuVien tapchi : listTaiLieu) {
                    if (tapchi instanceof TapChi) {
                        System.out.println(((TapChi) tapchi).toStringTapChi());
                    }
                }
                break;
            case 3:
                for (ThuVien bao : listTaiLieu) {
                    if (bao instanceof Bao) {
                        System.out.println(((Bao) bao).toStringBao());
                    }
                }
                break;
            default:
                System.out.println("So nhap khong hop le!");
                break;
        }
    }
    // Thoat

}