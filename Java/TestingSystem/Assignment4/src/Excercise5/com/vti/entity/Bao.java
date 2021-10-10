package Excercise5.com.vti.entity;

import java.util.Date;

public class Bao extends ThuVien {
    private String ngayPhatHanh;

    public String getNgayPhatHanh() {
        return ngayPhatHanh;
    }

    public void setNgayPhatHanh(String ngayPhatHanh) {
        this.ngayPhatHanh = ngayPhatHanh;
    }

    public Bao() {
    }

    public String toStringBao() {
        return "Bao{" +
                "maTaiLieu='" + super.getMaTaiLieu() + '\'' +
                ", tenNhaXuatBan='" + super.getTenNhaXuatBan() + '\'' +
                ", soBanPhatHanh='" + super.getSoBanPhatHanh() + '\'' +
                ", ngayPhatHanh='" + ngayPhatHanh + '\'' +
                '}';
    }

    public Bao(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh, String ngayPhatHanh) {
        super(maTaiLieu, tenNhaXuatBan, soBanPhatHanh);
        this.ngayPhatHanh = ngayPhatHanh;
    }
}