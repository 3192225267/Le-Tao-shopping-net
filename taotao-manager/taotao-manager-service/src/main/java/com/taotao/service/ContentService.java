package com.taotao.service;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.taotao.pojo.TbContent;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemDesc;

public interface ContentService {

    public EUDataGridResult getItemList(int page, int rows, long categoryId);

    public TaotaoResult addItem(TbContent tbContent);

    public TaotaoResult deleteContent(long ids);
    public TaotaoResult updateContent(TbContent content);


    public TbContent getbyid(long ids);
}
