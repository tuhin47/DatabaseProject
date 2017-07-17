/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.tuhin.controller.CourseKey;
import org.tuhin.dto.SetKey;

/**
 *
 * @author Joker
 */
public class CourseComponent extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        System.out.println("org.tuhin.servlet.CourseComponent.doPost()");
        System.out.println(request.getParameter("tag"));
        if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("setKey")) {
            String courseCode = request.getParameter("courseCode");
            String department = request.getParameter("department");
            String semester = request.getParameter("semester");
            String courseTitle = request.getParameter("courseName");
            String courseKey = request.getParameter("key");
            String question=request.getParameter("question");
            int questionSetKey=Integer.parseInt(question);
            SetKey key = new SetKey(courseCode, department, semester, courseTitle, courseKey,questionSetKey);
            if (new CourseKey().insertKey(key)) {
                if (isDevicePC(request)) {
                    request.setAttribute("alertMsg", "Successful");
                    request.getRequestDispatcher("set_key.jsp").forward(request, response);
                }
                out.print("inserted");
            }
            else {
            out.print("already exist");
            
            }
            
        }
        
    }
    
    private boolean isDevicePC(HttpServletRequest request) {
        return request.getParameterMap().containsKey("device") && request.getParameter("device").equals("PC");
    }
    
}
