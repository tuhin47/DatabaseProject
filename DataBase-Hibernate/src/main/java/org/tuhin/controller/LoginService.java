package org.tuhin.controller;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.tuhin.dto.UserDetails;
import org.tuhin.hibernate.HibernateUtil;

public class LoginService {

    public UserDetails loginUser;// = new UserDetails("tuh", "sad",
    // "safd", "dsf", "sd", "sdf", "sadf");

    public UserDetails getLoginUser() {
        return loginUser;
    }

    public static void main(String[] args) {
        System.out.println(new LoginService().authenticateUser("A", "A", "A"));

    }

    public boolean authenticateUser(String userName, String password, String userType) {

        UserDetails user = getUserByUserName(userName, userType);
        if (user != null && user.getUserName().equals(userName) && user.getPassword().equals(password)) {
            this.loginUser = user;
            return true;
        } else {
            return false;
        }
    }

    public UserDetails getUserByUserName(String userName, String userType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        UserDetails user = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session
                    .createQuery("from UserDetails where userName='" + userName + "' and userType='" + userType + "'");
            user = (UserDetails) query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return user;
    }

}
