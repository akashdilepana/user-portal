/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.AddDocumentService;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Akash
 */
@Controller
public class AddDocumentController {

    @Autowired
    AddDocumentService doc;

    @RequestMapping("/adddocument")
    public ModelAndView adddocument(HttpSession session) {

        ModelAndView mv = new ModelAndView("adddocument");
        mv.addObject("system", doc.loadSystems(session));
        return mv;
    }

    @RequestMapping("/loaddocs")
    @ResponseBody
    public String loadTable(@RequestBody String data) {
        return doc.loadTable(data).toString();
    }

    @RequestMapping(value = "/EditDoc", method = RequestMethod.POST)
    @ResponseBody
    public String editSystem(String id) {
        return doc.editDoc(id);
    }

    @RequestMapping("/SaveDoc")
    @ResponseBody
    public void saveusers(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doc.saveDoc(req, resp);
    }
//     @RequestMapping("/SaveDoc")
//    @ResponseBody
//    public void saveusers(MultipartHttpServletRequest req, HttpServletResponse resp) throws IOException {
//        doc.saveDoc(req, resp);
//    }
//    @RequestMapping("/SaveDoc")
//    @ResponseBody
//    public String saveDoc(@RequestParam MultipartFile systemfile,@RequestParam String allsystem,@RequestParam String description,@RequestParam String path1,@RequestParam String path2,HttpSession session) throws IOException {
//      return doc.saveDoc(systemfile, allsystem, description,path1, path2, session);
//    }

    @RequestMapping("/UpdateDoc")
    @ResponseBody
    public void updateDoc(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doc.updateDoc(req, resp);
    }
}
