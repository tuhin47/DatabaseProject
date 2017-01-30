package other;

import java.sql.ResultSet;
import static other.DBConfig.db;
import static other.DBConfig.stmt;

/**
 *
 * @author TUHIN
 */
public class LoginClass {

    public static void main(String[] args) {
        System.out.println(loginData("2222", "1111", "student"));
    }

    /*
    login for student and teacher
     */
    public static boolean loginData(String userName, String passWord, String tableName) {

        //System.out.println(userName + passWord + tableName);
        try {

            db.start();
            String sql = String.format("select * from review.%s", tableName);
            ResultSet rs = stmt.executeQuery(sql);

//            conn.setAutoCommit(false);
            // Extract data from result set
            while (rs.next()) {

                // out.println("DONE");
                String checkuser = rs.getString("user");
                String checkpass = rs.getString("password");

                if (checkuser.equals(userName) && checkpass.equals(passWord)) {
                    System.out.println("login succesful");
                    return true;
                }

            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.LoginClass.loginData()");
        }

        return false;
    }

}
