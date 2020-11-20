package com.portal.service;

import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;

import java.util.List;

public interface ItemService {
    TaotaoResult getItemBaseInfo(long itemId);
    //查询商品详情
    TaotaoResult getItemDesc(long itemId);
    //查询商品规格
    TaotaoResult getItemParam(long itemId);
    //index页面大广告下轮播图下分类列表
    List<TbItem> getItemlist(long itemId);
    //根据类别查询
    TaotaoResult getType(Long cid, int page, int rows);
}
