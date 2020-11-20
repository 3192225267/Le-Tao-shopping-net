package com.portal.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.common.util.JsonUtils;
import com.portal.service.ContentService;
import com.rest.dao.JedisClient;
import com.taotao.mapper.TbContentMapper;

import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbContent;
import com.taotao.pojo.TbContentExample;
import com.taotao.pojo.TbItemExample;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;
@Service
public class ContentServiceImpl implements ContentService {
    @Autowired
    private TbContentMapper contentMapper;

    //reids 常量
    @Value("${INDEX_CONTENT_REDIS_KEY}")
    private String INDEX_CONTENT_REDIS_KEY;
    //redis 工具
    @Autowired
    private JedisClient jedisClient;

    @Override
    public List<TbContent> getContentList(long contentCid) {


        //取出缓存
        try {
            String result = jedisClient.hget(INDEX_CONTENT_REDIS_KEY, contentCid + "");
            if (!StringUtils.isBlank(result)) {//判断是否为空，非空验证
                // 把字符串转换成list （JsonUtils：可以把集合装成字符串，也可以把字符串转成集合）
                List<TbContent> resultList = JsonUtils.jsonToList(result, TbContent.class);
                return resultList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


        //根据内容分类id查询内容列表
        TbContentExample example = new TbContentExample();
        TbContentExample.Criteria criteria = example.createCriteria();
        criteria.andCategoryIdEqualTo(contentCid);
        //执行查询
        List<TbContent> list = contentMapper.selectByExample(example);


        // 向缓存中添加内容
        try {
            // 把list转换成字符串
            String cacheString = JsonUtils.objectToJson(list);
            jedisClient.hset(INDEX_CONTENT_REDIS_KEY, contentCid + "", cacheString);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }



}
