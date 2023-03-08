/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.SystemPagesService;
import java.io.IOException;
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
public class SystemPagesController {

    @Autowired
    SystemPagesService pages;

    @RequestMapping("/userType")
    public ModelAndView pages() {
        ModelAndView mv = new ModelAndView("systempages");
        return mv;
    }

    @RequestMapping("/LoadUserType")
    @ResponseBody
    public String loadTable(@RequestBody String data, HttpSession session) {
        return pages.loadTable(data, session).toString();
    }

    @RequestMapping(value = "/UserTypeList", method = RequestMethod.GET)
    @ResponseBody
    public String loadPages(String utype) {
        return pages.loadPages(utype);
    }

    @RequestMapping(value = "/EditUserType", method = RequestMethod.POST)
    @ResponseBody
    public String editutype(String id) {
        return pages.editutype(id);
    }

    @RequestMapping("/savePages")
    @ResponseBody
    public void savePages(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        pages.savePages(req, resp);
    }

    @RequestMapping("/updatePages")
    @ResponseBody
    public void updatePages(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        pages.updatePages(req, resp);
    }
}
