package com.taotao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 刘振河
 * @create 2020--11--20 6:10
 */
@Controller
@RequestMapping("/letao/user")
public class LoginController {
    @RequestMapping("/userLoginJump")
    public String init(){
        System.out.println("OK");
        return "login";
    }
//    @RequestMapping("/userLoginJump.do")
//    public String test(){
//        System.out.println("OK");
//        return "/WEB-INF/jsp/404";
//    }

}
