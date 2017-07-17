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
import org.tuhin.controller.BasicControl;

/**
 *
 * @author Joker
 */
@Entity
public class QuestionSet {

    public static void main(String[] args) {
        QuestionSet ques = new QuestionSet();
        ques.getQuestionList().add("good");
        ques.getQuestionList().add("bad");
        ques.getQuestionList().add("ugly");
        ques.setTotalNumQuestion(ques.getQuestionList().size());
        new BasicControl().insert(ques);

    }

    public QuestionSet() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int questionSetId;
    private int totalNumQuestion;

    

    @ElementCollection
//    @GenericGenerator(name = "hilo-gen", strategy = "hilo")
//    @CollectionId(columns = @Column(name = "questionId"), generator = "gen", type = @Type(type = "long"))
    @JoinTable(name = "Questions")
    private Collection<String> questionList = new ArrayList<String>();

    public Collection<String> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(Collection<String> questionList) {
        this.questionList = questionList;
    }

    public int getQuestionSetId() {
        return questionSetId;
    }

    public void setQuestionSetId(int questionSetId) {
        this.questionSetId = questionSetId;
    }

    public int getTotalNumQuestion() {
        return totalNumQuestion;
    }

    public void setTotalNumQuestion(int totalNumQuestion) {
        this.totalNumQuestion = totalNumQuestion;
    }
    
      
    
}
