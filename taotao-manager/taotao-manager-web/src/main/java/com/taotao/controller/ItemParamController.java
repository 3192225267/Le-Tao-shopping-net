package com.taotao.controller;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.common.util.IDUtils;
import com.taotao.pojo.TbItemParam;
import com.taotao.service.ItemParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/item/param")
public class ItemParamController {

    @Autowired
    ItemParamService ips;

    @RequestMapping("/query/itemcatid/{itemCatId}")
    @ResponseBody
    public TaotaoResult getItemParamByCid(@PathVariable Long itemCatId){
        return ips.getItemParamByCid(itemCatId);
    }

    @RequestMapping("/save/{cid}")
    @ResponseBody
    public TaotaoResult insertItemParam(@PathVariable("cid") Long cid, String paramData) {

        TbItemParam t=new TbItemParam();

        t.setItemCatId(cid);
        t.setParamData(paramData);
        t.setCreated(new Date());
        t.setUpdated(new Date());
        return ips.saveParam(t);
    }

    @RequestMapping("/list")
    @ResponseBody
    public EUDataGridResult getItemList(int page, int rows) {

       return ips.getItemList(page,rows);
    }


    @RequestMapping("/delete")
    @ResponseBody
    public TaotaoResult deleteList(String ids) {
        TaotaoResult result=null;
        String[] ss=ids.split(",");
        for (int i = 0; i <ss.length ; i++) {
            long id=Long.valueOf(ss[i]);
            result=ips.deleteItemparam(id);
        }
        return result;
    }

}
