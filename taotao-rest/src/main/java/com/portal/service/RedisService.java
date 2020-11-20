package com.portal.service;

import com.taotao.pojo.TaotaoResult;

public interface RedisService {
    TaotaoResult syncContent(long contentCid);
    TaotaoResult syncItem(long itemid);
}
