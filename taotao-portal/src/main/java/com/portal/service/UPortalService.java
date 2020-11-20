package com.portal.service;


import com.taotao.pojo.TaotaoResult;

public interface UPortalService {
    //根据状态码查看信息
    TaotaoResult UserToken(String token);
}
