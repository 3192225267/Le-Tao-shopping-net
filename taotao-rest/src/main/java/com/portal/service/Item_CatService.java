package com.portal.service;


import com.taotao.pojo.TbItemCat;

import java.util.List;

public interface Item_CatService {
    List<TbItemCat> getParent(long parent);
}
