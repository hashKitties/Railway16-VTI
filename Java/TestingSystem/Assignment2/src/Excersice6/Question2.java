package Excersice6;
import Exercise1.*;

import java.util.ArrayList;
import java.util.Scanner;

import static Excercise5.InputFromConsole.taoAccount;

public class Question2 {

    public static void getAllAccountInformation(ArrayList<Account> listAccounts) {
        for (Account account:listAccounts) {
            System.out.println("Account ID la: " + account.id);
            System.out.println("Account email la: " + account.email);
            System.out.println("Account username la: " + account.username);
            System.out.println("Account fullname la: " + account.fullName);
            System.out.println("Account departmentID la: " + account.departmentID);
            System.out.println("Account positionID la: " + account.positionID);
            System.out.println("Account createDate la: " + account.createDate);

        }
    }

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        ArrayList<Account> listAccounts = new ArrayList<Account>();
        ArrayList<GroupAccount> listGroupAccounts = new ArrayList<GroupAccount>();
        listAccounts.add(taoAccount(scan));
        listAccounts.add(taoAccount(scan));
        listAccounts.add(taoAccount(scan));
        getAllAccountInformation(listAccounts);
    }
}