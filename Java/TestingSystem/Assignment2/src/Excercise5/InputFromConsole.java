package Excercise5;

import java.util.ArrayList;
import java.util.Random;
import java.util.Scanner;

import Exercise1.*;

public class InputFromConsole {
    public static Account taoAccount(Scanner scan) {
        Account account = new Account();
        System.out.println("Nhap vao AccountID: ");
        account.id = Integer.parseInt(scan.nextLine());
        System.out.println("Nhap vao ho ten: ");
        account.fullName = scan.nextLine();
        System.out.println("Nhap vao username: ");
        account.username = scan.nextLine();
        System.out.println("Nhap vao ma vi tri tu 1 den 4: ");
        account.positionID = Integer.parseInt(scan.nextLine());
        String positionName = "";
        switch (account.positionID) {
            case 1:
                positionName = "Position.Dev";
                break;
            case 2:
                positionName = "Position.Test";
                break;
            case 3:
                positionName = "Position.ScrumMaster";
                break;
            case 4:
                positionName = "Position.PM";
                break;
        }
        System.out.println("Ma nhan vien la " + account.id + " va vi tri la " + positionName);
        return account;
    }

    public static void taoDepartment(Scanner scan) {
        System.out.println("Nhap vao ma phong ban: ");
        int maPhongBan = Integer.parseInt(scan.nextLine());
        System.out.println("Nhap vao ten phong ban: ");
        String tenPhongBan = scan.nextLine();
        System.out.printf("Ma phong ban vua tao la %d va ten phong ban la %s", maPhongBan, tenPhongBan);
    }

    public static GroupAccount addGroupIntoAccount(ArrayList<Account> listAccounts, Scanner scan) {
        GroupAccount groupAccount = new GroupAccount();
        System.out.println("Danh sach account la:");
        for (Account account : listAccounts) {
            System.out.println("Account ID: " + account.id);
            System.out.println("Account full name: " + account.fullName);
            System.out.println("Account username: " + account.username);
            System.out.println("Account postion ID: " + account.positionID);
        }
        System.out.println("Nhap vao username lua chon:");
        String userName = scan.nextLine();
        System.out.println("Danh sach group la: ");
        System.out.println("1. Group 1");
        System.out.println("2. Group 2");
        System.out.println("3. Group 3");
        System.out.println("Moi lua chon group:");
        int inputGroupID = Integer.parseInt(scan.nextLine());
        for (Account account : listAccounts) {
            if (account.username.equals(userName)) {
                groupAccount.accountID = account.id;
                groupAccount.groupID = inputGroupID;
            }
        }
        return groupAccount;
    }

    public static GroupAccount addRandomGroupIntoAccount(ArrayList<Account> listAccounts, Scanner scan) {
        GroupAccount groupAccount = new GroupAccount();
        for (Account account : listAccounts) {
            System.out.println("Account ID: " + account.id);
            System.out.println("Account full name: " + account.fullName);
            System.out.println("Account username: " + account.username);
            System.out.println("Account postion ID: " + account.positionID);
        }
        System.out.println("Nhap vao username lua chon:");
        String userName = scan.nextLine();
        Random rdGroup = new Random();
        int inputGroupID = rdGroup.nextInt(3) + 1;
        for (Account account : listAccounts) {
            if (account.username.equals(userName)) {
                groupAccount.accountID = account.id;
                groupAccount.groupID = inputGroupID;
            }
        }
        return groupAccount;
    }

