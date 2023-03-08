/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.FileService;
import ffl.userportalspring.service.ImageService;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Akash
 */
@Controller
public class FileController {
    
    @Autowired
    FileService ser;

    @RequestMapping("/LoadFile")
    public void loadFile(@RequestParam String pdfFile, HttpServletResponse resp) {
        ser.loadFile(pdfFile, resp);
    }
}
