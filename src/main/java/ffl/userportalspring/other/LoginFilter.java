/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ffl.userportalspring.other;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class LoginFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        String url = req.getRequestURI();

        if (!(url.equals("/UserportalSpring/login") | url.startsWith("/UserportalSpring/files/") | url.startsWith("/UserportalSpring/assets/") | url.startsWith("/UserportalSpring/images/") | url.startsWith("/UserportalSpring/system/") | url.equals("/UserportalSpring/Login")) && req.getSession().getAttribute("user") == null) {
            resp.sendRedirect("login");
            return;
        }

        if (!(url.startsWith("/UserportalSpring/LoadImage") | url.startsWith("/UserportalSpring/login") | url.startsWith("/UserportalSpring/logout") | url.startsWith("/UserportalSpring/js") | url.startsWith("/UserportalSpring/css")
                | url.startsWith("/UserportalSpring/userrecod") | url.startsWith("/UserportalSpring/dashboad") | url.startsWith("/UserportalSpring/files/") | url.startsWith("/UserportalSpring/assets/") | url.startsWith("/UserportalSpring/images/"))) {
            try (Connection con = db.getConnection()) {

                if (url.startsWith("/UserportalSpring/LoadFile") && req.getParameter("id") != null) {

                    System.out.println("dddd");
                    PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`system`,`user_id`,`date`) VALUES((SELECT CONCAT('Viewed File ',`description`) FROM `documents` WHERE `id` = ?),?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW() )");

                    System.out.println(ps3);

                    ps3.setString(1, req.getParameter("id"));
                    ps3.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));

                    ps3.executeUpdate();
                } else if (url.startsWith("/UserportalSpring/system")) {

                    PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`system`,`user_id`,`date`) VALUES(?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW() )");

                    ps1.setString(1, "page");
                    ps1.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));

                    ps1.executeUpdate();
                }
                System.out.println("asasa");
                PreparedStatement ps2 = con.prepareStatement("INSERT INTO `user_record`(`activity`,`user`,`date`,`req`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW(),?)", Statement.RETURN_GENERATED_KEYS);
                ps2.setString(1, "page");
                ps2.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));
                ps2.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
//        if (!(url.equals("/login") | url.startsWith("/files/") | url.startsWith("/images/") | url.startsWith("/UserportalSpring/system/") | url.equals("/Login")) && req.getSession().getAttribute("user") == null) {
//            resp.sendRedirect("login");
//            return;
//        }
//
//        if (!(url.startsWith("/LoadImage") | url.startsWith("/login") | url.startsWith("/logout") | url.startsWith("/js") | url.startsWith("/css")
//                | url.startsWith("/userrecod") | url.startsWith("/dashboad") | url.startsWith("/files/") | url.startsWith("/assets/") | url.startsWith("/images/"))) {
//            try (Connection con = db.getConnection()) {
//
//                if (url.startsWith("/LoadFile") && req.getParameter("id") != null) {
//
//                    System.out.println("dddd");
//                    PreparedStatement ps3 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`system`,`user_id`,`date`) VALUES((SELECT CONCAT('Viewed File ',`description`) FROM `documents` WHERE `id` = ?),?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW() )");
//
//                    System.out.println(ps3);
//
//                    ps3.setString(1, req.getParameter("id"));
//                    ps3.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));
//
//                    ps3.executeUpdate();
//                } else if (url.startsWith("/system")) {
//
//                    PreparedStatement ps1 = con.prepareStatement("INSERT INTO `user_log`(`activity`,`system`,`user_id`,`date`) VALUES(?,?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW() )");
//
//                    ps1.setString(1, "page");
//                    ps1.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));
//
//                    ps1.executeUpdate();
//                }
//
//                PreparedStatement ps2 = con.prepareStatement("INSERT INTO `user_record`(`activity`,`user`,`date`,`req`) VALUES(?,(SELECT u.`id` FROM `create_users` u WHERE u.`username`='" + req.getSession().getAttribute("user") + "'),NOW(),?)", Statement.RETURN_GENERATED_KEYS);
//                ps2.setString(1, "page");
//                ps2.setString(2, url + (req.getQueryString() != null ? "?" + req.getQueryString() : ""));
//                ps2.executeUpdate();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
        }

        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void destroy() {

    }

}
