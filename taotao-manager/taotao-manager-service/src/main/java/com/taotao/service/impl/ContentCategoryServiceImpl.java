package com.taotao.service.impl;

import com.common.pojo.TaotaoResult;
import com.common.pojo.TreeNode;
import com.common.util.IDUtils;
import com.taotao.mapper.TbContentCategoryMapper;
import com.taotao.pojo.TbContentCategory;
import com.taotao.pojo.TbContentCategoryExample;
import com.taotao.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class ContentCategoryServiceImpl implements ContentCategoryService{
    @Autowired
    private TbContentCategoryMapper cm;
    @Override
    public List<TreeNode> getCategoryList(long parentId) {
        //根据parentid查询节点列表
        TbContentCategoryExample example = new TbContentCategoryExample();
        TbContentCategoryExample.Criteria criteria = example.createCriteria();
        criteria.andParentIdEqualTo(parentId);
        //数据库结果
        List<TbContentCategory> tlist= cm.selectByExample(example);
        //返回结果
        List<TreeNode> resultList = new ArrayList<>();
        for (TbContentCategory t:tlist
             ) {
            TreeNode tn=new TreeNode();
            tn.setText(t.getName());
            tn.setId(t.getId());
            tn.setState(t.getIsParent()?"closed":"open");
            resultList.add(tn);
        }
        return resultList;
    }

    @Override
    public TaotaoResult insertContentCategory(long parentId, String name) {

        try{
            //增加新对象
            TbContentCategory tc=new TbContentCategory();

            tc.setId(IDUtils.genItemId());
            System.out.println("tc.getId()"+tc.getId());
            tc.setCreated(new Date());
            tc.setIsParent(false);
            tc.setName(name);
            tc.setSortOrder(1);
            tc.setStatus(1);
            tc.setParentId(parentId);
            tc.setUpdated(new Date());
            cm.insert(tc);//增加内容分类
            //父类对象
            TbContentCategory tcparent=cm.selectByPrimaryKey(parentId);

            if(!tcparent.getIsParent()){ //是   1
                //修改父类的 是不是父类属性 如果已经1 不改 0改1
                tcparent.setIsParent(true);
                cm.updateByPrimaryKey(tcparent);
            }

            return  TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();;
            return  TaotaoResult.build(500,"内容分类增加错误");
        }

    }

    /*


            #id =100
        #parent_id =98
        SELECT * FROM `tb_content_category` WHERE id = 100;
        #删除 id=100
        DELETE FROM  tb_content_category  WHERE id=100;
        #查询父类还有没有子类 如果没有结果
        SELECT * FROM `tb_content_category` WHERE parent_id = 98

        #查到父类
        SELECT * FROM `tb_content_category` WHERE id = 98
        #更新
        UPDATE SET     `tb_content_category`  is_parent=0  WHERE id = 98
     */
    @Override
    public TaotaoResult del(long id) {
        try{
            TbContentCategory tc=cm.selectByPrimaryKey(id);//根据id查找
            long parendid=tc.getParentId();//删除的对象的父类
            cm.deleteByPrimaryKey(id);//删除
            //根据id得到对象

            TbContentCategoryExample example=new TbContentCategoryExample();
            TbContentCategoryExample.Criteria criteria=example.createCriteria();
            criteria.andParentIdEqualTo(parendid);
            List<TbContentCategory> tlist=cm.selectByExample(example);//根据父类id查到所有对象

            if(tlist==null || tlist.size()==0){ //一条都没有

                //根据父类id查询对象
                TbContentCategory t=cm.selectByPrimaryKey(parendid);//98
                t.setIsParent(false);
                cm.updateByPrimaryKey(t);
            }

            return  TaotaoResult.ok();
        }catch (Exception ex){
            ex.printStackTrace();;
            return  TaotaoResult.build(500,"内容分类增加错误");
        }

    }
    //修改节点名称
    @Override
    public TaotaoResult updatename(long id, String name) {
        TbContentCategory tc=cm.selectByPrimaryKey(id);
        tc.setName(name);
        cm.updateByPrimaryKey(tc);
        return TaotaoResult.ok();
    }

}
