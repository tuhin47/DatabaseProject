package org.tuhin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.tuhin.controller.LoginService;
import org.tuhin.controller.SignUp;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("main.jsp").forward(request, response);
    }
    

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getParameter("tag"));
        if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("login")) {
            tagLogin(request, response);
        } else if (request.getParameterMap().containsKey("tag") && request.getParameter("tag").equals("register")) {
            tagRegister(request, response);
        }
    }

    private void tagLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        PrintWriter out = response.getWriter();
        LoginService ls=new LoginService();
        if (ls.authenticateUser(request.getParameter("userName"), request.getParameter("password"),
                request.getParameter("userType"))) {

            // request.setParameter("name", "value");
            if (isDevicePC(request)) {
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user", ls.getLoginUser());
                request.getRequestDispatcher("main.jsp").forward(request, response);
            }
            out.print("Login successful");
            // out.print(request.getParameter("name"));

        } else {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "Login Failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            out.print("Login Failed");

        }

    }

    public void tagRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        // userName, firstName, lastName, userType, password, email, department
        if (new SignUp().addUser(request.getParameter("userName"), request.getParameter("firstName"),
                request.getParameter("lastName"), request.getParameter("userType"), request.getParameter("password"),
                request.getParameter("email"), request.getParameter("department"))) {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "Register Successful");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            out.print("Register Successful");
        } else {
            if (isDevicePC(request)) {
                request.setAttribute("alertMsg", "Register Failed");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            out.print("Register Failed");
        }
    }

   private boolean isDevicePC(HttpServletRequest request) {
        return request.getParameterMap().containsKey("device") && request.getParameter("device").equals("PC");
    }

    

}
