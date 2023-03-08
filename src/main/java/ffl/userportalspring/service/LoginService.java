/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.ActiveDirectory;
import ffl.userportalspring.other.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.ldap.LdapContext;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

/**
 *
 * @author Ridmi
 */
@Service
public class LoginService {

    public String login(String username, String password, HttpSession session) {

        try (Connection con = db.getConnection();) {

            PreparedStatement ps = con.prepareStatement("select * from `create_users`  where username=? and `status`='active'");
            ps.setString(1, username);

            System.out.println(ps);

            ResultSet rs = ps.executeQuery();

            if (!rs.next()) {
                return "ok";
            } //
            if (db.isLive) {
                LdapContext ctx = ActiveDirectory.getConnection(username, password, "regalfs.regalfinance.com");
                ActiveDirectory.User Ad_user = ActiveDirectory.getUser(username, ctx);
                Ad_user.getCommonName();
                System.out.println(Ad_user.getCommonName());
            } else {
                if (!password.equals("123")) {
                    return "no";
                }
            }

            session.setAttribute("user", username);
            session.setAttribute("uid", rs.getString("id"));
            session.setAttribute("utype", rs.getString("user_type"));

            PreparedStatement ps2 = con.prepareStatement("INSERT INTO `user_record`(`activity`,`user`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps2.setString(1, "login");
            ps2.executeUpdate();
            
            
            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps3.setString(1, "login");
            ps3.executeUpdate();


            return "ok";
        } catch (Exception e) {
            e.printStackTrace();
            return "no";
        }

    }

}
