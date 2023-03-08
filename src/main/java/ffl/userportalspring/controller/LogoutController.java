/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.LogoutService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

/**
 *
 * @author Akash
 */
@Controller
public class LogoutController {

    @Autowired
    LogoutService logout;

    
//    @RequestMapping("/logout")
//    public RedirectView handleRedirect() {
//        return logout.redirect();
//    }
    
    @RequestMapping("/logout")
    @ResponseBody
    public void logout(HttpServletRequest req, HttpServletResponse resp) {
         logout.logout(req,resp);

    }
}
