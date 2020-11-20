package com.portal.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.common.util.JsonUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.portal.service.ItemService;
import com.rest.dao.JedisClient;
import com.taotao.mapper.TbItemDescMapper;
import com.taotao.mapper.TbItemMapper;
import com.taotao.mapper.TbItemParamItemMapper;
import com.taotao.pojo.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;
import java.util.zip.Inflater;

@Service
public class ItemServiceImpl implements ItemService {

    @Value("${REDIS_ITEM_KEY}")
    private String REDIS_ITEM_KEY;
    @Value("${REDIS_ITEM_EXPIRE}")
    private Integer REDIS_ITEM_EXPIRE;

    @Autowired
    private JedisClient jedisClient;



    @Autowired
    private TbItemMapper tm;

    @Autowired
    private TbItemDescMapper itemDescMapper;
    @Autowired
    private TbItemParamItemMapper itemParamItemMapper;
    @Override
    public TaotaoResult getItemBaseInfo(long itemId) {





        try {
            //添加缓存逻辑
            //从缓存中取商品信息，商品id对应的信息
            String result = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":base");
            //判断是否有值
            if (!StringUtils.isBlank(result)) {
                //把json转换成java对象
                TbItem item = JsonUtils.jsonToPojo(result, TbItem.class);
                return TaotaoResult.ok(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //数据库查——存
        TbItem item = tm.selectByPrimaryKey(itemId);
        //使用TaotaoResult包装一下
        try {
            //把商品信息写入缓存
            jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":base", JsonUtils.objectToJson(item));
            //设置key的有效期
            jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":base", REDIS_ITEM_EXPIRE);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return TaotaoResult.ok(item);
    }

        //index界面，大家电小家电的查询
    @Override
    public List<TbItem> getItemlist(long itemId) {
        //添加缓存
        try {

            //从缓存中取商品信息，商品id对应的信息
            String json = jedisClient.hget(REDIS_ITEM_KEY ,itemId+"");
            //判断是否有值
            if (!StringUtils.isBlank(json)) {//判断是否为空，非空验证
                 //把字符串转换成list （JsonUtils：可以把集合装成字符串，也可以把字符串转成集合）
                List<TbItem> TbIetemList = JsonUtils.jsonToList(json, TbItem.class);
                System.out.println("从redis取得"+json);
                return TbIetemList;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        //数据库查
        TbItemExample example = new TbItemExample();
        TbItemExample.Criteria criteria = example.createCriteria();
        criteria.andCidEqualTo(itemId);
        List<TbItem> tlist = tm.selectByExample(example);
        //数据库查——存
        //使用TaotaoResult包装一下
        // 向缓存中添加内容
        try {
            // 把list转换成字符串
            String cacheString = JsonUtils.objectToJson(tlist);
            jedisClient.hset(REDIS_ITEM_KEY, itemId + "", cacheString);
            System.out.println("存储到reids"+cacheString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tlist;
    }

    @Override
    public TaotaoResult getType(Long cid, int page, int rows) {
        PageHelper.startPage(page,rows);
        TbItemExample example=new TbItemExample();
        TbItemExample.Criteria criteria=example.createCriteria();
        criteria.andCidEqualTo(cid);
        List<TbItem> tbItems=tm.selectByExample(example);
        PageInfo info=new PageInfo(tbItems);
        return TaotaoResult.ok(info);
    }

    @Override
    public TaotaoResult getItemDesc(long itemId) {
        //添加缓存
        try {
            //添加缓存逻辑
            //从缓存中取商品信息，商品id对应的信息
            String json = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":desc");
            //判断是否有值
            if (!StringUtils.isBlank(json)) {
                //把json转换成java对象
                TbItemDesc itemDesc = JsonUtils.jsonToPojo(json, TbItemDesc.class);
                return TaotaoResult.ok(itemDesc);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //创建查询条件
        TbItemDesc itemDesc = itemDescMapper.selectByPrimaryKey(itemId);
        if(itemDesc!=null){
            // System.out.println("desc"+itemDesc.getItemDesc());
            try {
                //把商品信息写入缓存
                jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":desc", JsonUtils.objectToJson(itemDesc));
                //设置key的有效期
                jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":desc", REDIS_ITEM_EXPIRE);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        return TaotaoResult.ok(itemDesc);

    }

    @Override
    public TaotaoResult getItemParam(long itemId) {
        //添加缓存
        try {
            //添加缓存逻辑
            //从缓存中取商品信息，商品id对应的信息
            String json = jedisClient.get(REDIS_ITEM_KEY + ":" + itemId + ":param");
            //判断是否有值
            if (!StringUtils.isBlank(json)) {
                //把json转换成java对象
                TbItemParamItem paramItem = JsonUtils.jsonToPojo(json, TbItemParamItem.class);
                return TaotaoResult.ok(paramItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //根据商品id查询规格参数
        //设置查询条件
        TbItemParamItemExample example = new TbItemParamItemExample();
        TbItemParamItemExample.Criteria criteria = example.createCriteria();
        criteria.andItemIdEqualTo(itemId);

        //执行查询
        List<TbItemParamItem> list = itemParamItemMapper.selectByExampleWithBLOBs(example);
        if (list != null && list.size()>0) {
            TbItemParamItem paramItem = list.get(0);
            try {
                //把商品信息写入缓存
                jedisClient.set(REDIS_ITEM_KEY + ":" + itemId + ":param", JsonUtils.objectToJson(paramItem));
                //设置key的有效期
                jedisClient.expire(REDIS_ITEM_KEY + ":" + itemId + ":param", REDIS_ITEM_EXPIRE);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return TaotaoResult.ok(paramItem);
        }
        return TaotaoResult.build(400, "无此商品规格");

    }


}
