/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.tuhin.controller;

import org.tuhin.dto.SetKey;
import org.tuhin.hibernate.HibernateUtil;

/**
 *
 * @author Joker
 */
public class CourseKey {

    public boolean insertKey(SetKey key) {

        if (isCourseExist(key)) {
            return false;
        }
        new BasicControl().insert(key);
        return true;
    }

//    public static void main(String[] args) {
//        SetKey sk = new SetKey("CSE1111a", "aa", "aa", "aa", "aa");
//        System.out.println(new CourseKey().insertKey(sk));
//
//    }

    private boolean isCourseExist(SetKey key) {
        String hql = String.format("from SetKey where courseCode='%s'", key.getCourseCode());
        System.out.println(hql);
        key=null;
        key = (SetKey) HibernateUtil.getSessionFactory().openSession().createQuery(hql).uniqueResult();
        if ( key!= null) {
            //System.out.println(key.toString());
            return true;
        }
        return false;
    }

}
