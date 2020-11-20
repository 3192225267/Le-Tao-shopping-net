package com.taotao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Item_ListController {
    @RequestMapping("itemlist")
    public String  itemlist(){

        return "item-list";
    }
    @RequestMapping("itemparamlist")
    public String  itemparamlist(){

        return "item_param_list";
    }

    @RequestMapping("itemadd")
    public String  itemadd(){

        return "item-add";
    }
    @RequestMapping("initcontent")
    public String  initcontent(){

        return "content";
    }
    @RequestMapping("contentcategory")
    public String  contentcategory(){

        return "content-category";
    }

    @RequestMapping("lock")
    public String  lock(){

        return "lock";
    }
}
