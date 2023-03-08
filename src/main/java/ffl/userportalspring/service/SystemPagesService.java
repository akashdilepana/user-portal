/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.DataTable;
import ffl.userportalspring.other.db;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

/**
 *
 * @author Akash
 */
@Service
public class SystemPagesService {

    public JSONObject loadTable(String data, HttpSession session) {

        try (Connection con = db.getConnection();) {

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Viwe User Type page");

            ps3.executeUpdate();

            JSONObject para = new JSONObject(data);
            PreparedStatement ps = con.prepareStatement("SELECT `id`,`name`,(SELECT `username` FROM `create_users`  WHERE `id`=`ent_id`),`ent_date`,`status` FROM `user_type` where true");
            return DataTable.getData(con, para, ps);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public String loadPages(String utype) {
        try (Connection con = db.getConnection();) {

            PreparedStatement ps = con.prepareStatement("SELECT s.`id`,s.`sname`,s.`system_type`,IF(a.`system` IS NULL,'NO','YES') AS access FROM `systems` s  LEFT JOIN `user_access` a ON s.`id`=a.`system`  AND a.`user_type`=?  WHERE s.`status`='active'");
            if (utype != null) {
                ps.setString(1, utype);
            } else {
                ps.setString(1, "0");
            }

            ResultSet rs = ps.executeQuery();
            JSONArray navs = new JSONArray();
            while (rs.next()) {
                JSONObject nav = new JSONObject();
                nav.put("id", rs.getString(1));
                nav.put("sname", rs.getString(2));
                nav.put("stype", rs.getString(3));
                nav.put("access", rs.getString(4));

                navs.put(nav);
            }
            return navs.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String editutype(String id) {

        try (Connection con = db.getConnection();) {
            String qry = "SELECT `id`,`name`,`status` FROM `user_type`  WHERE `id`='" + id + "' ";
            ResultSet rs = db.search(con, qry);

            JSONObject jo = new JSONObject();
            if (rs.next()) {
                jo.put("id", rs.getString(1));
                jo.put("name", rs.getString(2));
                jo.put("status", rs.getString(3));
            }

            return jo.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void savePages(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        try (Connection con = db.getConnection()) {

            boolean isMultipart = ServletFileUpload.isMultipartContent(req);

            Map<String, String> para = new HashMap();
            Map<String, FileItem> files = new HashMap();

            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                List items = upload.parseRequest(req);
                Iterator iterator = items.iterator();

                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();

                    if (item.isFormField()) {
                        para.put(item.getFieldName(), item.getString());
                    } else {
                        files.put(item.getFieldName(), item);
                    }
                }
            }
            HttpSession session = req.getSession();

            String type_name = para.get("type_name");
            JSONArray access = new JSONArray(para.get("access"));

            PreparedStatement ps = con.prepareStatement("INSERT INTO `user_type`(`name`,`status`,`ent_id`,`ent_date`)VALUES(?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
            System.out.println(ps);
            ps.setString(1, type_name);
            ps.setString(2, "active");
            ps.executeUpdate();

            ResultSet rsk = ps.getGeneratedKeys();
            rsk.next();
            String key = rsk.getString(1);

            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user_access`(`user_type`,`system`)VALUES(?,?)");
            for (int i = 0; i < access.length(); i++) {

                ps1.setString(1, key);
                ps1.setInt(2, access.getInt(i));

                ps1.executeUpdate();

            }

            JSONObject jo = new JSONObject();
            jo.put("status", "ok");

            resp.getWriter().print(jo.toString());

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps3.setString(1, "Create User Type " + " " + type_name);
            ps3.executeUpdate();

        } catch (Exception e) {
            JSONObject jo = new JSONObject();
            jo.put("status", "no");
            jo.put("msg", e.getMessage());
            resp.getWriter().print(jo.toString());

        }
    }

    public void updatePages(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try (Connection con = db.getConnection()) {

            boolean isMultipart = ServletFileUpload.isMultipartContent(req);

            Map<String, String> para = new HashMap();
            Map<String, FileItem> files = new HashMap();

            if (isMultipart) {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                List items = upload.parseRequest(req);
                Iterator iterator = items.iterator();

                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();

                    if (item.isFormField()) {
                        para.put(item.getFieldName(), item.getString());
                    } else {
                        files.put(item.getFieldName(), item);
                    }

                }

            }
            HttpSession session = req.getSession();

            String name = para.get("type_name");
            String id = para.get("id");
            JSONArray access = new JSONArray(para.get("access"));
            String sts = para.get("utype");

            if (sts.equals("active")) {
                sts = "active";
            } else if (sts.equals("deactive")) {
                sts = "deactive";
            }

            PreparedStatement ps = con.prepareStatement("UPDATE `user_type` SET `name`=?,`status`=?,`mod_id`=(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),`mod_date`=NOW() where id='" + id + "'");

            ps.setString(1, name);
            ps.setString(2, sts);
            ps.executeUpdate();

            PreparedStatement dlt = con.prepareStatement("DELETE FROM `user_access` WHERE `user_type` ='" + id + "'");

            dlt.executeUpdate();

            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user_access`(`user_type`,`system`)VALUES(?,?)");

            for (int i = 0; i < access.length(); i++) {
//                System.out.println(i);

                ps1.setString(1, id);
                ps1.setInt(2, access.getInt(i));
                ps1.executeUpdate();

            }

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps3.setString(1, "Update User Type " + " " + name);
            ps3.executeUpdate();

            JSONObject jo = new JSONObject();
            jo.put("status", "ok");

            resp.getWriter().print(jo.toString());
        } catch (Exception e) {
            JSONObject jo = new JSONObject();
            jo.put("status", "no");
            jo.put("msg", e.getMessage());
            resp.getWriter().print(jo.toString());

        }
    }
}
