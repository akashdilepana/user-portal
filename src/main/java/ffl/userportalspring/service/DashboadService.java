/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

/**
 *
 * @author Akash
 */
@Service
public class DashboadService {

    public String loadSystems(HttpServletRequest req, HttpServletResponse resp) {

        try (Connection con = db.getConnection();) {
            
            HttpSession session = req.getSession();

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Home Page");

            ps3.executeUpdate();

//            PreparedStatement ps = con.prepareStatement("SELECT `sname`,`discription`,`icon`,`id` FROM `systems` s WHERE `id` IN (SELECT `system` FROM `user_access` WHERE `user_type`=(SELECT `user_type` FROM `create_users` WHERE `username`='session.getAttribute(\"user\")'))");
            PreparedStatement ps = con.prepareStatement("SELECT `sname`,`discription`,`icon`,`id`,`system_type` FROM systems WHERE `status` = 'active' AND id IN (SELECT `system` FROM `user_access` WHERE `user_type`=?)");
            // System.out.println(ps);
            ps.setString(1, req.getSession().getAttribute("utype").toString());
            ResultSet rs = ps.executeQuery();
            JSONArray navs = new JSONArray();
            while (rs.next()) {
                JSONObject nav = new JSONObject();
                nav.put("sname", rs.getString(1));
                nav.put("discription", rs.getString(2));
                nav.put("icon", rs.getString(3));
                nav.put("id", rs.getString(4));
                nav.put("type", rs.getString(5));

                navs.put(nav);

            }
            resp.getWriter().print(navs.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


//    return null;

//    public String loadSystems(String utype) {
//
//        try (Connection con = db.getConnection();) {
//
////            PreparedStatement ps = con.prepareStatement("SELECT `sname`,`discription`,`icon`,`id` FROM `systems` s WHERE `id` IN (SELECT `system` FROM `user_access` WHERE `user_type`=(SELECT `user_type` FROM `create_users` WHERE `username`='session.getAttribute(\"user\")'))");
//            PreparedStatement ps = con.prepareStatement("SELECT `sname`,`discription`,`icon`,`id`,`system_type` FROM systems WHERE `status` = 'active'");
//            // System.out.println(ps);
////            ps.setString(1, session.utype.toString());
//            ps.setString(1, utype);
//
//            ResultSet rs = ps.executeQuery();
//            JSONArray navs = new JSONArray();
//            while (rs.next()) {
//                JSONObject nav = new JSONObject();
//                nav.put("sname", rs.getString(1));
//                nav.put("discription", rs.getString(2));
//                nav.put("icon", rs.getString(3));
//                nav.put("id", rs.getString(4));
//                nav.put("type", rs.getString(5));
//
//                navs.put(nav);
//
//            }
//            System.out.println(ps);
////            return navs.toString();
//            return navs.toString();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            return null;
//        }
//
//    }
}
