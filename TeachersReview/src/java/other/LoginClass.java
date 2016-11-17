package other;

import java.sql.ResultSet;
import static other.DBConfig.stmt;

/**
 *
 * @author TUHIN
 */
public class LoginClass {

    /*
    login for student and teacher
     */
    public static boolean loginData(String userName, String passWord, String tableName) {

        //System.out.println(userName + passWord + tableName);
        try {
            DBConfig db = new DBConfig();
            String sql = String.format("select * from review.%s", tableName);
            ResultSet rs = stmt.executeQuery(sql);

//            conn.setAutoCommit(false);
            // Extract data from result set
            while (rs.next()) {

                // out.println("DONE");
                String checkuser = rs.getString("reg");
                String checkpass = rs.getString("password");

                if (checkuser.equals(userName) && checkpass.equals(passWord)) {
                    System.out.println("login succesful");
                    return true;
                }

            }
        } catch (Exception ex) {
            System.out.println("servlet.FirstServlet.loginData()");
        }

        return false;
    }

}
