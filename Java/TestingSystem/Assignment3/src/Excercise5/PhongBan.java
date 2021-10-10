package Excercise5;

public class PhongBan {
    private String tenPhongBan;
    private String diaChi;

    public String getTenPhongBan() {
        return tenPhongBan;
    }

    public void setTenPhongBan(String tenPhongBan) {
        this.tenPhongBan = tenPhongBan;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    @Override
    public String toString() {
        return "PhongBan{" +
                "tenPhongBan='" + tenPhongBan + '\'' +
                ", diaChi='" + diaChi + '\'' +
                '}';
    }

}