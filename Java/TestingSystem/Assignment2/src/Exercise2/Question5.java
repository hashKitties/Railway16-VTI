package Exercise2;

import java.util.Date;

public class Question5 {
    public static void main(String args[]){
        Date date = new Date();
        System.out.printf("%1$td/%1$tm/%1$tY %tHh:%tMp:%tSs",date,date,date);
    }
}