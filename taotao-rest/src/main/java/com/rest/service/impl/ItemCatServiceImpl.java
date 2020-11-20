package com.rest.service.impl;

import com.rest.dao.JedisClient;
import com.rest.pojo.CatNode;
import com.rest.pojo.CatResult;
import com.rest.service.ItemCatService;
import com.taotao.mapper.TbItemCatMapper;
import com.taotao.pojo.TbItemCat;
import com.taotao.pojo.TbItemCatExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ItemCatServiceImpl implements ItemCatService {
    @Autowired
    private TbItemCatMapper itemCatMapper;

    @Override
    public CatResult getItemCatList() {
        CatResult catResult = new CatResult();
        //查询分类列表
        catResult.setData(getCatList(0));
        return catResult;

}



    /**
     * 查询分类列表
     * <p>Title: getCatList</p>
     * <p>Description: </p>
     * @param parentId
     * @return
     */
    private List<?> getCatList(long parentId) {
        //创建查询条件
        TbItemCatExample example = new TbItemCatExample();
        TbItemCatExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        //执行查询
        List<TbItemCat> list = itemCatMapper.selectByExample(example);
        //返回值list
        List resultList = new ArrayList<>();
        //向list中添加节点
        for (TbItemCat tbItemCat : list) {
            //判断是否为父节点
            if (tbItemCat.getIsParent()) {
                System.out.println("tbItemCat.getIsParent()"+tbItemCat.getIsParent());
                CatNode catNode = new CatNode();
                if (parentId == 0) {
                    catNode.setName("<a href='/products/"+tbItemCat.getId()+".html'>"+tbItemCat.getName()+"</a>");
                   /* System.out.println("第一父类"+"tbItemCat.getId()"+tbItemCat.getId()+"catNode.getName()"+catNode.getName());*/
                } else {
                    catNode.setName(tbItemCat.getName());
                    /*System.out.println("第二父类"+catNode.getName());*/
                }
                catNode.setUrl("/products/"+tbItemCat.getId());
                catNode.setItem(getCatList(tbItemCat.getId()));

                resultList.add(catNode);
                //如果是叶子节点
            } else {
                resultList.add("/products/"+tbItemCat.getId()+"|" + tbItemCat.getName());
                /*System.out.println("子类"+"/tbItemCat.getId()/"+tbItemCat.getId()+"tbItemCat.getName()"+tbItemCat.getName());*/
            }
        }
        return resultList;
    }

}


