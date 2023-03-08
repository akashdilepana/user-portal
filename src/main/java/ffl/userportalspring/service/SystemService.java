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
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author Akash
 */
@Service
public class SystemService {
    
     public String loadSidebar(@PathVariable String id) {
         
         try (Connection con = db.getConnection();) {

            String qry = "SELECT `id`,`description`,`file`,`path` FROM `documents` u WHERE u.`system_id`='" + id + "' AND u.`status`='active'";

            ResultSet rs = db.search(con, qry);

            JSONObject job = new JSONObject();
            JSONArray ar = new JSONArray();
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString(1));
                jo.put("description", rs.getString(2));
                jo.put("file", rs.getString(3));
                jo.put("path", rs.getString(4));

                ar.put(jo);
            }
            job.put("list", ar);

            PreparedStatement logops = con.prepareStatement("SELECT `system_logo`,`sname`,`discription` FROM `systems` WHERE `id`=?");

            logops.setString(1, id);

            ResultSet rslogo = logops.executeQuery();
            if (rslogo.next()) {
                job.put("logo", rslogo.getString(1));
                job.put("sname", rslogo.getString(2));
                job.put("discription", rslogo.getString(3));
            }

//            resp.getWriter().print(job);
            return job.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
     }
}
