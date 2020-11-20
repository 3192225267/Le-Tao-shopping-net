package com.taotao.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.portal.service.RedisService;
import com.taotao.pojo.TbContent;
import com.taotao.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/content")
public class ContentController {

    @Autowired
    private ContentService cs;


    @Reference
    private RedisService rs;
    @RequestMapping("/query/list")
    @ResponseBody
    public EUDataGridResult getlist(Integer page, Integer rows, Long categoryId){

        return cs.getItemList(page,rows,categoryId);
    }

    @RequestMapping("/save")
    @ResponseBody
    public TaotaoResult add(TbContent t){

        try {
            rs.syncContent(t.getCategoryId());
        }catch (Exception e){
            e.printStackTrace();
        }

        return cs.addItem(t);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public TaotaoResult deleteContent(Long ids) {

        try {
            rs.syncContent(cs.getbyid(ids).getCategoryId());
        }catch (Exception e){
            e.printStackTrace();
        }
        TaotaoResult result = cs.deleteContent(ids);
        return result;
    }

    @RequestMapping("/edit")
    @ResponseBody
    public TaotaoResult editContent(TbContent content) {

        try {
            rs.syncContent(content.getCategoryId());
        } catch (Exception e) {
            e.printStackTrace();


        }
        TaotaoResult result = cs.updateContent(content);
        return result;
    }

}
