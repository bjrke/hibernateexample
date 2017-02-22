package de.hsba.database.hibernate;

import javax.persistence.*;

/**
 * Created by bjrke on 11.11.15.
 */
@Entity
@Table(name = "em_team")
public class EmTeam {

    public static final String TEAM_NAME = "_teamName";
    public static final String GROUP_NAME = "_groupName";

    @Id
    @Column(name = "team_name")
    private String _teamName;

    @Column(name = "group_name")
    private String _groupName;

    public String getTeamName() {
        return _teamName;
    }

    public void setTeamName(final String teamName) {
        _teamName = teamName;
    }

    public String getGroupName() {
        return _groupName;
    }

    public void setGroupName(final String groupName) {
        _groupName = groupName;
    }

    @Override
    public String toString() {
        return _teamName + "(" + _groupName + ")";
    }
}
