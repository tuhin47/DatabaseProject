/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.dto;

import java.util.ArrayList;
import java.util.Collection;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import org.hibernate.annotations.GeneratorType;
import org.tuhin.hibernate.HibernateUtil;

/**
 *
 * @author Joker
 */
@Entity
public class ReviewResult {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int reviewId;
    private String courseCode;
    private String userName;
    private int numOfQues;

    @ElementCollection
    @JoinTable(name = "Marking")
    private Collection<Question> marking = new ArrayList<Question>();

    public ReviewResult(String courseCode, String userName) {
        this.courseCode = courseCode;
        this.userName = userName;
    }
    public ReviewResult() {
    }

    public void setNumOfQues(int numOfQues) {
        this.numOfQues = numOfQues;
    }


    

    public Collection<Question> getMarking() {
        return marking;
    }

    public void setMarking(Collection<Question> marking) {
        this.marking = marking;
        
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    
    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getNumOfQues() {
        return numOfQues;
    }

}
