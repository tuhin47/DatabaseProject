package org.tuhin.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.Session;
import org.tuhin.controller.LoginService;
import org.tuhin.hibernate.HibernateUtil;


@Entity
public class UserDetails {
	@Id
	private String userName;
	private String firstName;
	private String lastName;
	private String userType;
	private String password;
	private String email;
	private String department;

	public static void main(String[] args) {

		Session session = HibernateUtil.getSessionFactory().openSession();

		session.beginTransaction();
		UserDetails user=new UserDetails("A", "B", "C", "teacher", "A", "F", "g");
		session.saveOrUpdate(user);
		
		session.getTransaction().commit();
		session.close();
		
		System.out.println(new LoginService().authenticateUser("A", "A", "teacher"));
	}

	public UserDetails(){}
	public UserDetails(String userName, String firstName, String lastName, String userType, String password,
			String email, String department) {
		super();
		this.userName = userName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userType = userType;
		this.password = password;
		this.email = email;
		this.department = department;
	}

	public String getUserName() {
		return userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getUserType() {
		return userType;
	}

	public String getPassword() {
		return password;
	}

	public String getEmail() {
		return email;
	}

	public String getDepartment() {
		return department;
	}

}
