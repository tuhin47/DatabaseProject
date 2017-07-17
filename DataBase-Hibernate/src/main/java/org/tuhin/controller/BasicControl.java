package org.tuhin.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.hibernate.Session;
import org.tuhin.hibernate.HibernateUtil;

/**
 *
 * @author Joker
 */
public class BasicControl {

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

		return request.getParameterMap().containsKey(parameter) ;
	}

}
