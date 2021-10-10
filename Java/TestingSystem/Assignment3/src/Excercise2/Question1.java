package Excercise2;

import java.util.ArrayList;
import java.util.Date;

public class Question1 {
    public static void main(String[] args) {
        Date date = new Date();
        ArrayList<Account> listOfAccounts = new ArrayList<Account>();
        Account account = new Account();
        for (int i = 0; i < 5; i++) {
            account.email = "Email " + i;
            account.userName = "User name " + i;
            account.fullName = "Full name " + i;
            account.createDate = date;
            listOfAccounts.add(account);
        }
        for (Account accounts : listOfAccounts) {
            System.out.println("Account email: " + account.email);
            System.out.println("Account userName: " + account.userName);
            System.out.println("Account fullName: " + account.fullName);
            System.out.println("Account createDate: " + account.createDate);
        }
    }
}