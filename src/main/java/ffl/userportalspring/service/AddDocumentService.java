/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.DataTable;
import ffl.userportalspring.other.db;
import java.io.BufferedReader;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 *
 * @author Akash
 */
@Service
public class AddDocumentService {

    public JSONArray loadSystems(HttpSession session) {
        try (Connection con = db.getConnection()) {

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Viwe Add Document page");

            ps3.executeUpdate();

            ResultSet rs = db.search(con, " SELECT s.`id`,s.`sname` FROM `systems`s WHERE s.`status` = 'active' ");
            JSONArray ja = new JSONArray();
            while (rs.next()) {
                JSONObject sys = new JSONObject();
                sys.put("id", rs.getString(1));
                sys.put("sname", rs.getString(2));
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
            PreparedStatement ps = con.prepareStatement("SELECT `id`,`description`,`upload_date`,(SELECT `sname` FROM `systems`  WHERE `id`=`system_id`),`status` FROM `documents` where true ");
            return DataTable.getData(con, para, ps);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public String editDoc(String id) {

        try (Connection con = db.getConnection();) {
            String qry = "SELECT `id`,`description`,`file`,`path`,(SELECT `id` FROM `systems`  WHERE `id`=`system_id`),`status` FROM `documents` u WHERE u.`id`='" + id + "' ";
            ResultSet rs = db.search(con, qry);
            JSONObject job = new JSONObject();
            JSONArray jr = new JSONArray();
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString(1));
                jo.put("description", rs.getString(2));
                jo.put("file", rs.getString(3));
                jo.put("path", rs.getString(4));
                jo.put("system", rs.getString(5));
                jo.put("status", rs.getString(6));
                jr.put(jo);

            }
            job.put("list", jr);
            return job.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

//    public void saveDoc(MultipartHttpServletRequest req, HttpServletResponse resp) throws IOException {
//
//        try (Connection con = db.getConnection()) {
//
//            con.setAutoCommit(false);
//
//            Map<String, MultipartFile> files = req.getFileMap();
//
//            HttpSession session = req.getSession();
//            String system = req.getParameter("allsystem");
//            String description = req.getParameter("description");
//            String file = req.getParameter("file1");
//            String path1 = req.getParameter("path1");
//            String path2 = req.getParameter("path2");
//
//            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `documents`(`system_id`,`description`,`file`,`path`,`status`,`user_id`,`upload_date`) VALUES(?,?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
//            ps1.setString(1, system);
//            ps1.setString(2, description);
//            ps1.setString(3, file);
//            ps1.setString(4, path1.trim() + path2.trim());
//            ps1.setString(5, "active");
//
//            ps1.executeUpdate();
//
////            resp.getWriter().print(ps1);
//            ResultSet rsk = ps1.getGeneratedKeys();
//            rsk.next();
//            String key = rsk.getString(1);
//
//            MultipartFile systemfile = files.get("systemfile");
//
//            File parent = new File("helpdocs\\uploads");
//            if (!parent.exists()) {
//                parent.mkdir();
//            }
//
//            File file1 = new File(parent, "systemfile_" + key + "." + FilenameUtils.getExtension(systemfile.getOriginalFilename()));
//            systemfile.transferTo(file1);
//
//            PreparedStatement psu = con.prepareStatement("update `documents` set `file`=? where `id`=?");
//            psu.setString(1, file1.getName());
//            psu.setString(2, key);
//            psu.executeUpdate();
//
//            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`document_name`,`user_name`,`date`) VALUES(?,?,(SELECT u.`name` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
//
//            ps3.setString(1, "save document");
//            ps3.setString(2, description);
////            ps3.setString(3, system);
//
//            ps3.executeUpdate();
//
//            con.commit();
//
//            JSONObject jo = new JSONObject();
//            jo.put("status", "ok");
//
//            resp.getWriter().print(jo.toString());
//
//        } catch (Exception e) {
//            JSONObject jo = new JSONObject();
//            jo.put("status", "no");
//            jo.put("msg", e.getMessage());
//            resp.getWriter().print(jo.toString());
//
//        }
//    }
//
//    public String saveDoc(MultipartFile systemfile, String system, String description, String path1, String path2, HttpSession session) throws IOException {
//
//        try (Connection con = db.getConnection()) {
//
//            con.setAutoCommit(false);
//
//            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `documents`(`system_id`,`description`,`path`,`status`,`user_id`,`upload_date`) VALUES(?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
//            ps1.setString(1, system);
//            ps1.setString(2, description);
//            ps1.setString(3, path1.trim() + path2.trim());
//            ps1.setString(4, "active");
//
//            ps1.executeUpdate();
//
////            resp.getWriter().print(ps1);
//            ResultSet rsk = ps1.getGeneratedKeys();
//            rsk.next();
//            String key = rsk.getString(1);
//
//            File parent = new File("helpdocs\\uploads");
//            if (!parent.exists()) {
//                parent.mkdir();
//            }
//
//            File file1 = new File(parent, "systemfile_" + key + "." + FilenameUtils.getExtension(systemfile.getOriginalFilename()));
//            systemfile.transferTo(file1);
//
//            PreparedStatement psu = con.prepareStatement("update `documents` set `file`=? where `id`=?");
//            psu.setString(1, file1.getName());
//            psu.setString(2, key);
//            psu.executeUpdate();
//
//
//            con.commit();
//
//            JSONObject jo = new JSONObject();
//            jo.put("status", "ok");
//
//            return jo.toString();
//
//        } catch (Exception e) {
//            JSONObject jo = new JSONObject();
//            jo.put("status", "no");
//            jo.put("msg", e.getMessage());
//            return jo.toString();
//
//        }
//    }
    public void saveDoc(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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
            String system = para.get("allsystem");
            String description = para.get("description");
            String file = para.get("file1");
            String path1 = para.get("path1");
            String path2 = para.get("path2");

            PreparedStatement ps1 = con.prepareStatement("INSERT INTO `documents`(`system_id`,`description`,`file`,`path`,`status`,`user_id`,`upload_date`) VALUES(?,?,?,?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )", Statement.RETURN_GENERATED_KEYS);
            ps1.setString(1, system);
            ps1.setString(2, description);
            ps1.setString(3, file);
            ps1.setString(4, path1.trim() + path2.trim());
            ps1.setString(5, "active");

            ps1.executeUpdate();

//            resp.getWriter().print(ps1);
            ResultSet rsk = ps1.getGeneratedKeys();
            rsk.next();
            String key = rsk.getString(1);

            FileItem systemfile;
            systemfile = files.get("systemfile");

            File parent = new File("helpdocs\\uploads");
            if (!parent.exists()) {
                parent.mkdir();
            }

            File file1 = new File(parent, "systemfile_" + key + "." + FilenameUtils.getExtension(systemfile.getName()));
            systemfile.write(file1);

            PreparedStatement psu = con.prepareStatement("update `documents` set `file`=? where `id`=?");
            psu.setString(1, file1.getName());
            psu.setString(2, key);
            psu.executeUpdate();

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "save document " + description);

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

    public void updateDoc(HttpServletRequest req, HttpServletResponse resp) throws IOException {

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
            String system = para.get("allsystem");
            String description = para.get("description");
            String path1 = para.get("path1");
            String path2 = para.get("path2");
            String id = para.get("id");
            String sts = para.get("status");

            if (sts.equals("active")) {
                sts = "active";
            } else if (sts.equals("deactive")) {
                sts = "deactive";
            }

            PreparedStatement ps1 = con.prepareStatement("UPDATE `documents` SET `system_id`=?,`description`=?,`path`=?,`status`=?,`mod_user`=(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),`mod_date`=NOW() where id='" + id + "'");
            ps1.setString(1, system);
            ps1.setString(2, description);
            ps1.setString(3, path1.trim() + path2.trim());
            ps1.setString(4, sts);

            ps1.executeUpdate();

            FileItem systemfile = files.get("systemfile");

            if (systemfile != null) {
                File file1 = new File("helpdocs\\uploads\\systemfile_" + id + "." + FilenameUtils.getExtension(systemfile.getName()));
                if (file1.exists()) {
                    file1.delete();
                }
                systemfile.write(file1);
            }

            JSONObject jo = new JSONObject();
            jo.put("status", "ok");

            resp.getWriter().print(jo.toString());

            PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`user_id`,`date`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + session.getAttribute("user") + "'),NOW() )");

            ps3.setString(1, "Update document " + description);

            ps3.executeUpdate();

        } catch (Exception e) {
            JSONObject jo = new JSONObject();
            jo.put("status", "no");
            jo.put("msg", e.getMessage());
            resp.getWriter().print(jo.toString());

        }
    }
}
