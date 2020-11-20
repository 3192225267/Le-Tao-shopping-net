package com.taotao.service.impl;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.common.util.IDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taotao.mapper.TbContentMapper;
import com.taotao.pojo.TbContent;
import com.taotao.pojo.TbContentExample;
import com.taotao.service.ContentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class ContentServiceImpl implements ContentService {
    @Resource
    private TbContentMapper tcm;

    @Override
    public EUDataGridResult getItemList(int page, int rows, long categoryId) {
        //SELECT * FROM tb_content WHERE category_id=89;
        TbContentExample ex=new TbContentExample();
        TbContentExample.Criteria cx=ex.createCriteria();
        cx.andCategoryIdEqualTo(categoryId);
        PageHelper.startPage(page,rows);
        List<TbContent> tlist=tcm.selectByExample(ex);
        PageInfo<TbContent> info=new PageInfo<>(tlist);
        EUDataGridResult e=new EUDataGridResult();
        e.setTotal(info.getTotal());
        e.setRows(info.getList());
        return e;
    }

    @Override
    public TaotaoResult addItem(TbContent tbContent) {
        try{
            tbContent.setId(IDUtils.genItemId());
           tbContent.setCreated(new Date());
           tbContent.setUpdated(new Date());
           tcm.insert(tbContent);
            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"add错误");
        }

    }

    @Override
    public TaotaoResult deleteContent(long ids) {

        try{
             tcm.deleteByPrimaryKey(ids);

            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"del错误");
        }

    }

    @Override
    public TaotaoResult updateContent(TbContent content) {

        try{
            content.setUpdated(new Date());
            tcm.updateByPrimaryKey(content);
            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"update错误");
        }

    }

    @Override
    public TbContent getbyid(long ids) {
        return tcm.selectByPrimaryKey(ids);
    }
}
