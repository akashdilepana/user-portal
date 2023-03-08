/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.AdminService;
import ffl.userportalspring.service.IndexService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Ridmi
 */
@Controller
public class AdminController {

    @Autowired
    AdminService admin;

//    @RequestMapping("/")
//    public ModelAndView admin() {
//        ModelAndView mv = new ModelAndView("adminsetup");
//        return mv;
//    }
    
     @RequestMapping("//")
    public ModelAndView admin() {
        ModelAndView mv = new ModelAndView("adminsetup");
        return mv;
    }

//    @RequestMapping("/adminsetup")
//    @ResponseBody
//    public String loadSystems(HttpServletRequest req, HttpServletResponse resp) {
//        return admin.loadSystems(req,resp);
//    }
    @RequestMapping(value = "/adminsetup", method = RequestMethod.POST)
    @ResponseBody
    public String loadSystems(@RequestParam String type, @RequestParam(required = false) String cusId, HttpSession session) {
        return admin.loadSystems(type, cusId, session);
    }

}
