package com.taotao.controller;

import com.common.pojo.TaotaoResult;
import com.common.pojo.TreeNode;
import com.common.util.IDUtils;
import com.taotao.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 网站内容
 */
@Controller
@RequestMapping("/content/category")
public class ContentCategoryController {


    @Autowired
    private ContentCategoryService cs;

    @RequestMapping("/list")
    @ResponseBody
    public List<TreeNode> getContentCatList(@RequestParam(value="id",
            defaultValue="0")Long parentId) {
        List<TreeNode> list = cs.getCategoryList(parentId);
        return list;
    }

    @RequestMapping("/create")
    @ResponseBody
    public TaotaoResult create(long parentId, String name){
        Long id=IDUtils.genItemId();
        return cs.insertContentCategory(parentId,name);
    }


    @RequestMapping("/delete")
    @ResponseBody
    public TaotaoResult del(long id){

        return cs.del(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public TaotaoResult update(long id,String name){


        return cs.updatename(id,name);
    }

}
