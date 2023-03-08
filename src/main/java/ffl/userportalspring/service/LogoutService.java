/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Akash
 */
@Service
public class LogoutService {

    public void logout(HttpServletRequest req, HttpServletResponse resp) {

        try (Connection con = db.getConnection();) {

            HttpSession session = req.getSession();
            session.setMaxInactiveInterval(600);

            PreparedStatement psl = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            
            psl.setString(1, "logout");
            psl.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement("INSERT INTO `user_record`(`activity`,`user`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps2.setString(1, "logout");
            ps2.executeUpdate();

            req.getSession().removeAttribute("user");
            resp.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public RedirectView redirect() {
//        RedirectView redirectView = new RedirectView();
//        redirectView.setUrl("/UserportalSpring/");
//        return redirectView;
//    }
}
