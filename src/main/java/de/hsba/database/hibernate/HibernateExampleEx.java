package de.hsba.database.hibernate;

import de.hsba.database.common.Config;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.ProgressDialect;

import java.util.Date;
import java.util.List;

/**
 * Created by bjrke on 22.10.15.
 */
public class HibernateExampleEx {

    private static SessionFactory sessionFactory() {
        return new Configuration()
                .setProperty("hibernate.connection.url", Config.JDBC_URL)
                .setProperty("hibernate.connection.username", Config.JDBC_USER)
                .setProperty("hibernate.connection.password", Config.JDBC_PASSWORD)
                .setProperty("dialect", ProgressDialect.class.getCanonicalName())
                .setProperty("show_sql", "true")
                .addAnnotatedClass(EmGameEx.class)
                .addAnnotatedClass(EmTeam.class)
                .buildSessionFactory();
    }

    public static void main(String... args) {
        try (SessionFactory sessionFactory = sessionFactory()) {
            try (Session session = sessionFactory.openSession()) {
                Transaction tx = null;
                try {
                    tx = session.beginTransaction();

                    EmTeam germany =  session.get(EmTeam.class, "Deutschland");

                    // mit criteria api
                    System.out.println("criteria example:");
                    List<EmGameEx> games = session.createCriteria(EmGameEx.class)
                            .add(Restrictions.or(
                                    Restrictions.eq(EmGameEx.HOME_TEAM, germany),
                                    Restrictions.eq(EmGameEx.VISITOR_TEAM, germany)))
                            .addOrder(Order.asc(EmGame.DATE))
                            .list();
                    for ( EmGameEx game : games ) {
                        System.out.println(game);
                    }
                    tx.commit();
                } catch ( RuntimeException e ) {
                    if ( tx != null ) {
                        tx.rollback();
                    }
                }
            }
        }
   }
}