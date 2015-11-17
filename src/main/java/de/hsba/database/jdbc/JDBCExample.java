package de.hsba.database.jdbc;

import de.hsba.database.common.Config;
import org.apache.log4j.Logger;

import java.sql.*;

/**
 * Created by bjrke on 17.11.15.
 */
public class JDBCExample {

    private static final Logger LOG = Logger.getLogger(JDBCExample.class);


    public static void main(String[] args) {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException(e);
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = DriverManager.getConnection(Config.JDBC_URL, Config.JDBC_USER, Config.JDBC_PASSWORD);


            stmt = conn.prepareStatement("SELECT * FROM em_quali WHERE home_team = ? OR visitor_team = ? ORDER BY game_date ASC");

            stmt.setString(1, "Deutschland");
            stmt.setString(2, "Deutschland");

            final ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                System.out.println("Spiel " + rs.getLong("id") + ": " + rs.getString("home_team") + " " + rs.getInt("home_goals") + " : " + rs.getInt("visitor_goals") + " " + rs.getString("visitor_team") + " at " + rs.getDate("game_date"));
            }
            rs.close();
        } catch (SQLException e) {
            LOG.error(e);
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
            }
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
        System.out.println("Goodbye!");
    }

}
