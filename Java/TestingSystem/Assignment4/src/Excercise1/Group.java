package Excercise1;

import java.util.Date;

public class Group {
    String name;
    String creator;
    String[] userNames;
    Account[] accounts;
    Date createdDate;

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
            Excercise23.com.vti.entity.Account account = new Excercise23.com.vti.entity.Account(user);
        }
    }
}