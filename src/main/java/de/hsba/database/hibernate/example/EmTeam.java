package de.hsba.database.hibernate.example;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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

}
