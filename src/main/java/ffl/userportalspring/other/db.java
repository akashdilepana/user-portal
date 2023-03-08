/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.other;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import org.apache.commons.dbcp2.BasicDataSource;

public class db {

    public static final boolean isLive = false;

    private static BasicDataSource ds = new BasicDataSource();

    static {
        if (isLive) {
            ds.setDriverClassName("com.mysql.jdbc.Driver");
            ds.setUrl("jdbc:mysql://intdb.fintrex.lk:3306/userportal?useUnicode=true&characterEncoding=UTF-8");
            ds.setUsername("root");
            ds.setPassword("Mis@-123");
            ds.setMinIdle(100);
            ds.setMaxIdle(1000);
            ds.setMaxOpenPreparedStatements(200);

        } else {
            ds.setDriverClassName("com.mysql.jdbc.Driver");
            ds.setUrl("jdbc:mysql://localhost:3306/userportal?useUnicode=true&characterEncoding=UTF-8");
//            ds.setUrl("jdbc:mysql://intdb.fintrex.test:3306/userportal?useUnicode=true&characterEncoding=UTF-8");
            ds.setUsername("root");
            ds.setPassword("1234");
//            ds.setPassword("Test@-123");
            ds.setMinIdle(100);
            ds.setMaxIdle(1000);
            ds.setMaxOpenPreparedStatements(200);
        }
    }

    public static Connection getConnection() throws Exception {
        return ds.getConnection();
    }

    public static ResultSet search(Connection con, String qry) throws Exception {
        return con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_READ_ONLY).executeQuery(qry);
    }

    public static boolean execute(Connection con, String qry) throws Exception {
        return con.createStatement().execute(qry);
    }

}
