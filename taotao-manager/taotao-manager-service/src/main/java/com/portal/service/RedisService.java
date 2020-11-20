package com.portal.service;

import com.taotao.pojo.TaotaoResult;

public interface RedisService {

    public TaotaoResult syncContent(long contentCid);
}
