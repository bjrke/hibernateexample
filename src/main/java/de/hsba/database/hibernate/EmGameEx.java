package de.hsba.database.hibernate;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by bjrke on 11.11.15.
 */
@Entity
@Table(name = "em_quali")
public class EmGameEx {

    public static final String DATE = "_date";
    public static final String ID = "_id";
    public static final String HOME_TEAM = "_homeTeam";
    public static final String HOME_GOALS = "_homeGoals";
    public static final String VISITOR_TEAM = "_visitorTeam";
    public static final String VISITOR_GOALS = "_visitorGoals";

    @Id
    @Column(name = "id")
    @SequenceGenerator(name="em_quali_pkey",sequenceName="em_quali_seq", allocationSize=0 )
    @GeneratedValue(strategy=GenerationType.SEQUENCE,generator="em_quali_pkey")
    private long _id;

    @Column(name = "game_date")
    private Date _date;

    @ManyToOne
    @JoinColumn(name = "home_team")
    private EmTeam _homeTeam;

    @Column(name = "home_goals")
    private int _homeGoals;

    @ManyToOne
    @JoinColumn(name = "visitor_team")
    private EmTeam _visitorTeam;

    @Column(name = "visitor_goals")
    private int _visitorGoals;

    public long getId() {
        return _id;
    }

    public Date getDate() {
        return _date;
    }

    public EmTeam getHomeTeam() {
        return _homeTeam;
    }

    public int getHomeGoals() {
        return _homeGoals;
    }

    public EmTeam getVisitorTeam() {
        return _visitorTeam;
    }

    public int getVisitorGoals() {
        return _visitorGoals;
    }

    public void setDate(final Date date) {
        _date = date;
    }

    public void setHomeTeam(final EmTeam homeTeam) {
        _homeTeam = homeTeam;
    }

    public void setHomeGoals(final int homeGoals) {
        _homeGoals = homeGoals;
    }

    public void setVisitorTeam(final EmTeam visitorTeam) {
        _visitorTeam = visitorTeam;
    }

    public void setVisitorGoals(final int visitorGoals) {
        _visitorGoals = visitorGoals;
    }

    @Override
    public String toString() {
        return "Spiel " + _id + ": " + _homeTeam + " " + _homeGoals + " : " + _visitorGoals + " " + _visitorTeam + " at " +_date;
    }
}
