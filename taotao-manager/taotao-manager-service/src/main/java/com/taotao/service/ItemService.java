package com.taotao.service;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.common.pojo.TreeNode;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemDesc;

import java.util.List;
//商品和商品分类业务逻辑
public interface ItemService {


    TbItem getItemByid(long itemid);

    EUDataGridResult getpage(int page, int rows);


     List<TreeNode> getItemCatList(long parentId);


    public TaotaoResult addItem(TbItem item, TbItemDesc itemDesc, String itemParams);

    public TaotaoResult deleteItem(long id);

    public TaotaoResult getdesc(long id);


    public TaotaoResult updateItem(TbItem item, TbItemDesc itemDesc);


}
