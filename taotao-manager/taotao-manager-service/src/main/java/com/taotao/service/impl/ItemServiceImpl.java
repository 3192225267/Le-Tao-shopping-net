package com.taotao.service.impl;

import com.common.pojo.EUDataGridResult;
import com.common.pojo.TaotaoResult;
import com.common.pojo.TreeNode;
import com.common.util.IDUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.taotao.mapper.TbItemCatMapper;
import com.taotao.mapper.TbItemDescMapper;
import com.taotao.mapper.TbItemMapper;
import com.taotao.mapper.TbItemParamItemMapper;
import com.taotao.pojo.*;
import com.taotao.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    private TbItemMapper tm;

    @Resource
    private TbItemCatMapper tcm;

    @Resource
    private TbItemDescMapper tdm;

    @Resource
    private TbItemParamItemMapper tbim;
    @Override
    public TbItem getItemByid(long itemid) {

        TbItem item= tm.selectByPrimaryKey(itemid);

        return item;
    }

    @Override
    public EUDataGridResult getpage(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<TbItem> list= tm.selectByExample(new TbItemExample());
        PageInfo<TbItem> info=new PageInfo<>(list);
        EUDataGridResult er=new EUDataGridResult();
        er.setTotal(info.getTotal());
        er.setRows(info.getList());
        return er;
    }

    @Override
    public List<TreeNode> getItemCatList(long parentId) {

        //SELECT * FROM `tb_item_cat` WHERE parent_id=24;
        List<TreeNode> list=new ArrayList<>();
        TbItemCatExample example=new TbItemCatExample();
        TbItemCatExample.Criteria criteria=example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        List<TbItemCat> ilist=tcm.selectByExample(example);

        for (int i = 0; i < ilist.size(); i++) {
            TreeNode t=new TreeNode();
            t.setId(ilist.get(i).getId());
            t.setText(ilist.get(i).getName());
            t.setState(ilist.get(i).getIsParent()?"closed":"open");
            list.add(t);
        }
        return list;
    }

    @Override
    public TaotaoResult addItem(TbItem item, TbItemDesc itemDesc,String itemParams) {

        /*System.out.println("itemDesc"+itemDesc);*/
        try {
            //生成商品id
            //可以使用redis的自增长key，在没有redis之前使用时间+随机数策略生成
            Long itemId = (long)(IDUtils.genItemId());
            item.setId(itemId);
            //补全不完整的字段
            item.setStatus((byte) 1);
            Date date = new Date();
            item.setCreated(date);
            item.setUpdated(date);
            //把数据插入到商品表
            tm.insert(item);
            //添加商品描述
            itemDesc.setId(itemId);
            itemDesc.setItemId(itemId);
            itemDesc.setCreated(date);
            itemDesc.setUpdated(date);
            //商品规格参数 增加
            TbItemParamItem p=new TbItemParamItem();
            p.setId(itemId);
            p.setItemId(itemId);
            p.setCreated(new Date());
            p.setParamData(itemParams);
            p.setUpdated(new Date());
            tbim.insert(p);


            //把数据插入到商品描述表
            tdm.insert(itemDesc);

        } catch (Exception e) {
            e.printStackTrace();
            return TaotaoResult.build(500, "商品增加错误");
        }

        return TaotaoResult.ok();


    }
    //商品规格信息表
    @Autowired
    private TbItemParamItemMapper tpm;
    @Override
    public TaotaoResult deleteItem(long id) {
        //删除三个表
        TaotaoResult t=null;
        try {
            tdm.deleteByPrimaryKey(id);//描述
            TbItemParamItemExample example=new TbItemParamItemExample();
            TbItemParamItemExample.Criteria criteria=example.createCriteria();
            criteria.andItemIdEqualTo(id);
            tpm.deleteByExample(example);
            tm.deleteByPrimaryKey(id);//删除商品表
            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"删除商品错误");
        }


    }

    @Override
    public TaotaoResult getdesc(long id) {
        TbItemDesc desc=tdm.selectByPrimaryKey(id);
        return TaotaoResult.ok(desc);
    }


    @Override
    public TaotaoResult updateItem(TbItem item, TbItemDesc itemDesc) {

        try {
            //item new
            TbItem it=tm.selectByPrimaryKey(item.getId());
            //its
            TbItemDesc its=tdm.selectByPrimaryKey(item.getId());
            //商品更新时间
            item.setUpdated(new Date());
            item.setCreated(it.getCreated());
            item.setStatus(it.getStatus());
            tm.updateByPrimaryKeySelective(item);
            if(its!=null){
                itemDesc.setId(its.getId());
                //更新商品描述
                itemDesc.setUpdated(new Date());
                itemDesc.setItemId(item.getId());
                itemDesc.setCreated(new Date());//修改时间
                tdm.updateByPrimaryKeyWithBLOBs(itemDesc);
            }

            return TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();
            return TaotaoResult.build(500,"更新商品错误");
        }


    }
}
