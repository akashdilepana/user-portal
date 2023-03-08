/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.DataTable;
import ffl.userportalspring.other.db;
import java.io.File;
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
import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

/**
 *
 * @author Akash
 */
@Service
public class AddSystemService {

    public JSONArray loadSystems(HttpSession session) {

        try (Connection con = db.getConnection()) {
            
             PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Viwe Add System page");

            ps3.executeUpdate();

            
            ResultSet rs = db.search(con, " SELECT s.`id`,s.`name` FROM `system_type`s ");
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

            PreparedStatement ps = con.prepareStatement("SELECT `id`,`sname`,`discription`,(SELECT `name` FROM `system_type`  WHERE `id`=`system_type`),`status` FROM `systems` where true");

            return DataTable.getData(con, para, ps);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public String editSystem(String id) {
        try (Connection con = db.getConnection();) {
            String qry = "SELECT `id`,`sname`,`discription`,`icon`,`system_logo`,`system_type`,`status` FROM `systems` u WHERE u.`id`='" + id + "' ";
            ResultSet rs = db.search(con, qry);
            JSONObject job = new JSONObject();
            JSONArray jr = new JSONArray();
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString(1));
                jo.put("sname", rs.getString(2));
                jo.put("description", rs.getString(3));
                jo.put("icon", rs.getString(4));
                jo.put("logo", rs.getString(5));
                jo.put("systemtype", rs.getString(6));
                jo.put("status", rs.getString(7));

                jr.put(jo);
            }
            job.put("list", jr);
            return job.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
    
    public void saveSystem(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        
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

            HttpSession session = req.getSession();
            String system_name = para.get("system");
            String discription = para.get("description");
            String icon = para.get("icon");
            String logo = para.get("logo");
            String systemtype = para.get("systemtype");

            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `systems`(`sname`,`discription`,`icon`,`status`,`system_logo`,`system_type`,`ent_user`,`ent_date`) VALUES(?,?,?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);

            ps1.setString(1, system_name);
            ps1.setString(2, discription);
            ps1.setString(3, icon);
            ps1.setString(4, "active");
            ps1.setString(5, logo);
            ps1.setString(6, systemtype);

            ps1.executeUpdate();

//            resp.getWriter().print("ok");
            ResultSet rsk = ps1.getGeneratedKeys();
            rsk.next();
            String key = rsk.getString(1);

            FileItem systemicon;

            systemicon = files.get("systemicon");

            File file1 = new File("helpdocs\\uploads\\systemicon_" + key + "." + FilenameUtils.getExtension(systemicon.getName()));
            systemicon.write(file1);

            PreparedStatement psu = con.prepareStatement("update `systems` set `icon`=? where `id`=?");
            psu.setString(1, file1.getName());
            psu.setString(2, key);
            psu.executeUpdate();

            FileItem systemlogo;

            systemlogo = files.get("systemlogo");

            File file2 = new File("helpdocs\\uploads\\systemlogo_" + key + "." + FilenameUtils.getExtension(systemlogo.getName()));
            systemlogo.write(file2);

            PreparedStatement psu1 = con.prepareStatement("update `systems` set `system_logo`=? where `id`=?");
            psu1.setString(1, file2.getName());
            psu1.setString(2, key);
            psu1.executeUpdate();

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "add system " + system_name);

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
    
    public void updateSystem(HttpServletRequest req, HttpServletResponse resp) throws IOException{
        
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
            String system = para.get("system");
            String description = para.get("description");
            String systemtype = para.get("systemtype");
            String id = para.get("id");
            String sts = para.get("status");

            if (sts.equals("active")) {
                sts = "active";
            } else if (sts.equals("deactive")) {
                sts = "deactive";
            }

            PreparedStatement ps1 = con.prepareStatement("UPDATE `systems` SET `sname`=?,`discription`=?,`system_type`=?,`status`=?,`mod_user`=(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),`mod_date`=NOW() where id='" + id + "'");
//            PreparedStatement ps1 = con.prepareStatement("UPDATE `documents` SET(`system_id`,`description`,`file`,`path`,`user_id`,`upload_date`) VALUES(?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);

            ps1.setString(1, system);
            ps1.setString(2, description);
            ps1.setString(3, systemtype);
            ps1.setString(4, sts);
//            ps1.setString(5, "active");

            ps1.executeUpdate();

            FileItem systemicon = files.get("systemicon");

            if (systemicon != null) {

                File file1 = new File("helpdocs\\uploads\\systemicon_" + id + "." + FilenameUtils.getExtension(systemicon.getName()));
                if (file1.exists()) {
                    file1.delete();
                }
                systemicon.write(file1);
            }

            FileItem systemlogo = files.get("systemlogo");

            if (systemlogo != null) {

                File file2 = new File("helpdocs\\uploads\\systemlogo_" + id + "." + FilenameUtils.getExtension(systemlogo.getName()));
                if (file2.exists()) {
                    file2.delete();
                }
                systemlogo.write(file2);
            }

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Update System " + system);


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
