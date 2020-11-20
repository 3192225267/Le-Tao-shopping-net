package com.portal.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.portal.service.RedisService;
import com.rest.dao.JedisClient;
import com.taotao.pojo.TaotaoResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    private JedisClient jedisClient;

    @Value("${INDEX_CONTENT_REDIS_KEY}")
    private String INDEX_CONTENT_REDIS_KEY;

    @Value("${REDIS_ITEM_KEY}")
    private String REDIS_ITEM_KEY;
    @Override
    public TaotaoResult syncContent(long contentCid) {

        try {
            jedisClient.hdel(INDEX_CONTENT_REDIS_KEY, contentCid + "");
        } catch (Exception e) {
            e.printStackTrace();
            return TaotaoResult.build(500, "出错位置：taotao-rest_com_portal.service_RedisServiceImpl");
        }
        return TaotaoResult.ok();

    }

    @Override
    public TaotaoResult syncItem(long itemid) {
        System.out.println("删除redis rest"+itemid);
        try {
            jedisClient.del(REDIS_ITEM_KEY+":"+itemid+":base");
            jedisClient.del(REDIS_ITEM_KEY+":"+itemid+":desc");
            jedisClient.del(REDIS_ITEM_KEY+":"+itemid+":param");
        } catch (Exception e) {
            e.printStackTrace();
            return TaotaoResult.build(500,"同步redis商品，删除错误");
        }
        return TaotaoResult.ok();
    }

}
