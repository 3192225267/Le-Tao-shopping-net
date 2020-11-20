package com.taotao.controller;

import com.taotao.mapper.TbUserMapper;
import com.taotao.pojo.TbUser;
import com.taotao.pojo.TbUserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private TbUserMapper tbUserMapper;
    //进入登录页面
    @RequestMapping("/initlogin")
    public String init(){

        return "login";
    }


    @RequestMapping("/userlogin")
    public String login(String username, String userpwd, HttpSession session){
        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<TbUser> userlist=tbUserMapper.selectByExample(example);
        TbUser user=userlist.get(0);
        if(user!=null){
            if(userpwd.equals(user.getPassword())){
                session.setAttribute("user",user);
                return "redirect:initmain";
            }else{
                return "login";
            }
        }else{
            return "login";
        }

    }

    //进入注册页面
    @RequestMapping("/registration")
    public String registration(){

        return "zhuce";
    }


    //进入注册页面
    @RequestMapping("/zhuce")
    public String zhuce(String username,String userpwd,String email,HttpSession session){
        TbUser user=new TbUser();
        user.setPassword(userpwd);
        user.setUsername(username);
        user.setEmail(email);
        user.setCreated(new Date());
        user.setUpdated(new Date());
        int n=tbUserMapper.insert(user);
        if(n>0){

            System.out.println("注冊成功");
            session.setAttribute("user",user);
            return "redirect:initmain";
        }else{
            System.out.println("注册失败");
            return "registration";
        }
    }

    //进入修改密码页面
    @RequestMapping("/updatepwd")
    public String updatepwd(){

        return "updatepwd";
    }
    //修改密码

    //进入修改密码页面
    @RequestMapping("/modifypwd")
    public String modifypwd(String newpwd,HttpSession session){

            TbUser user = (TbUser) session.getAttribute("user");
        System.out.println("返回"+!newpwd.equals(user.getPassword()));
        //旧密码输入错误
        if(!newpwd.equals(user.getPassword())) {
            user.setPassword(newpwd);

            System.out.println("新密码" + user.getPassword());
            user.setUpdated(new Date());
            int n = tbUserMapper.updateByPrimaryKeySelective(user);
            if (n > 0) {
                return "redirect:/initlogin";
            }
        }
        return "/updatepwd";
    }
    //进入修改密码页面
    @RequestMapping("/Unlock")
    public String Unlock(String password,HttpSession session) {
        System.out.println("pwd" + password);
        TbUser user = (TbUser) session.getAttribute("user");
        if (user!=null) {
            if (password.equals(user.getPassword())) {

                return "redirect:initmain";
            } else {
                return "redirect:/lock";
            }
        }else{
            return "redirect:initlogin";
        }
    }
}
