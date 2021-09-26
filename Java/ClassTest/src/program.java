import java.util.Date;

public class program {
    public static void main(String[] args) {

        Department department1 = new Department();
        department1.id = 1;
        department1.name = "Sale";

        Department department2 = new Department();
        department2.id = 2;
        department2.name = "Marketing";

        // Create groups
        Group group1 = new Group();
        group1.id = 1;
        group1.name = "Java Fresher";

        Group group2 = new Group();
        group2.id = 2;
        group2.name = "C# Fresher";

        // Create Account

        Account account1 = new Account();
        account1.id = 1;
        account1.Email = "nguyenvana@gmail.com";
        account1.department = department1;
        Group[] groupOfAccount1 = { group1, group2 };
        account1.groups = groupOfAccount1;

        account1.createDate = new Date("2020/04/22");
        account1.gender = Gender.MALE;

    }
}
