package Excercise4.com.vti.entity;

public class Student {
    private int id;
    private String name;
    private String homeTown;
    private float diemHocLuc;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHomeTown() {
        return homeTown;
    }

    public void setHomeTown(String homeTown) {
        this.homeTown = homeTown;
    }

    public float getDiemHocLuc() {
        return diemHocLuc;
    }

    public void setDiemHocLuc(int diemHocLuc) {
        this.diemHocLuc = diemHocLuc;
    }

    public void congDiem(float diemCongThem) {
        this.diemHocLuc += diemCongThem;
    }
    public Student() {
    }

    public Student(String name, String homeTown) {
        this.name = name;
        this.homeTown = homeTown;
        diemHocLuc = 0;
    }

    @Override
    public String toString() {
        String xepLoai = "";
        if (this.diemHocLuc < 4) {
            xepLoai = "Yeu";
        } else if (this.diemHocLuc < 6) {
            xepLoai = "Trung binh";
        } else if (this.diemHocLuc < 8) {
            xepLoai = "Kha";
        } else {
            xepLoai = "Gioi";
        }
        return "Student [" +
                "name='" + name + '\'' +
                ", diemHocLuc=" + diemHocLuc +
                ", Xep loai=" + xepLoai +
                ']';
    }
}