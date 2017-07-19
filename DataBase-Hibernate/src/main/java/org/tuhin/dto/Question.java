/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.dto;

import javax.persistence.Embeddable;

/**
 *
 * @author Joker
 */
@Embeddable
public class Question {

    private int questionNumber;
    private float questionMarking;
//    private int questionId;

    public Question() {
    }

    public Question(int questionNumber, int questionMarking) {
        this.questionNumber = questionNumber;
        this.questionMarking = questionMarking;
    }

    public int getQuestionNumber() {
        return questionNumber;
    }

    public void setQuestionNumber(int questionNumber) {
        this.questionNumber = questionNumber;
    }

    public float getQuestionMarking() {
        return questionMarking;
    }

    public void setQuestionMarking(float questionMarking) {
        this.questionMarking = questionMarking;
    }
    

}
