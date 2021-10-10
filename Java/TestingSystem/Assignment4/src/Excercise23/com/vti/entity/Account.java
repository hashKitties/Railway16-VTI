package Excercise23.com.vti.entity;

import java.util.Date;

public class Account {
    private int id;
    private String firstName;
    private String lastName;
    private String userName;
    private String email;
    private String positione;
    private Date createDate;

    public Account() {
    }

    public Account(String firstName, String lastName, String userName, String email, String positione, int id) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.positione = positione;
        Date date = new Date();
        createDate = date;
    }

    public Account(int id, String firstName, String lastName, String userName, String email, String positione, Date createDate) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userName = userName;
        this.email = email;
        this.positione = positione;
        this.createDate = createDate;
    }

    public Account(String userName) {
        this.userName = userName;
    }
}