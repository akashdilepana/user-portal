/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.controller;

import ffl.userportalspring.service.AddDocumentService;
import ffl.userportalspring.service.UserLogService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Akash
 */
@Controller
public class UserLogController {

    @Autowired
    UserLogService userLog;

    @RequestMapping("/userlog")
    public ModelAndView adddocument() {

        ModelAndView mv = new ModelAndView("userlog");
        mv.addObject("user", userLog.loadUsers());
        return mv;
    }

    @RequestMapping("/userrecod")
    @ResponseBody
    public String loadTable(@RequestBody String data,HttpSession session) {
        return userLog.loadTable(data,session).toString();
    }

}
