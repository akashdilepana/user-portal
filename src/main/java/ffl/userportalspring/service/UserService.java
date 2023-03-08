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
public class UserService {

    public JSONArray userType(HttpSession session) {
        try (Connection con = db.getConnection()) {

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Viwe Add Users page");

            ps3.executeUpdate();

            ResultSet rs = db.search(con, "SELECT u.`id`,u.`name` FROM `user_type`u ");
            JSONArray ja = new JSONArray();
            while (rs.next()) {
                JSONObject sys = new JSONObject();
                sys.put("id", rs.getString(1));
                sys.put("name", rs.getString(2));
                ja.put(sys);
            }
            return ja;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public JSONObject loadTable(String data) {

        try (Connection con = db.getConnection();) {
            JSONObject para = new JSONObject(data);
            PreparedStatement ps = con.prepareStatement("SELECT `id`,`name`,`username`,(SELECT `name` FROM `user_type`  WHERE `id`=`user_type`),`status` FROM `create_users` where true ");
            return DataTable.getData(con, para, ps);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public String editUsers(String id) {

        try (Connection con = db.getConnection();) {
            String qry = "SELECT `id`,`name`,`username`,`user_type`,`status` FROM `create_users`  WHERE `id`='" + id + "' ";

            ResultSet rs = db.search(con, qry);
            JSONObject jo = new JSONObject();
            if (rs.next()) {
                jo.put("id", rs.getString(1));
                jo.put("name", rs.getString(2));
                jo.put("username", rs.getString(3));
                jo.put("user_type", rs.getString(4));
                jo.put("status", rs.getString(5));
            }
            return jo.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void saveUsers(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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
            String name = para.get("name");
            String username = para.get("username");
            String usertype = para.get("usertype");

            PreparedStatement ps = con.prepareStatement("INSERT INTO `create_users`(`username`,`name`,`user_type`,`status`,`ent_idd`,`ent_date`) VALUES(?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, username);
            ps.setString(2, name);
            ps.setString(3, usertype);
            ps.setString(4, "active");

            ps.executeUpdate();

            PreparedStatement psl = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            psl.setString(1, "creat user" + " " + name);
            psl.executeUpdate();

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

    public void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        try (Connection con = db.getConnection()) {

            con.setAutoCommit(false);

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

            String name = para.get("name");
            String username = para.get("username");
            String usertype = para.get("usertype");
            String id = para.get("id");
            String sts = para.get("status");

            if (sts.equals("active")) {
                sts = "active";
            } else if (sts.equals("deactive")) {
                sts = "deactive";
            }

            PreparedStatement ps1 = con.prepareStatement("UPDATE `create_users` SET `username`=?,`name`=?,`user_type`=?,`status`=?,`mod_date`=NOW() where id='" + id + "'");

            ps1.setString(1, username);
            ps1.setString(2, name);
            ps1.setString(3, usertype);
            ps1.setString(4, sts);

            ps1.executeUpdate();

            HttpSession session = req.getSession();
            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");
            ps3.setString(1, "Update User " + " " + name);
            ps3.executeUpdate();
            
            

            con.commit();

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
