package com.portal.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taotao.mapper.TbItemCatMapper;
import com.taotao.pojo.TbItemCat;
import com.taotao.pojo.TbItemCatExample;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
@Service
public class Item_CatService implements com.portal.service.Item_CatService {
    @Autowired
    private TbItemCatMapper tbItemCatMapper;
    @Override
    public List<TbItemCat> getParent(long parent) {
        TbItemCatExample example=new TbItemCatExample();
        TbItemCatExample.Criteria criteria=example.createCriteria();
        criteria.andParentIdEqualTo(parent);
        PageHelper.startPage(0,16);
        List<TbItemCat>list=tbItemCatMapper.selectByExample(example);
        PageInfo<TbItemCat> info=new PageInfo<TbItemCat>(list);
        return info.getList();
    }
}
