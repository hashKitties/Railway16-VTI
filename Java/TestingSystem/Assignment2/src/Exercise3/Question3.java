package Exercise3;
import Exercise1.*;

import java.util.Date;

public class Question3 {
    public static void main(String[] args) {
        Exam exam1 = new Exam();
        exam1.id = 1;
        exam1.code = 1;
        exam1.title = "Tim hieu";
        exam1.categoryID = 1;
        exam1.duration = 60;
        exam1.creatorID = 1;
        exam1.createdDate = new Date("2021/01/01");

        Exam exam2 = new Exam();
        exam2.id = 2;
        exam2.code = 2;
        exam2.title = "Giai phap";
        exam2.categoryID = 2;
        exam2.duration = 90;
        exam2.creatorID = 2;
        exam2.createdDate = new Date("2021/01/02");

        Exam exam3 = new Exam();
        exam3.id = 3;
        exam3.code = 3;
        exam3.title = "Thuc trang";
        exam3.categoryID = 3;
        exam3.duration = 120;
        exam3.creatorID = 3;
        exam3.createdDate = new Date("2021/02/02");

        System.out.printf("Exam 1 duoc tao vao nam %tY",exam1.createdDate);

    }
}