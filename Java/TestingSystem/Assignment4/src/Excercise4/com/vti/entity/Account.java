package Excercise4.com.vti.entity;

public class Account {
    private String id;
    private String name;
    private int balance;

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public int getBalance() {
        return balance;
    }

    public void credit(int i) {
        this.balance -= i;
    }

    public void debit(int i) {
        this.balance += i;
    }

    public void transferTo (Account account, int amount) {
        account.balance += amount;
    }

    public Account(String id, String name, int balance) {
        this.id = id;
        this.name = name;
        this.balance = balance;
    }
}