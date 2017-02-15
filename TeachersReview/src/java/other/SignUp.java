/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package other;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import static other.DBConfig.db;
import static other.DBConfig.stmt;

/**
 *
 * @author TUHIN
 */
public class SignUp {

    /*
    check
     */
    public static void main(String[] args) {
        System.out.println(addUser("42f1", "420", "420", "teacher","@gmail"));
    }

    /*
    Add student/teacher into table
     */
    public static boolean addUser(String userName, String password, String dept, String tableName,String mail) {

        System.err.println(userName+password+dept+tableName+mail);
        try {
            db.start();
            String sql = String.format("insert into review.%s values('%s','%s','%s','%s')", tableName, userName, password, dept,mail);
           //System.out.println(sql);
            stmt.executeUpdate(sql);
           // System.out.println("data inserted");
            db.close();
        } catch (SQLException ex) {
            System.err.println("other.SignUp.addUser()");
            return false;
        }
        return true;

    }

}
