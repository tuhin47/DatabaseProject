package org.tuhin.hibernate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.orm.hibernate4.HibernateTemplate;

public class HibernateUtil {

    private static final SessionFactory sessionFactory;
    

    static {
        try {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("SessionFactory creation failed" + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
    public static Session getSession(){
        return sessionFactory.openSession();
}

    public static HibernateTemplate getHibernateTemplate() {
        return new HibernateTemplate(sessionFactory);
    }

   
}
