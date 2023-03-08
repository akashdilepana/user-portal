/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.SystemService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Akash
 */
@Controller
public class SystemController {

    @Autowired
    SystemService system;

    @RequestMapping("/system")
    public ModelAndView systempage(@RequestParam String id) {
        ModelAndView mv = new ModelAndView("system");
        mv.addObject("id", id);
        return mv;

    }

//    @RequestMapping("/LoadSideBar/{id}")
//    @ResponseBody
//    public String loadSidebar(@PathVariable String id) {
//        JSONObject jo = new JSONObject();
//        jo.put("status", id);
//
//        return jo.toString();
//    }
    @RequestMapping(value = "/LoadSideBar/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String loadSidebar1(@PathVariable String id) {
        return system.loadSidebar(id);
    }
}
