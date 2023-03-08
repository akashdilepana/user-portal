/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.DataTable;
import ffl.userportalspring.other.db;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

/**
 *
 * @author Akash
 */
@Service
public class UserLogService {

    public JSONArray loadUsers() {

        try (Connection con = db.getConnection()) {
            ResultSet rs = db.search(con, " SELECT u.`id`,u.`username` FROM `create_users`u ");
            JSONArray ja = new JSONArray();
            while (rs.next()) {
                JSONObject sys = new JSONObject();
                sys.put("id", rs.getString(1));
                sys.put("username", rs.getString(2));
                ja.put(sys);
            }
            return ja;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public JSONObject loadTable(String data,HttpSession session) {

        try (Connection con = db.getConnection();) {

//            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
//            ps3.setString(1, "Viewed User Log ");
//            ps3.executeUpdate();

            JSONObject para = new JSONObject(data);

            int paraCount = 1;
            String userFilter = "";
            if (!para.getString("user").equals("x")) {
                userFilter = " and `user_id`=(select id from `create_users` where username=?) ";
            }

            String fdateFilter = "";
            if (!para.getString("fdate").equals("")){
                fdateFilter = " and date(`date`)>=?";
            }

            String tdateFilter = "";
            if (!para.getString("tdate").equals("")) {
                tdateFilter = " and date(`date`)<=?";
            }

            PreparedStatement ps = con.prepareStatement("SELECT (SELECT `username` FROM `create_users`  WHERE `id`=`user_id`),IF(`activity`='page',(CASE WHEN r.system LIKE '%/system?id=%' THEN CONCAT( 'Viewed System ',(SELECT `sname` FROM `systems` WHERE `id`=SUBSTRING_INDEX(r.system,'?id=',-1))) ELSE  p.`name` END),`activity`),`date` FROM `user_log` r LEFT JOIN `page_names` p ON r.system LIKE CONCAT('%',p.`url`) WHERE 1=1" + userFilter + fdateFilter + tdateFilter);
//            PreparedStatement ps = con.prepareStatement("SELECT (SELECT `username` FROM `create_users`  WHERE `id`=`user`),IF(`activity`='page',(CASE WHEN r.req LIKE '%/system?id=%' THEN CONCAT( 'Viewed System ',(SELECT `sname` FROM `systems` WHERE `id`=SUBSTRING_INDEX(r.req,'?id=',-1))) ELSE  p.`name` END),`activity`),`req`,`date` FROM `user_record` r LEFT JOIN `page_names` p ON r.req LIKE CONCAT('%',p.`url`) WHERE 1=1 " + userFilter + fdateFilter + tdateFilter);

            if (!para.getString("user").equals("x")) {
                ps.setString(paraCount++, para.getString("user"));
            }

            if (!para.getString("fdate").equals("")) {
                ps.setString(paraCount++, para.getString("fdate"));
            }

            if (!para.getString("tdate").equals("")) {
                ps.setString(paraCount++, para.getString("tdate"));
            }

            return DataTable.getData(con, para, ps);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

}
