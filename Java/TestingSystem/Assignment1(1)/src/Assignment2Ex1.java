import java.util.Date;
import java.util.ArrayList;

public class Assignment2Ex1 {
    public static void main(String[] args) {
        Department department1 = new Department();
        department1.id = 1;
        department1.name = "Sale";

        Department department2 = new Department();
        department2.id = 2;
        department2.name = "Marketing";

        Department department3 = new Department();
        department3.id = 3;
        department3.name = "Security";

        // Position
        Position position1 = new Position();
        position1.id = 1;
        position1.name = "Dev";

        Position position2 = new Position();
        position2.id = 2;
        position2.name = "Test";

        Position position3 = new Position();
        position3.id = 3;
        position3.name = "PM";

        // Account
        Account account1 = new Account();
        account1.id = 1;
        account1.email = "acc1@gmail.com";
        account1.username = "acc1";
        account1.fullName = "nguyen van a";
        account1.departmentID = 1;
        account1.positionID = 1;
        account1.createDate = new Date("2020/02/14");

        Account account2 = new Account();
        account2.id = 1;
        account2.email = "acc2@gmail.com";
        account2.username = "acc2";
        account2.fullName = "nguyen van b";
        account2.departmentID = 2;
        account2.positionID = 2;
        account2.createDate = new Date("2020/03/14");

        Account account3 = new Account();
        account3.id = 1;
        account3.email = "acc3@gmail.com";
        account3.username = "acc3";
        account3.fullName = "nguyen van c";
        account3.departmentID = 3;
        account3.positionID = 3;
        account3.createDate = new Date("2020/04/14");

        // Group
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Dev";
        group1.creatorID = account1.id;
        group1.createDate = new Date("2020/03/14");

        Group group2 = new Group();
        group2.id = 2;
        group2.name = "Test";
        group2.creatorID = account1.id;
        group2.createDate = new Date("2020/02/18");

        Group group3 = new Group();
        group3.id = 3;
        group3.name = "PM";
        group3.creatorID = account1.id;
        group3.createDate = new Date("2020/05/11");

        GroupAccount ga1 = new GroupAccount();
        ga1.id = 1;
        ga1.accountID = account1.id;
        ga1.joinDate = new Date("2019/11/12");

        GroupAccount ga2 = new GroupAccount();
        ga2.id = 2;
        ga2.accountID = account1.id;
        ga2.joinDate = new Date("2019/08/12");

        GroupAccount ga3 = new GroupAccount();
        ga3.id = 3;
        ga3.accountID = account1.id;
        ga3.joinDate = new Date("2019/09/11");

        // TypeQuestion
        TypeQuestion type1 = new TypeQuestion();
        type1.id = 1;
        type1.typename = "Essay";

        TypeQuestion type2 = new TypeQuestion();
        type2.id = 2;
        type2.typename = "Multiple Choices";

        TypeQuestion type3 = new TypeQuestion();
        type3.id = 3;
        type3.typename = "Yes No";

        // CategoryQuestion
        CategoryQuestion categoryQuestion1 = new CategoryQuestion();
        categoryQuestion1.id = 1;
        categoryQuestion1.categoryName = "Java";

        CategoryQuestion categoryQuestion2 = new CategoryQuestion();
        categoryQuestion2.id = 2;
        categoryQuestion2.categoryName = "C++";

        CategoryQuestion categoryQuestion3 = new CategoryQuestion();
        categoryQuestion3.id = 3;
        categoryQuestion3.categoryName = "HTML";

        // Question
        Question question1 = new Question();
        question1.id = 1;
        question1.content = "Hay cho biet";
        question1.categoryID = 1;
        question1.typeID = 1;
        question1.creatorID = account1.id;
        question1.createdDate = new Date("2020/10/11");

        Question question2 = new Question();
        question2.id = 2;
        question2.content = "Co phai";
        question2.categoryID = 2;
        question2.typeID = 2;
        question2.creatorID = account1.id;
        question2.createdDate = new Date("2020/10/12");

        Question question3 = new Question();
        question3.id = 3;
        question3.content = "Dung la";
        question3.categoryID = 3;
        question3.typeID = 3;
        question3.creatorID = account1.id;
        question3.createdDate = new Date("2020/10/20");

        // Answer
        Answer answer1 = new Answer();
        answer1.id = 1;
        answer1.content = "Dung";
        answer1.questionID = 1;
        answer1.isCorrect = true;

        Answer answer2 = new Answer();
        answer2.id = 2;
        answer2.content = "Sai";
        answer2.questionID = 2;
        answer2.isCorrect = true;

        Answer answer3 = new Answer();
        answer3.id = 3;
        answer3.content = "Khong biet";
        answer3.questionID = 3;
        answer3.isCorrect = false;

        // Exam
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

        ExamQuestion examquestion1 = new ExamQuestion();
        examquestion1.examID = 1;
        examquestion1.questionID = 1;

        ExamQuestion examquestion2 = new ExamQuestion();
        examquestion2.examID = 2;
        examquestion2.questionID = 2;

        ExamQuestion examquestion3 = new ExamQuestion();
        examquestion3.examID = 3;
        examquestion3.questionID = 3;

        // // Question1:
        // if (account2.id == 0) {
        // System.out.println("Nhan vien nay chua co phong ban");
        // } else {
        // System.out.println("Phong ban cua nhan vien nay la " + account2.id);
        // }
        // // Question2:
        // int count = 0;
        // if (account2.id == ga1.id) {
        // count += 1;
        // }
        // if (account2.id == ga2.id) {
        // count += 1;
        // }
        // if (account2.id == ga3.id) {
        // count += 1;
        // }
        // if (count == 0) {
        // System.out.println("Nhan vien nay chua co phong ban");
        // } else if (count == 1 | count == 2) {
        // System.out.println("Group cua nhan vien nay la Java Freshser, C# Freshser");
        // } else if (count == 3) {
        // System.out.println("Nhan vien nay la nguoi quan trong, tham gia nhieu
        // group");
        // } else if (count >= 4) {
        // System.out.println("Nhan vien nay la nguoi hong chuyen, tham gia tat ca cac
        // group");
        // }
        // // Question3:
        // String msg = (account2.id == 0) ? "Nhan vien nay chua co phong ban"
        // : "Phong ban cua nhan vien nay la " + account2.id;
        // System.out.println(msg);

        // // Question4:
        // msg = (account1.positionID == 1) ? "Day la Developer" : "Nguoi nay khong phai
        // Developer";
        // System.out.println(msg);

        // // Question5:
        // count = 0;
        // if (ga1.id == 1) {
        // count++;
        // }
        // if (ga2.id == 1) {
        // count++;
        // }
        // if (ga3.id == 1) {
        // count++;
        // }
        // switch (count) {
        // case 1:
        // System.out.println("Nhom co 1 thanh vien");
        // break;
        // case 2:
        // System.out.println("Nhom co 2 thanh vien");
        // break;
        // case 3:
        // System.out.println("Nhom co 3 thanh vien");
        // break;
        // default:
        // System.out.println("Nhom co nhieu thanh vien");
        // }

        // // Question6:
        // count = 0;
        // if (account2.id == ga1.id) {
        // count += 1;
        // }
        // if (account2.id == ga2.id) {
        // count += 1;
        // }
        // if (account2.id == ga3.id) {
        // count += 1;
        // }
        // switch (count) {
        // case 0:
        // System.out.println("Nhan vien nay chua co phong ban");
        // break;
        // case 1:
        // System.out.println("Group cua nhan vien nay la Java Freshser, C# Freshser");
        // break;
        // case 2:
        // System.out.println("Group cua nhan vien nay la Java Freshser, C# Freshser");
        // break;
        // case 3:
        // System.out.println("Nhan vien nay la nguoi quan trong, tham gia nhieu
        // group");
        // break;
        // default:
        // System.out.println("Nhan vien nay la nguoi hong chuyen, tham gia tat ca cac
        // group");
        // }

        // // Question7:
        // switch (account1.positionID) {
        // case 1:
        // System.out.println("Day la Developer");
        // break;
        // default:
        // System.out.println("Nguoi nay khong phai la Developer");
        // }

        // // Question 8:
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);

