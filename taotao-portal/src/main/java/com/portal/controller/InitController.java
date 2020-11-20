package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.util.JsonUtils;
import com.portal.service.ContentService;
import com.portal.service.ItemService;
import com.portal.service.Item_CatService;
import com.taotao.pojo.TbContent;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemCat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InitController {

    @Reference
    private ContentService contentService;
    @Reference
    private ItemService itemService;
    @Reference
    private Item_CatService item_catService;
    @RequestMapping("/index")
    public String init(Model model, HttpSession session){

        //index页面中心大广告轮播图
        List<TbContent> tblist=contentService.getContentList(512544);
        List<Map> topbigList = new ArrayList<>();
        //创建一个jsp页码要求的pojo列表
        for (TbContent tbContent : tblist) {
            Map map = new HashMap<>();
            map.put("src", tbContent.getPic());
            map.put("height", 240);
            map.put("width", 670);
            map.put("srcB", tbContent.getPic2());
            map.put("widthB", 550);
            map.put("heightB", 240);
            map.put("href", tbContent.getUrl());
            map.put("alt", tbContent.getSubTitle());
            topbigList.add(map);

        }

        //index页面电商快报上面的小广告
        List<TbContent> ablist=contentService.getContentList(209653);
        List<Map> righttopList = new ArrayList<>();
        for (TbContent tbContent : ablist) {
            Map map = new HashMap<>();
            map.put("src", tbContent.getPic());
            map.put("height", 80);
            map.put("width", 320);
            map.put("srcB", tbContent.getPic2());
//            map.put("widthB", 550);
//            map.put("heightB", 240);4

            map.put("href", tbContent.getUrl());
            map.put("alt", tbContent.getSubTitle());
            righttopList.add(map);

        }
        //index页面右下角轮播图
        List<TbContent> cblist=contentService.getContentList(619829);
        List<Map> rightbottomList = new ArrayList<>();
        for (TbContent tbContent : cblist) {
            Map map = new HashMap<>();
            map.put("src", tbContent.getPic());
            map.put("height", 190);
            map.put("width", 200);
            map.put("href", tbContent.getUrl());
            map.put("alt", tbContent.getSubTitle());
            rightbottomList.add(map);

        }



       List<TbItem> alist=itemService.getItemlist(560);
        model.addAttribute("ad5", alist);


        //index页面大广告轮播图下中轮播图
        List<TbContent> tdlist=contentService.getContentList(131817);
        List<Map> Topdown = new ArrayList<>();
        for (TbContent tbContent : tdlist) {
            Map map = new HashMap<>();
            map.put("src", tbContent.getPic());
            map.put("height", 80);
            map.put("width", 40);
            map.put("srcB", tbContent.getPic2());
            map.put("widthB", 50);
            map.put("heightB", 50);
            map.put("href", tbContent.getUrl());
            map.put("alt", tbContent.getSubTitle());
            Topdown.add(map);

        }


        //淘淘快报
        List<TbContent> dblist=contentService.getContentList(485303);


        //index页面logo
        List<TbContent> logo=contentService.getContentList(706506);

        //左下角广告
        List<TbContent> leftbottom=contentService.getContentList(689977);

        //商品大全
        List<TbItemCat>list=item_catService.getParent(0);

        //店铺大全
        List<TbContent> dianpu=contentService.getContentList(513206);

        String adJson = JsonUtils.objectToJson(topbigList);
        String bdJson = JsonUtils.objectToJson(righttopList);
        String cdJson = JsonUtils.objectToJson(Topdown);
        String ddJson = JsonUtils.objectToJson(alist);
        String edJson = JsonUtils.objectToJson(rightbottomList);
        //商品分类
        model.addAttribute("type",list);
        //
        model.addAttribute("ad1", adJson);
        //
        model.addAttribute("ad2", bdJson);
        //
        model.addAttribute("ad3", cdJson);
        //
        model.addAttribute("ad4", ddJson);
        //
        model.addAttribute("ad5", edJson);
        //index首页左上logo
        session.setAttribute("logo", logo);
        model.addAttribute("dianpu", dianpu);

        //淘淘快报
        model.addAttribute("taotaokb",dblist );
        //左下广告位
        model.addAttribute("leftbottom",leftbottom );
        return "index";
    }
}
