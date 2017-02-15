/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package other;

import java.sql.ResultSet;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
import static other.DBConfig.db;
import static other.DBConfig.stmt;


/**
 *
 * @author TUHIN
 */
public class Course {

    public static void main(String[] args) {

        //System.out.println(retEmail("tuhin"));
        System.err.println(retPassword("tuhintowhidul9@gmail.com"));
        /*ArrayList<String> list = semesterCourse("1-1");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }*/
//        addTakenCourse("teacherName", "1-2", "key", "courseName");
    }
    
    public static String arrayListToString(ArrayList<String> list) {

        JSONArray jsonDataArray = new JSONArray();

        for (int i = 0; i < list.size(); i++) {
            JSONObject jsonData = new JSONObject();
            jsonData.put(i + "", list.get(i));
            jsonDataArray.put(jsonData);

        }
        return jsonDataArray.toString();
    }

    /*
      courselist for student and teacher
     */
    public static ArrayList<String> semesterCourse(String semeseter) {

        //System.out.println(userName + passWord + tableName);
        ArrayList<String> course_list = new ArrayList<>();
        try {

            db.start();
            String sql = String.format("select DISTINCT Course_Name from review.course where semester='%s'", semeseter);
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                course_list.add(rs.getString("Course_Name"));

            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.semesterCourse()");
        }

        return course_list;
    }

    /*
    teacher's taken course
     */
    public static void addTakenCourse(String teacherName, String semester, String key, String courseName) {

        try {
            db.start();
            String sql = String.format("INSERT INTO review.runningcourse VALUES ('%s','%s','%s','%s')", semester, teacherName, courseName, key);
            // System.err.println(sql);
            stmt.executeUpdate(sql);
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.addTakenCourse()");
        }
    }

    /* check the key */
    public static boolean checkCourseKey(String courseName, String key) {

        try {

            db.start();
            String sql = String.format("select Course_Key from review.runningcourse where Course_Name='%s'", courseName);
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                if (rs.getString("Course_Key").equals(key)) {
                    return true;
                }
            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.checkCourseKey()");
        }

        return false;
    }

    /*
    mail the forgotten password
     */
    public static String retPassword(String userName) {
        try {

            db.start();
            String sql = String.format("select password from review.teacher  where user='%s' or gmail='%s'", userName, userName);
//            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                return rs.getString("password");
            }
            sql = String.format("select password from review.student  where user='%s' or gmail='%s'", userName, userName);

//            System.out.println(sql);
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                return rs.getString("password");
            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.retPassword()");
        }
        return null;
    }

    public static String retEmail(String userName) {
        try {

            db.start();
            String sql = String.format("select gmail from review.teacher  where user='%s' or gmail='%s'", userName, userName);
            System.out.println(sql);
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                return rs.getString("gmail");
            }
            sql = String.format("select gmail from review.student  where user='%s' or gmail='%s'", userName, userName);

            System.out.println(sql);
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                return rs.getString("gmail");
            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.retEmail()");
        }
        return null;
    }

    /*
    get departments name
     */
    public static ArrayList<String> allDepartments() {
        ArrayList<String> course_list = new ArrayList<>();
        try {

            db.start();
            String sql = String.format("select DISTINCT Department from review.course");
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                course_list.add(rs.getString("Department"));

            }
            rs.close();
            db.close();
        } catch (Exception ex) {
            System.out.println("other.Course.allDepartments()");
        }

        return course_list;
    }
}
