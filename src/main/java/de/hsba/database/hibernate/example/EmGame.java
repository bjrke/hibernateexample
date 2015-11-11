package de.hsba.database.hibernate.example;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by bjrke on 11.11.15.
 */
@Entity
@Table(name = "em_quali")
public class EmGame {

    public static final String DATE = "_date";
    public static final String ID = "_id";
    public static final String HOME_TEAM = "_homeTeam";
    public static final String HOME_GOALS = "_homeGoals";
    public static final String VISITOR_TEAM = "_visitorTeam";
    public static final String VISITOR_GOALS = "_visitorGoals";

    @Id
    @Column(name = "id")
    private long _id;

    @Column(name = "game_date")
    private Date _date;

    @Column(name = "home_team")
    private String _homeTeam;

    @Column(name = "home_goals")
    private int _homeGoals;

    @Column(name = "visitor_team")
    private String _visitorTeam;

    @Column(name = "visitor_goals")
    private int _visitorGoals;

    public long getId() {
        return _id;
    }

    public Date getDate() {
        return _date;
    }

    public String getHomeTeam() {
        return _homeTeam;
    }

    public int getHomeGoals() {
        return _homeGoals;
    }

    public String getVisitorTeam() {
        return _visitorTeam;
    }

    public int getVisitorGoals() {
        return _visitorGoals;
    }

    @Override
    public String toString() {
        return _homeTeam + " " + _homeGoals + " : " + _visitorGoals + " " + _visitorTeam + " at " +_date;
    }
}
