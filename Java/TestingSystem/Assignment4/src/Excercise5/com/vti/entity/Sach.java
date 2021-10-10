package Excercise5.com.vti.entity;

public class Sach extends ThuVien {
    private String tenTacGia;
    private int soTrang;

    public String getTenTacGia() {
        return tenTacGia;
    }

    public void setTenTacGia(String tenTacGia) {
        this.tenTacGia = tenTacGia;
    }

    public int getSoTrang() {
        return soTrang;
    }

    public void setSoTrang(int soTrang) {
        this.soTrang = soTrang;
    }

    public Sach() {
    }

    public Sach(String maTaiLieu, String tenNhaXuatBan, int soBanPhatHanh, String tenTacGia, int soTrang) {
        super(maTaiLieu, tenNhaXuatBan, soBanPhatHanh);
        this.tenTacGia = tenTacGia;
        this.soTrang = soTrang;
    }

    public String toStringSach() {
        return "Sach{" +
                "maTaiLieu='" + super.getMaTaiLieu() + '\'' +
                ", tenNhaXuatBan='" + super.getTenNhaXuatBan() + '\'' +
                ", soBanPhatHanh='" + super.getSoBanPhatHanh() + '\'' +
                ", tenTacGia='" + tenTacGia + '\'' +
                ", soTrang=" + soTrang +
                '}';
    }
}