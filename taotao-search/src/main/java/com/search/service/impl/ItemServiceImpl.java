package com.search.service.impl;

import com.search.mapper.ItemMapper;
import com.search.service.ItemService;

import com.taotao.pojo.Item;
import com.taotao.pojo.TaotaoResult;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {
    @Autowired
    private ItemMapper itemMapper;
    @Autowired
    private SolrServer solrServer;

    @Override
    public TaotaoResult importAllItems() {
        try {
            //查询商品列表
            List<Item>list=itemMapper.getAll();
            //把信息写入索引库
            for (Item item:list){
                //创建一个solrInputDocument对象
                SolrInputDocument document=new SolrInputDocument();
                document.setField("id",item.getId());
                document.setField("item_title",item.getTitle());
                document.setField("item_sell_point",item.getSell_point());
                document.setField("item_price",item.getPrice());
                document.setField("item_image", item.getImage());
                document.setField("item_category_name", item.getCategory_name());
                document.setField("item_desc", item.getItem_des());
                solrServer.add(document);
            }
            //提交修改
            solrServer.commit();
        }catch (Exception e){
            e.printStackTrace();
            TaotaoResult.build(500,"将数据写入索引库时发生错误");
        }
        return TaotaoResult.ok();
    }
}
