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

    public void insert(Object obj) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.saveOrUpdate(obj);
        session.getTransaction().commit();
        session.close();
    }

    public List provideList(String name) {
        return HibernateUtil.getSessionFactory().openSession().createQuery("from " + name).list();
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
        if (HibernateUtil.getSessionFactory().openSession().createQuery(hql).uniqueResult() != null) {
            return true;
        }
        return false;
    }

    public static ReviewList isTheReviewListExist(String courseCode) {

        String hql = "from ReviewList where courseCode='" + courseCode + "'";
        ReviewList rList = (ReviewList) HibernateUtil.getSessionFactory().openSession().createQuery(hql).uniqueResult();
        return rList;
    }
}
