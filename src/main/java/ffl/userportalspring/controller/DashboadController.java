/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.DashboadService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
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
public class DashboadController {

    @Autowired
    DashboadService dash;


    @RequestMapping("/index")
    public ModelAndView index1() {
        ModelAndView mv = new ModelAndView("dashboad");
        return mv;
    }

    @RequestMapping(value = "/dashboad", method = RequestMethod.GET)
    @ResponseBody
    public String loadSystems(HttpServletRequest req, HttpServletResponse resp) {
        return dash.loadSystems(req, resp);
    }
//    @RequestMapping(value = "/dashboad", method = RequestMethod.GET)
//    @ResponseBody
//    public String loadSystems(HttpSession session,@RequestParam String utype) {
//        return dash.loadSystems(session,utype);
//    }

    
}
