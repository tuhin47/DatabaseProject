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

/**
 *
 * @author Joker
 */
@Entity
public class ReviewList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int reviewId;
    private String userName;
    private String courseCode;
    private int questionId = 1;

    @ElementCollection
    private Collection<Integer> reviewCollection = new ArrayList();

    public ReviewList() {
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
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

    public Collection<Integer> getReviewCollection() {
        return reviewCollection;
    }

    public void setReviewCollection(Collection<Integer> reviewCollection) {
        this.reviewCollection = reviewCollection;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

}
