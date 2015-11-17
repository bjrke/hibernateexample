package de.hsba.database.hibernate.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.dialect.ProgressDialect;

import java.util.Date;
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
                .setProperty("show_sql", "true")
                .addAnnotatedClass(EmGame.class)
                .addAnnotatedClass(EmTeam.class)
                .buildSessionFactory();
    }

    public static void main(String... args) {
        SessionFactory sessionFactory = sessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = session.beginTransaction();

        // nach Id selektieren
        System.out.println("by id example:" + session.get(EmGame.class, new Long(1)));

        // mit criteria api
        System.out.println("criteria example: " +
                session.createCriteria(EmGame.class)
                        .add(Restrictions.or(
                                Restrictions.eq(EmGame.HOME_TEAM, "Deutschland"),
                                Restrictions.eq(EmGame.VISITOR_TEAM, "Deutschland")))
                        .addOrder(Order.asc(EmGame.DATE))
                        .list());

        final EmTeam argentina = new EmTeam();
        argentina.setTeamName("Argentinien");
        argentina.setGroupName("X");

        session.save(argentina);
        EmGame g = new EmGame();
        g.setHomeGoals(2);
        g.setHomeTeam("Deutschland");
        g.setVisitorTeam("Argentinien");
        g.setVisitorGoals(4);
        g.setDate(new Date(2014 - 1900, 9 - 1, 3));

        // danach manuell löschen mit DELETE FROM em_quali WHERE visitor_team = 'Argentinien'; DELETE FROM em_team WHERE group_name = 'X';

        session.save(g);
        System.out.println("Id is" + g.getId());
        tx.commit();
        session.close();
        sessionFactory.close();
    }
}