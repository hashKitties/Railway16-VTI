package Exercise2;
import java.text.NumberFormat;
import java.util.Locale;

public class Question2 {
    public static void main(String[] args) {
        int x = 100000000;
        Locale localeEN = new Locale("en", "EN");
        NumberFormat en = NumberFormat.getInstance(localeEN);
        String n =  en.format(x);
        System.out.printf("%s",n);

    }
}
