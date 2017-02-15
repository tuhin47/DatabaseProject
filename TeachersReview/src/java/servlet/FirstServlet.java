/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import other.Course;
import other.LoginClass;
import other.SignUp;
import mail.SendMail;

/**
 *
 * @author TUHIN
 */
public class FirstServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param respons ,m e servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        PrintWriter out = response.getWriter();
        System.err.println(request.getParameter("tag"));
        if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("login")) {
            tagLogin(request, response);
        } else if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("register")) {
            //System.err.println("kala");
            tagRegister(request, response);
        } else if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("sendmail")) {
            
            tagSendMail(request, response);
        } else if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("course")) {
            
            tagCourse(request, response);
        }
    }
    
    private static void tagLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        PrintWriter out = response.getWriter();
        if (LoginClass.loginData(request.getParameter("username"),
                request.getParameter("password"),
                request.getParameter("userType"))) {

//                request.setParameter("name", "value");
            if (isDevicePC(request)) {
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
            out.print("Login successful");
//            out.print(request.getParameter("name"));

        } else {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "login failed");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            
            out.print("login failed");
            
        }
        
    }
    
    public static void tagRegister(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        
        if (SignUp.addUser(request.getParameter("username"), request.getParameter("password"),
                request.getParameter("dept"), request.getParameter("userType"), request.getParameter("email"))) {
            if (isDevicePC(request)) {
                request.getRequestDispatcher("studentwelcome.jsp").forward(request, response);
            }
            out.print("resigter successful");
        } else {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "register failed");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
            
            out.print("register failed");
        }
    }
    
    public static boolean isDevicePC(HttpServletRequest request) {
        if (request.getParameterMap().containsKey("device") && request.getParameter("device").equals("PC")) {
            return true;
        }
        return false;
    }
    
    private void tagSendMail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter();
        String user = request.getParameter("email");
        String email = Course.retEmail(user);
        
        if (email != null) {
            String pass = Course.retPassword(user);
            SendMail.sendMail(email, pass);
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "successful");
                request.getRequestDispatcher("sendmail.jsp").forward(request, response);
            }
            
        } else //out.print("Failed");
        {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "failed");
                request.getRequestDispatcher("sendmail.jsp").forward(request, response);
            }
        }
        
    }
    
    private void tagCourse(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        PrintWriter out = response.getWriter();
        ArrayList<String> list = Course.semesterCourse(request.getParameter("semester"));
        if (!isDevicePC(request)) {
            out.println(Course.arrayListToString(list));
        }
        
    }
    
}
