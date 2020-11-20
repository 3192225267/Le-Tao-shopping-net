package com.sso.controller;

import com.common.pojo.TaotaoResult;
import com.sso.service.UserService;
import com.taotao.pojo.TbUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.MappingJacksonValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService us;


    //验证该账号是否可用与注册
    @RequestMapping(value = "/check/{param}/{type}",method = RequestMethod.GET)
    @ResponseBody
    public Object UserClick(@PathVariable("param")String param,
    @PathVariable("type") Integer type,
     String  callback){
        TaotaoResult result = null;

        //参数有效性校验,非空校验
        if (StringUtils.isBlank(param)) {
            result = TaotaoResult.build(400, "校验内容不能为空");
        }
        if (type == null) {
            result = TaotaoResult.build(400, "校验内容类型不能为空");
        }
        if (type != 1 && type != 2 && type != 3 ) {
            result = TaotaoResult.build(400, "校验内容类型错误");
        }
        //校验出错，如果密码或者其他的输入错误，则进这个，然后返回原来登录的页面
        if (null != result) {
            if (null != callback) {
                MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
                mappingJacksonValue.setJsonpFunction(callback);
                return mappingJacksonValue;
            } else {
                return result;
            }
        }
        try {
            result= us.UserClick(param,type);
        }catch (Exception e){
            e.printStackTrace();
            TaotaoResult.build(500,"校验出错");
        }

        if (null != callback) {
            MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        } else {
            return result;
        }

    }







    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public Object createUser(TbUser tbUser){
        TaotaoResult result=null;
   try {
        result= us.createUser(tbUser);
   }catch (Exception e){
       TaotaoResult.build(500,"注册失败");
   }
   return result;
    }





    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public TaotaoResult UserLogin(String username,String password, HttpServletRequest request, HttpServletResponse response){

        try {
         TaotaoResult result=   us.UserLogin(username,password,request,response);
         return result;
        }catch (Exception e){
            e.printStackTrace();
          return   TaotaoResult.build(500,"登陆有误");
        }

    }

    @RequestMapping(value = "/token/{token}",method = RequestMethod.GET)
    @ResponseBody
    public Object token(@PathVariable("token")String token,
                              String callback){
        TaotaoResult result=null;
        try {
        result=us.UserToken(token);
        }catch (Exception e){
            e.printStackTrace();
            TaotaoResult.build(500,"出错");
        }
        //判断是否为jsonp调用
        if (StringUtils.isBlank(callback)){
            return result;
        }else {
            MappingJacksonValue mappingJacksonValue=new MappingJacksonValue(result);
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        }

}
    @RequestMapping(value = "logout/{token}",method = RequestMethod.GET)
    @ResponseBody
    public Object delToken(@PathVariable("token") String token,
                                 String callback) {
        TaotaoResult result = null;
        try {

            result = us.delUserToken(token);
        } catch (Exception e) {
            e.printStackTrace();
            result = TaotaoResult.build(500, "出错");
        }
        //判断是否为jsonp调用
        if (StringUtils.isBlank(callback)) {
            return result;
        } else {
            MappingJacksonValue mappingJacksonValue = new MappingJacksonValue(result);
            mappingJacksonValue.setJsonpFunction(callback);
            return mappingJacksonValue;
        }

    }
}
