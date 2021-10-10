
package Exercise2;

import Exercise1.*;

import java.util.Date;

public class Question6 {
    public static void main(String[] args) {
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

        System.out.printf("|%10s%-5s||%15s%-5s||%15s%-5s|\n","Email","","Fullname","","Department","");
        System.out.printf("|%10s%-1s||%15s%-5s||%15s%-5s|\n",account1.email,"",account1.fullName,"",account1.departmentID,"");
        System.out.printf("|%10s%-1s||%15s%-5s||%15s%-5s|\n",account2.email,"",account2.fullName,"",account2.departmentID,"");
        System.out.printf("|%10s%-1s||%15s%-5s||%15s%-5s|\n",account3.email,"",account3.fullName,"",account3.departmentID,"");

    }
}