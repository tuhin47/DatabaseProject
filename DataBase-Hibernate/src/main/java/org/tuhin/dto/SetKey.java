package org.tuhin.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

/**
 *
 * @author Joker
 */
@Entity
public class SetKey {

    public static void main(String[] args) {

    }

    @Id
    private String courseCode;
    private String department;
    private String semester;
    private String courseTitle;
    private String courseKey;
    private int questionSetId;

    public SetKey(String courseCode, String department, String semester, String courseTitle, String courseKey, int questionSetId) {
        this.courseCode = courseCode;
        this.department = department;
        this.semester = semester;
        this.courseTitle = courseTitle;
        this.courseKey = courseKey;
        this.questionSetId = questionSetId;
    }

    public SetKey() {
    }

    public String getCourseKey() {
        return courseKey;
    }

    public String getDepartment() {
        return department;
    }

    public String getSemester() {
        return semester;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public int getQuestionSetId() {
        return questionSetId;
    }
}
