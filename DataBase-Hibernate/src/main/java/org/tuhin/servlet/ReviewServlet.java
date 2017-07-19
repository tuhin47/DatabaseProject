/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.tuhin.controller.BasicControl;
import org.tuhin.dto.Question;
import org.tuhin.dto.ReviewList;
import org.tuhin.dto.ReviewResult;

/**
 *
 * @author Joker
 */
public class ReviewServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getParameter("tag"));
        if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("review")) {
            if (BasicControl.isDevicePC(request)) {
                tagReviewPC(request, response);
            } else {
                tagReview(request, response);
            }
        }

    }

    private void tagReviewPC(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //UserDetails user= (UserDetails) request.getAttribute("user");
        PrintWriter out = response.getWriter();
        String courseCode = request.getParameter("courseCode");
        String userName = request.getParameter("userName");

        if (BasicControl.isTheReviewExist(courseCode, userName)) {
            out.print("Review Already Given");
            return;
        }

        ReviewResult result = new ReviewResult(courseCode, userName);
        int i = 1;
        String ques = "q1";
        while (BasicControl.isTheParameterValid(request, ques)) {

            result.getMarking().add(new Question(i, Integer.parseInt(request.getParameter(ques))));
            i++;
            ques = "q" + i;
        }
        result.setNumOfQues(i - 1);
        new BasicControl().insert(result);
        insertIntoReviewList(result);
        out.print("Review Done");

    }

    private void tagReview(HttpServletRequest request, HttpServletResponse response) throws IOException {
        tagReviewPC(request, response);
    }

    private void insertIntoReviewList(ReviewResult result) {

        ReviewList rList = BasicControl.isTheReviewListExist(result.getCourseCode());
        if (rList == null) {
            rList = new ReviewList();
            rList.setCourseCode(result.getCourseCode());
            rList.setReviewCollection(result.getMarking());
            rList.setNumberOfQuestion(result.getNumOfQues());

            rList.setReviewNumber(1);
        } else {
            Collection<Question> data = new ArrayList<Question>(), previousData = rList.getReviewCollection();
            Collection<Question> rCollection = result.getMarking();
            int totalQuestion = rList.getReviewNumber();
            for (Question q : previousData) {
                Question temp = new Question();
                for (Question r : rCollection) {
//                    System.out.println(q.getQuestionNumber()+"  "+r.getQuestionNumber());
                    if (q.getQuestionNumber() == r.getQuestionNumber()) {
                        temp.setQuestionNumber(q.getQuestionNumber());
//                        System.out.println(q.getQuestionMarking()+" "+totalQuestion+" "+r.getQuestionMarking());
                        float sum = q.getQuestionMarking() * totalQuestion + r.getQuestionMarking();
                        sum /= (totalQuestion + 1);
                        temp.setQuestionMarking(sum);
                        data.add(temp);
//                        System.out.println(data.size());
                        break;
                    }

                }

                rList.setReviewCollection(data);
                rList.setReviewNumber(totalQuestion+1);
            }

        }
//        System.out.println(rList.getReviewCollection().size());
        new BasicControl().insert(rList);
    }

}
