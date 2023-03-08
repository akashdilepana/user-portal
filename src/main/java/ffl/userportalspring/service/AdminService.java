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
 * @author Ridmi
 */
@Service
public class AdminService {

//    public void loadSystems(HttpServletRequest req, HttpServletResponse resp){
//        try (Connection con = db.getConnection()) {
//
//            String ty = req.getParameter("type");
//            if (ty.equals("load")) {
//                PreparedStatement ps = con.prepareStatement("SELECT s.`id`,s.`sname`,s.`description`,s.`icon`,s.`system_type` FROM `systemsave` s WHERE s.`status`='active'");
//                ResultSet rs = ps.executeQuery();
//                JSONArray pics = new JSONArray();
//
//                while (rs.next()) {
//                    JSONObject pic = new JSONObject();
//                    pic.put("id", rs.getString(1));
//                    pic.put("sname", rs.getString(2));
//                    pic.put("description", rs.getString(3));
//                    pic.put("icon", rs.getString(4));
//                    pic.put("type", rs.getString(5));
//
//                    pics.put(pic);
//
//                }
//                resp.getWriter().print(pics.toString());
//
//            } else if (ty.equals("load2")) {
//                HttpSession session = req.getSession();
//                String systemid = req.getParameter("cusId");
//                PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_session`(`request`,`system_id`,`login_user`,`login_date`) VALUES(?,?,(SELECT u.`id` FROM `customer` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
//
//                ps3.setString(1, "enter system");
//                ps3.setString(2, systemid);
//
//                ps3.executeUpdate();
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public String loadSystems(String type, String cusId, HttpSession session) {
        try (Connection con = db.getConnection()) {

            String ty = type;
            if (ty.equals("load")) {
//                PreparedStatement ps = con.prepareStatement("SELECT s.`id`,s.`sname`,s.`description`,s.`icon`,s.`system_type` FROM `systemsave` s WHERE s.`status`='active'");
                PreparedStatement ps = con.prepareStatement("SELECT `sname`,`discription`,`icon`,`id`,`system_type` FROM systems WHERE `status` = 'active' ");

                ResultSet rs = ps.executeQuery();
                JSONArray pics = new JSONArray();

                while (rs.next()) {
                    JSONObject pic = new JSONObject();
                    pic.put("id", rs.getString(1));
                    pic.put("sname", rs.getString(2));
                    pic.put("description", rs.getString(3));
                    pic.put("icon", rs.getString(4));
                    pic.put("type", rs.getString(5));

                    pics.put(pic);

                }
                return pics.toString();

            } else if (ty.equals("load2")) {

                String systemid = cusId;
                PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_session`(`request`,`system_id`,`login_user`,`login_date`) VALUES(?,?,(SELECT u.`id` FROM `customer` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);

                ps3.setString(1, "enter system");
                ps3.setString(2, systemid);

                ps3.executeUpdate();

                return null;
            }

            return null;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
