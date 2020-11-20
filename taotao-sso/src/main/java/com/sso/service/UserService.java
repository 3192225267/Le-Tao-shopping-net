package com.sso.service;

import com.common.pojo.TaotaoResult;
import com.taotao.pojo.TbUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UserService {
    //查询帐号状态是否可用
    TaotaoResult UserClick(String param,Integer type);
    //注册
    TaotaoResult createUser(TbUser tbUser);
    //登录，并返回一个token状态码
    TaotaoResult UserLogin(String username, String password, HttpServletRequest request, HttpServletResponse response);
    //根据状态码查看信息
    TaotaoResult UserToken(String token);
    //注销账号
    TaotaoResult delUserToken(String token);
}