        // for (Account account : accounts) {
        // System.out.println("Email: " + account.email + ", Fullname: " +
        // account.fullName + ", Department: " + account.departmentID);
        // }

        // // QUestion 9:
        // ArrayList<Department> departments = new ArrayList<Department>();
        // departments.add(department1);
        // departments.add(department2);
        // departments.add(department3);

        // for (Department department : departments) {
        // System.out.println("ID: " + department.id + ", Department name: " +
        // department.name);
        // }

        // Question 10 - For loop
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);

        // String departmentname = "";
        // for (int i = 0; i < accounts.size(); i++) {
        // System.out.println("Thong tin account thu " + (i + 1));
        // System.out.println("Email: " + accounts.get(i).email);
        // System.out.println("Fullname: " + accounts.get(i).fullName);
        // switch (accounts.get(i).departmentID) {
        // case 1:
        // departmentname = "Sale";
        // break;
        // case 2:
        // departmentname = "Marketing";
        // break;
        // case 3:
        // departmentname = "Security";
        // break;
        // }
        // System.out.println("Department: " + departmentname + "\n");
        // }

        // Question 11:
        // ArrayList<Department> departments = new ArrayList<Department>();
        // departments.add(department1);
        // departments.add(department2);
        // departments.add(department3);
        // for (int i = 0; i < departments.size(); i++) {
        // System.out.println("Thong tin department thu " + (i+1));
        // System.out.println("ID: " + departments.get(i).id);
        // System.out.println("Name: " + departments.get(i).name + "\n");
        // }

        // Question 12:
        // ArrayList<Department> departments = new ArrayList<Department>();
        // departments.add(department1);
        // departments.add(department2);
        // departments.add(department3);
        // for (int i = 0; i < departments.size(); i++) {
        // if (i == 2) {
        // break;
        // }
        // System.out.println("Thong tin department thu " + (i+1));
        // System.out.println("ID: " + departments.get(i).id);
        // System.out.println("Name: " + departments.get(i).name + "\n");
        // }

        // // Question 13:
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);
        // String departmentname = "";
        // for (int i = 0; i < accounts.size(); i++) {
        // if (i == 1) {
        // continue;
        // }
        // System.out.println("Thong tin account thu " + (i+1));
        // System.out.println("Email: " + accounts.get(i).email);
        // System.out.println("Fullname: " + accounts.get(i).fullName);
        // switch (accounts.get(i).departmentID) {
        // case 1:
        // departmentname = "Sale";
        // break;
        // case 2:
        // departmentname = "Marketing";
        // break;
        // case 3:
        // departmentname = "Security";
        // break;
        // }
        // System.out.println("Department: " + departmentname + "\n");
        // }

        // // Question 14:
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);
        // String departmentname = "";
        // for (int i = 0; i < accounts.size(); i++) {
        // if (i > 2) {
        // break;
        // }
        // System.out.println("Thong tin account thu " + (i+1));
        // System.out.println("Email: " + accounts.get(i).email);
        // System.out.println("Fullname: " + accounts.get(i).fullName);
        // switch (accounts.get(i).departmentID) {
        // case 1:
        // departmentname = "Sale";
        // break;
        // case 2:
        // departmentname = "Marketing";
        // break;
        // case 3:
        // departmentname = "Security";
        // break;
        // }
        // System.out.println("Department: " + departmentname + "\n");
        // }

        // Question 15:
        // for (int i = 0; i < 20; i++) {
        // if (i % 2 == 0) {
        // System.out.print(i + "\t");
        // }
        // }

        // Question 16: While loop

        // Question 10 - While:
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);
        // String departmentname = "";
        // int i = 0;
        // while (i < accounts.size()) {
        // System.out.println("Thong tin account thu " + (i + 1));
        // System.out.println("Email: " + accounts.get(i).email);
        // System.out.println("Fullname: " + accounts.get(i).fullName);
        // switch (accounts.get(i).departmentID) {
        // case 1:
        // departmentname = "Sale";
        // break;
        // case 2:
        // departmentname = "Marketing";
        // break;
        // case 3:
        // departmentname = "Security";
        // break;
        // }
        // System.out.println("Department: " + departmentname + "\n");
        // i ++;
        // }

        // Question 11 - While
        // ArrayList<Department> departments = new ArrayList<Department>();
        // departments.add(department1);
        // departments.add(department2);
        // departments.add(department3);
        // int i = 0;
        // while (i < departments.size()) {
        // System.out.println("Thong tin department thu " + (i + 1));
        // System.out.println("ID: " + departments.get(i).id);
        // System.out.println("Name: " + departments.get(i).name + "\n");
        // i++;
        // }

        // Question 12 - While:
        // ArrayList<Department> departments = new ArrayList<Department>();
        // departments.add(department1);
        // departments.add(department2);
        // departments.add(department3);
        // int i = 0;
        // while (i < 2) {
        // System.out.println("Thong tin department thu " + (i + 1));
        // System.out.println("ID: " + departments.get(i).id);
        // System.out.println("Name: " + departments.get(i).name + "\n");
        // i ++;
        // }

        // // Question 13 - While:
        ArrayList<Account> accounts = new ArrayList<Account>();
        accounts.add(account1);
        accounts.add(account2);
        accounts.add(account3);
        String departmentname = "";
        int i = 0;
        while (i < accounts.size()) {
            if (i == 1) {
                i++;
            } else {
                System.out.println("Thong tin account thu " + (i + 1));
                System.out.println("Email: " + accounts.get(i).email);
                System.out.println("Fullname: " + accounts.get(i).fullName);
                switch (accounts.get(i).departmentID) {
                    case 1:
                        departmentname = "Sale";
                        break;
                    case 2:
                        departmentname = "Marketing";
                        break;
                    case 3:
                        departmentname = "Security";
                        break;
                }
                System.out.println("Department: " + departmentname + "\n");
            }
            i++;
        }

        // // Question 14:
        // ArrayList<Account> accounts = new ArrayList<Account>();
        // accounts.add(account1);
        // accounts.add(account2);
        // accounts.add(account3);
        // String departmentname = "";
        // for (int i = 0; i < accounts.size(); i++) {
        // if (i > 2) {
        // break;
        // }
        // System.out.println("Thong tin account thu " + (i+1));
        // System.out.println("Email: " + accounts.get(i).email);
        // System.out.println("Fullname: " + accounts.get(i).fullName);
        // switch (accounts.get(i).departmentID) {
        // case 1:
        // departmentname = "Sale";
        // break;
        // case 2:
        // departmentname = "Marketing";
        // break;
        // case 3:
        // departmentname = "Security";
        // break;
        // }
        // System.out.println("Department: " + departmentname + "\n");
        // }

        // Question 15:
        // for (int i = 0; i < 20; i++) {
        // if (i % 2 == 0) {
        // System.out.print(i + "\t");
        // }
        // }
    }
}
