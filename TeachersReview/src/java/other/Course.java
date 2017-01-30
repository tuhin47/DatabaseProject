/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package other;

import java.sql.ResultSet;
import java.util.ArrayList;
import static other.DBConfig.conn;
import static other.DBConfig.db;
import static other.DBConfig.stmt;

/**
 *
 * @author TUHIN
 */
public class Course {

    public static void main(String[] args) {

        /*ArrayList<String> list = semesterCourse("1-1");
        for (int i = 0; i < list.size(); i++) {
            System.out.println(list.get(i));
        }*/
        addTakenCourse("teacherName", "1-2", "key", "courseName");
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

}
