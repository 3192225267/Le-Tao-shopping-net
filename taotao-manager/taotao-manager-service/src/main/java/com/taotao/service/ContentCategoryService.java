package com.taotao.service;

import com.common.pojo.TaotaoResult;
import com.common.pojo.TreeNode;

import java.util.List;

/**
 * 网站内容管理
 */
public interface ContentCategoryService {

    //查看所有内容
    public List<TreeNode> getCategoryList(long parentId);

    //增加内容分类
    public TaotaoResult insertContentCategory(long parentId, String name);
    //删除
    public TaotaoResult del(long id);
    //重命名节点
    public TaotaoResult updatename(long id, String name);
}
