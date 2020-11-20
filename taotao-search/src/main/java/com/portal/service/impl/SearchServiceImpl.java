package com.portal.service.impl;

import com.portal.service.SearchService;
import com.search.dao.SearchDao;

import com.taotao.mapper.TbItemMapper;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;
import com.taotao.pojo.TbItemExample;
import org.apache.solr.client.solrj.SolrQuery;
import com.taotao.pojo.SearchResult;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
@com.alibaba.dubbo.config.annotation.Service
public class SearchServiceImpl implements SearchService {
    @Resource
    private SearchDao searchDao;
    @Autowired
    private TbItemMapper tbItemMapper;
    @Override
    public TaotaoResult search(String queryString, int page, int rows) throws Exception {
        //创建查询对象
        SolrQuery query = new SolrQuery();
        //设置查询条件
        query.setQuery(queryString);
        //设置分页
        query.setStart((page - 1) * rows);
        query.setRows(rows);
        //设置默认搜素域
        query.set("df", "item_keywords");
        //设置高亮显示
        query.setHighlight(true);
        query.addHighlightField("item_title");
        query.setHighlightSimplePre("<em style=\"color:red\">");
        query.setHighlightSimplePost("</em>");
        //执行查询
        SearchResult searchResult = searchDao.search(query);
        //计算查询结果总页数
        long recordCount = searchResult.getRecordCount();
        long pageCount = recordCount / rows;
        if (recordCount % rows > 0) {
            pageCount++;
        }
        searchResult.setPageCount(pageCount);
        searchResult.setCurPage(page);

        return TaotaoResult.ok(searchResult);
    }



}
