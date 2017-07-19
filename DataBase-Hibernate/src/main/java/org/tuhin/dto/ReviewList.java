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

/**
 *
 * @author Joker
 */
@Entity
public class ReviewList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int reviewListId;
    private String courseCode;
    private int reviewNumber;
    private int numberOfQuestion;

    private int questionId = 1;

    @ElementCollection
    @JoinTable(name = "Review_Collection")
    private Collection<Question> reviewCollection = new ArrayList();

    public ReviewList() {
    }

    public int getReviewNumber() {
        return reviewNumber;
    }

    public int getReviewListId() {
        return reviewListId;
    }

    public void setReviewListId(int reviewId) {
        this.reviewListId = reviewId;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public Collection<Question> getReviewCollection() {
        return reviewCollection;
    }

    public void setReviewCollection(Collection<Question> reviewCollection) {
        this.reviewCollection = reviewCollection;

    }

    public void setReviewNumber(int reviewNumber) {
        this.reviewNumber = reviewNumber;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getNumberOfQuestion() {
        return numberOfQuestion;
    }

    public void setNumberOfQuestion(int numberOfQuestion) {
        this.numberOfQuestion = numberOfQuestion;
    }
}
