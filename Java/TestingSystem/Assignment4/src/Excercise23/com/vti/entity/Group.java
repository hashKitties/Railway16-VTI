package Excercise23.com.vti.entity;

import java.util.Date;

public class Group {
    private String name;
    private String creator;
    private String[] userNames;
    private Account[] accounts;
    private Date createdDate;

    public Group() {
    }

    public Group(String name, String creator, Account[] accounts, Date createdDate) {
        this.name = name;
        this.creator = creator;
        this.accounts = accounts;
        this.createdDate = createdDate;
    }

    public Group(String name, String creator, String[] userNames, Date createdDate) {
        this.name = name;
        this.creator = creator;
        this.userNames = userNames;
        this.createdDate = createdDate;
        for (String user : userNames) {
            Account account = new Account(user);
        }
    }
}