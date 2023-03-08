/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.LoginService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class LoginController {

    @Autowired
    LoginService ser;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        return ser.login(username, password, session);
    }

    @RequestMapping("/")
    public String login() {
        return "login";
    }

    @RequestMapping("/login")
    public String login1() {
        return "login";
    }

//    @RequestMapping("/logout")
//    public String logout() {
//        return "login";
//    }
}
