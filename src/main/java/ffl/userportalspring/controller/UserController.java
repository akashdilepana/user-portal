/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.AddDocumentService;
import ffl.userportalspring.service.UserService;
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
public class UserController {

    @Autowired
    UserService user;

    @RequestMapping("/users")
    public ModelAndView users(HttpSession session) {

        ModelAndView mv = new ModelAndView("admin");
        mv.addObject("usertype", user.userType(session));
        return mv;
    }

    @RequestMapping("/loadUsers")
    @ResponseBody
    public String loadTable(@RequestBody String data) {
        return user.loadTable(data).toString();
    }

    @RequestMapping(value = "/EditUsers", method = RequestMethod.POST)
    @ResponseBody
    public String editUsers(String id) {
        return user.editUsers(id);
    }

    @RequestMapping("/UserSave")
    @ResponseBody
    public void saveusers(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        user.saveUsers(req, resp);
    }
    @RequestMapping("/UserUpdate")
    @ResponseBody
    public void updateuser(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        user.updateUser(req, resp);
    }
}
