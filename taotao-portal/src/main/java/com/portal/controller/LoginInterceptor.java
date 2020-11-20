package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.util.CookieUtils;
import com.portal.service.UPortalService;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbUser;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

@Reference
    private UPortalService us;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      //在handler执行之前处理
        //判断用户是否登录
        //从cookie中取出taoken码
        String token=CookieUtils.getCookieValue(request,"TT_TOKEN");
        //根据token换取用户信息，调用sso接口
        TaotaoResult result=us.UserToken(token);
        TbUser user=(TbUser) result.getData();
        if (null == user) {
            //跳转到登录页面，把用户请求的url作为参数传递给登录页面。
            response.sendRedirect("http://localhost:8084/page/login"
                    + "?redirect=" + request.getRequestURL());
            System.out.println("?redirect=" + request.getRequestURL());
            //返回false
            return false;
        }
        request.setAttribute("user",user);
        //取到用户信息，放行
        //返回值决定handler是否执行。true：执行，false：不执行。
        return true;

    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }

}
