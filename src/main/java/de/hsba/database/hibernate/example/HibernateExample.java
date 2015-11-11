package de.hsba.database.hibernate.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.ProgressDialect;

import java.util.Properties;

/**
 * Created by bjrke on 22.10.15.
 */
public class HibernateExample {

    private static SessionFactory sessionFactory() {
        return new Configuration()
                .setProperty("hibernate.connection.url", "jdbc:postgresql://localhost/postgres")
                .setProperty("hibernate.connection.username", "postgres")
                .setProperty("hibernate.connection.password", "1234qwer")
                .setProperty("dialect", ProgressDialect.class.getCanonicalName())
                .addAnnotatedClass(EmGame.class)
                .addAnnotatedClass(EmTeam.class)
                .buildSessionFactory();
    }

    public static void main(String... args) {
        SessionFactory sessionFactory = sessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        System.out.println(session.get(EmGame.class, new Long(1)));

        System.out.println(session
                .createCriteria(EmGame.class)
                .add(Restrictions.or(
                        Restrictions.eq(EmGame.HOME_TEAM,"Deutschland"),
                        Restrictions.eq(EmGame.VISITOR_TEAM,"Deutschland")))
                .addOrder(Order.asc(EmGame.DATE))
                .list());
        // tx.commit();
        session.close();
        sessionFactory.close();
    }
}