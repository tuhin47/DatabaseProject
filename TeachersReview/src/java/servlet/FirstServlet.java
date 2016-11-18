/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import other.DBConfig;
import static other.DBConfig.stmt;
import other.LoginClass;

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
        if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("login")) {
            if (LoginClass.loginData(request.getParameter("username"),
                    request.getParameter("password"),
                    request.getParameter("userType"))) {

//                request.setParameter("name", "value");
                if (isDevicePC(request)) {
                    request.getRequestDispatcher("studentwelcome.jsp").forward(request, response);
                }
                out.print("Login successful");
                out.print(request.getParameter("name"));

            } else {
                if (isDevicePC(request)) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

                out.print("login failed");
            }
        }
    }

 

    public static boolean isDevicePC(HttpServletRequest request) {
        if (request.getParameterMap().containsKey("device") && request.getParameter("device").equals("PC")) {
            return true;
        }
        return false;
    }

}
