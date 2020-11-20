package com.taotao.controller;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemDesc;
import com.taotao.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private ItemService im;

    @RequestMapping("/{itemid}")
    @ResponseBody
    public TbItem itemByid(@PathVariable("itemid") long itemid){
        TbItem item=im.getItemByid(itemid);
        return item;
    }


    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult itemlist(int page, int rows){
        EUDataGridResult re=im.getpage(page,rows);
        return re;
    }

    @RequestMapping("/save")
    @ResponseBody
    public TaotaoResult addItem(TbItem item, String desc,String itemParams) {
        System.out.println("desc"+desc);
        TbItemDesc itemDesc = new TbItemDesc();
        itemDesc.setItemDesc(desc);
        TaotaoResult result = im.addItem(item, itemDesc,itemParams);
        return result;
    }


    @RequestMapping("/delete")
    @ResponseBody
    public TaotaoResult itemdel(String ids) {
        TaotaoResult result = null;
        String[] idss=ids.split(",");

        for (int i = 0; i <idss.length ; i++) {
            long id=Long.valueOf(idss[i]);//每个商品id

            result=im.deleteItem(id);
        }

        return result;
    }


    @RequestMapping("/query/item/desc/{ids}")
    @ResponseBody
    public TaotaoResult queryitemdesc(@PathVariable("ids") long ids) {
        return im.getdesc(ids);
    }


    @RequestMapping("/update")
    @ResponseBody
    public TaotaoResult itemupdate(TbItem item,String desc)   throws Exception{
        TbItemDesc idesc=new TbItemDesc();
        idesc.setItemDesc(desc);

        return im.updateItem(item,idesc);
    }

}
