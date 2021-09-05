import java.sql.*;

public class DatabaseConnection {
    public static void main(String[] args) {
        Connection myConnection = null;
        Statement myStatement = null;
        ResultSet myResultSet = null;

        String dbUrl = "jdbc:mysql://localhost:3306/testingsystem";
        String username = "root";
        String pass = "ChinChin0505";

        try {
            // 1. Get a connection to the database
            myConnection = DriverManager.getConnection(dbUrl, username, pass);

            // 2. Create a statement
            myStatement = myConnection.createStatement();

            // 3.1. Execute SQL query
            myResultSet = myStatement.executeQuery("select * from account");
            
            // 3.2. Inserting a new value
            int rowsAffected = myStatement
                    .executeUpdate("insert into department" + "(DepartmentName)" + "values" + "('Undefined')");
            // Similar use with Update, Delete, use .executeUpdate instead 
            
            
            // 4. Process the result set
            while (myResultSet.next()) {
                System.out.println(myResultSet.getString("AccountID") + "," + myResultSet.getString("Username"));
            }
        } catch (SQLException e) {
            System.out.println("Querry Error");
        } finally {
            System.out.println("Querry Completed");
        }
        ;

    }
}
