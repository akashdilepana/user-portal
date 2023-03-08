/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.AddDocumentService;
import ffl.userportalspring.service.AddSystemService;
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
public class AddSystemController {

    @Autowired
    AddSystemService system;

    @RequestMapping("/addsystems")
    public ModelAndView addsystem(HttpSession session) {

        ModelAndView mv = new ModelAndView("addsystems");
        mv.addObject("system", system.loadSystems(session));
        return mv;
    }

    @RequestMapping("/loadSystem")
    @ResponseBody
    public String loadTable(@RequestBody String data) {
        return system.loadTable(data).toString();
    }

    @RequestMapping(value = "/EditSystem", method = RequestMethod.POST)
    @ResponseBody
    public String editSystem(String id) {
        return system.editSystem(id);
    }

    @RequestMapping("/SaveSystem")
    @ResponseBody
    public void saveSystem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        system.saveSystem(req, resp);
    }
    @RequestMapping("/UpdateSystem")
    @ResponseBody
    public void updateSystem(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        system.updateSystem(req, resp);
    }

}
