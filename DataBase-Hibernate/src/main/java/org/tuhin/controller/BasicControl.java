package org.tuhin.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Session;
import org.tuhin.dto.ReviewList;
import org.tuhin.hibernate.HibernateUtil;

/**
 *
 * @author Joker
 */
public class BasicControl {

    public static void main(String[] args) {
        System.out.println(isTheReviewListExist("CSEE"));
    }

    public static boolean isKeyValid(String courseCode, String key) {
        String hql = "from SetKey where courseKey='" + key + "' and courseCode='" + courseCode + "'";
        System.out.println(hql);Session session = HibernateUtil.getSession();
        if (session.createQuery(hql).uniqueResult() != null) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }

    public void insert(Object obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.saveOrUpdate(obj);
        session.getTransaction().commit();
        session.close();
    }

    public static List provideList(String name) {
        Session session = HibernateUtil.getSession();
        try {
            return session.createQuery("from " + name).list();
        } finally {
            session.close();
        }
    }

    public static boolean isTheParameterValid(HttpServletRequest request, String parameter) {

        return request.getParameterMap().containsKey(parameter);
    }

    public static boolean isDevicePC(HttpServletRequest request) {
        return request.getParameterMap().containsKey("device") && request.getParameter("device").equals("PC");
    }

    public static boolean isTheReviewExist(String courseCode, String userName) {
        String hql = "from ReviewResult where userName='" + userName + "' and courseCode='" + courseCode + "'";
        System.out.println(hql);

        Session session = HibernateUtil.getSession();
        if (session.createQuery(hql).uniqueResult() != null) {
            session.close();
            return true;
        }
        session.close();
        return false;
    }

    public static ReviewList isTheReviewListExist(String courseCode) {

        String hql = "from ReviewList where courseCode='" + courseCode + "'";
        Session session = HibernateUtil.getSession();
        ReviewList rList = (ReviewList) session.createQuery(hql).uniqueResult();
        session.close();
        return rList;
    }
}
