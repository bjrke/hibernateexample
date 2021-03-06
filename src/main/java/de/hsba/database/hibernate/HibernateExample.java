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
public class HibernateExample {

    private static SessionFactory sessionFactory() {
        return new Configuration()
                .setProperty("hibernate.connection.url", Config.JDBC_URL)
                .setProperty("hibernate.connection.username", Config.JDBC_USER)
                .setProperty("hibernate.connection.password", Config.JDBC_PASSWORD)
                .setProperty("dialect", ProgressDialect.class.getCanonicalName())
                .setProperty("show_sql", "true")
                .addAnnotatedClass(EmGame.class)
                .addAnnotatedClass(EmTeam.class)
                .buildSessionFactory();
    }

    public static void main(String... args) {
        try (SessionFactory sessionFactory = sessionFactory()) {
            try (Session session = sessionFactory.openSession()) {
                Transaction tx = null;
                try {
                    tx = session.beginTransaction();

                    // nach Id selektieren
                    System.out.println("by id example:" + session.get(EmGame.class, new Long(1)));

                    // mit criteria api
                    System.out.println("criteria example: ");

                    List<EmGame> games = session.createCriteria(EmGame.class)
                            .add(Restrictions.or(
                                    Restrictions.eq(EmGame.HOME_TEAM, "Deutschland"),
                                    Restrictions.eq(EmGame.VISITOR_TEAM, "Deutschland")))
                            .addOrder(Order.asc(EmGame.DATE))
                            .list();
                    for ( EmGame game :games) {
                        System.out.println(game);
                    }

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
                } catch ( RuntimeException e ) {
                    if ( tx != null ) {
                        tx.rollback();
                    }
                }
            }
        }

    }
}