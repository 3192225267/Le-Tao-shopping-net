package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.portal.service.ItemService;
import com.portal.service.SearchService;
import com.taotao.pojo.SearchResult;
import com.taotao.pojo.TaotaoResult;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {
    @Reference
    private SearchService searchService;
    @Reference
    private ItemService itemService;
    @RequestMapping("/search")
    public String search(@RequestParam("q")String queryString, @RequestParam(defaultValue="1")Integer page, Model model) {

        if (queryString != null) {
            try {
                queryString = new String(queryString.getBytes("iso8859-1"), "utf-8");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        System.out.println("seach");
        TaotaoResult result;
        try {
            result = searchService.search(queryString, page, 20);
            SearchResult searchResult = (SearchResult) result.getData();
            //向页面传递参数
            model.addAttribute("query", queryString);
            model.addAttribute("totalPages", searchResult.getPageCount());
            model.addAttribute("itemList", searchResult.getItemList());
            model.addAttribute("page", page);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return "search";

    }
    @RequestMapping("/products/${c}")
    public String searchType(@RequestParam("c")Long cid, @RequestParam(defaultValue="1")Integer page, Model model) {


        TaotaoResult result;
        try {
            result = itemService.getType(cid, page, 20);
            SearchResult searchResult = (SearchResult) result.getData();
            //向页面传递参数
            model.addAttribute("query", cid);
            model.addAttribute("totalPages", searchResult.getPageCount());
            System.out.println("searchResult.getPageCount()"+searchResult.getPageCount());
            model.addAttribute("itemList", searchResult.getItemList());
            System.out.println("searchResult.getItemList()"+searchResult.getItemList());
            model.addAttribute("page", page);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }


        return "search";

    }
}
