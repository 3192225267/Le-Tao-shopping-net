package com.taotao.service;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.taotao.pojo.TbItemParam;

/**
 * 商品规格业务
 */
public interface ItemParamService {

    //根据 商品类别查询
    public TaotaoResult getItemParamByCid(long cid);
    //保存商品规格
    public TaotaoResult saveParam(TbItemParam itemParam);

    //查询所有商品规格
    public EUDataGridResult getItemList(int page, int rows);

    //根据主键删除
    public TaotaoResult deleteItemparam(long ids);



}
