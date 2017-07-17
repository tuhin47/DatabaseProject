package org.tuhin.controller;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.tuhin.dto.UserDetails;
import org.tuhin.hibernate.HibernateUtil;

public class SignUp {

	public static void main(String[] args) {

	}

	public boolean addUser(String userName, String firstName, String lastName, String userType, String password,
			String email, String department) {
		UserDetails user = new UserDetails(userName, firstName, lastName, userType, password, email, department);
		if (isUserExists(user))
			return false;
		new BasicControl().insert(user);
		return true;
	}

	private boolean isUserExists(UserDetails user) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		boolean result = false;
		Transaction tx = null;
		try {
			tx = session.getTransaction();
			tx.begin();
			Query query = session.createQuery("from UserDetails where userName='" + user.getUserName() + "'");
			UserDetails u = (UserDetails) query.uniqueResult();
			tx.commit();
			if (u != null)
				result = true;
		} catch (Exception ex) {
			System.out.println("SignUp.isUserExists()");
		} finally {
			session.close();
		}
		return result;
	}
}
