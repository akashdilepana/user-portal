/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.service;

import ffl.userportalspring.other.db;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;

/**
 *
 * @author Akash
 */
@Service
public class FileService {
    
    public void loadFile(String pdfFile,HttpServletResponse resp) {
        try {
            if (db.isLive) {
                File my_file = new File("helpdocs\\uploads\\" + pdfFile);
                if (!my_file.exists()) {
                    resp.sendRedirect("");
                    return;
                }

                String mimeType = Files.probeContentType(my_file.toPath());
                resp.setContentType(mimeType);

                OutputStream out = resp.getOutputStream();
                FileInputStream in = new FileInputStream(my_file);
                byte[] buffer = new byte[4096];
                int length;
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.flush();

            } else {
                File my_file = new File("helpdocs\\uploads\\" + pdfFile);
                if (!my_file.exists()) {
                    resp.sendRedirect("");
                    return;
                }

                String mimeType = Files.probeContentType(my_file.toPath());
                resp.setContentType(mimeType);

                OutputStream out = resp.getOutputStream();
                FileInputStream in = new FileInputStream(my_file);
                byte[] buffer = new byte[4096];
                int length;
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.flush();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
