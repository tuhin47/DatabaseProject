
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author TUHIN
 */
public class DBConfig {

    private String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    private String DB_URL = "jdbc:mysql://localhost:3306";

    //  Database credentials
    private String USER = "root";
    private String PASS = "";
//    private String DBNAME="review";
    
    public static Connection conn = null;
    public static Statement stmt = null;

    public DBConfig() {
        
        try {
            //STEP 2: Register JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            // Open a connection
            conn = DriverManager.getConnection(DB_URL,USER, PASS);

            // Execute SQL query
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
        } catch (Exception ex) {
            System.out.println("DBConfig.<init>() "+ex);
        }

    }

}
