package com.taotao.service.impl;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.common.util.IDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taotao.mapper.TbItemParamMapper;
import com.taotao.pojo.TbItemParam;
import com.taotao.pojo.TbItemParamExample;
import com.taotao.service.ItemParamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ItemParamServiceImpl implements ItemParamService {
    @Autowired
    private TbItemParamMapper tbm;

    @Override
    public TaotaoResult getItemParamByCid(long cid) {

        // SELECT * FROM tb_item_param WHERE item_cat_id=560

        TbItemParamExample example = new TbItemParamExample();
        TbItemParamExample.Criteria criteria = example.createCriteria();
        criteria.andItemCatIdEqualTo(cid);
        List<TbItemParam> list = tbm.selectByExampleWithBLOBs(example);
        if (list != null && list.size() != 0) {
            System.out.println(list.get(0).getParamData()+"ss");
            return TaotaoResult.ok(list.get(0));
        }
        return TaotaoResult.ok();
    }

    @Override
    public TaotaoResult saveParam(TbItemParam itemParam) {

        itemParam.setId(IDUtils.genItemId());
        tbm.insert(itemParam);
        return TaotaoResult.ok();
    }

    @Override
    public EUDataGridResult getItemList(int page, int rows) {

        PageHelper.startPage(page,rows);
        TbItemParamExample example=new TbItemParamExample();
        List<TbItemParam> list=tbm.selectByExampleWithBLOBs(example);
        PageInfo<TbItemParam> info=new PageInfo<>(list);
        EUDataGridResult result=new EUDataGridResult();
        result.setTotal(info.getTotal());
        result.setRows(info.getList());
        return result;
    }

    @Override
    public TaotaoResult deleteItemparam(long ids) {
        try{
            tbm.deleteByPrimaryKey(ids);
            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"删除错误");
        }


    }
}