    public static boolean ifExit(Scanner scan) {
        boolean exit = true;
        do {
            System.out.println("Ban co muon thoat chuong trinh khong (Y/N): ");
            String userInput = scan.nextLine();
            if (userInput.equals("Y")) {
                exit = false;
                break;
            } else if (userInput.equals("N")) {
                exit = true;
                break;
            } else {
                continue;
            }

        } while (exit);
        return exit;
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
//        // Question 1:
//        System.out.println("Moi nhap vao so nguyen thu nhat: ");
//        int so1 = Integer.parseInt(scan.nextLine());
//        System.out.println("Moi nhap vao so nguyen thu hai: ");
//        int so2 = Integer.parseInt(scan.nextLine());
//        System.out.println("Moi nhap vao so nguyen thu ba: ");
//        int so3 = Integer.parseInt(scan.nextLine());
//
//        // Question 2:
//        System.out.println("Moi nhap vao so thuc thu nhat: ");
//        float so4 = Float.parseFloat(scan.nextLine());
//        System.out.println("Moi nhap vao so thuc thu hai: ");
//        float so5 = Float.parseFloat(scan.nextLine());
//
//        // Question 3:
//        System.out.println("Moi nhap vao ho cua ban: ");
//        String ho = scan.nextLine();
//        System.out.println("Moi nhap vao ten cua ban: ");
//        String ten = scan.nextLine();
//
//        // Question 4:
//        System.out.println("Moi nhap vao ngay sinh nhat cua ban: ");
//        String ngaySinhNhat = scan.nextLine();
//
//        // Question 5:
//        taoAccount(scan);

        // Question 6:
//        taoDepartment(scan);

        // Question 7:
//        int n;
//
//        do {
//            System.out.println("Nhap vao so chan");
//            n = Integer.parseInt(scan.nextLine());
//        } while (n % 2 != 0);
//
        // Question 8:
//        int userInput;
//        do {
//            System.out.println("Moi ban nhap vao chuc nang muon su dung:");
//            System.out.println("1. Tao account");
//            System.out.println("2. Tao department");
//            System.out.println("0. Thoat");
//            userInput = Integer.parseInt(scan.nextLine());
//            switch (userInput) {
//                case 1:
//                    taoAccount(scan);
//                    break;
//                case 2:
//                    taoDepartment(scan);
//                    break;
//                case 0:
//                    System.out.println("Thoat chuong trinh!");
//                    break;
//            }
//        } while (userInput != 0);

        // Question 9:
        ArrayList<Account> listAccounts = new ArrayList<Account>();
        ArrayList<GroupAccount> listGroupAccounts = new ArrayList<GroupAccount>();
        listAccounts.add(taoAccount(scan));
        listAccounts.add(taoAccount(scan));
        listAccounts.add(taoAccount(scan));
        for (int i = 0; i < listAccounts.size(); i++) {
            listGroupAccounts.add(addGroupIntoAccount(listAccounts, scan));
        }
        for (GroupAccount groupAccount : listGroupAccounts) {
            System.out.println("Account ID: " + groupAccount.accountID + " thuoc Group ID: " + groupAccount.groupID);
        }

        // Question 10:
//        int userInput;
//        boolean exit = true;
//        do {
//            System.out.println("Moi ban nhap vao chuc nang muon su dung:");
//            System.out.println("1. Tao account");
//            System.out.println("2. Tao department");
//            System.out.println("3. Them Group vao Account");
//            System.out.println("0. Thoat");
//            userInput = Integer.parseInt(scan.nextLine());
//            switch (userInput) {
//                case 1:
//                    taoAccount(scan);
//                    exit = ifExit(scan);
//                    break;
//                case 2:
//                    taoDepartment(scan);
//                    exit = ifExit(scan);
//                    break;
//                case 3:
//                    for (int i = 0; i < listAccounts.size(); i++) {
//                        listGroupAccounts.add(addGroupIntoAccount(listAccounts, scan));
//                    }
//                    exit = ifExit(scan);
//                    break;
//                case 0:
//                    System.out.println("Thoat chuong trinh!");
//                    break;
//            }
//        if (!exit){
//                return;
//        }
//        } while (userInput != 0);

//        Question 11:
        int userInput;
        boolean exit = true;
        do {
            System.out.println("Moi ban nhap vao chuc nang muon su dung:");
            System.out.println("1. Tao account");
            System.out.println("2. Tao department");
            System.out.println("3. Them Group vao Account");
            System.out.println("0. Thoat");
            userInput = Integer.parseInt(scan.nextLine());
            switch (userInput) {
                case 1:
                    taoAccount(scan);
                    exit = ifExit(scan);
                    break;
                case 2:
                    taoDepartment(scan);
                    exit = ifExit(scan);
                    break;
                case 3:
                    for (int i = 0; i < listAccounts.size(); i++) {
                        listGroupAccounts.add(addGroupIntoAccount(listAccounts, scan));
                    }
                    exit = ifExit(scan);
                    break;
                case 4:
                    for (int i = 0; i < listAccounts.size(); i++) {
                        listGroupAccounts.add(addRandomGroupIntoAccount(listAccounts, scan));
                    }
                    exit = ifExit(scan);
                    break;
                case 0:
                    System.out.println("Thoat chuong trinh!");
                    break;
            }
            if (!exit) {
                return;
            }
        } while (userInput != 0);
    }
}