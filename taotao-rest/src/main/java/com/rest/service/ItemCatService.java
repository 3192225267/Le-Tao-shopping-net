package com.rest.service;

import com.rest.pojo.CatResult;
import com.taotao.mapper.TbItemCatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


public interface ItemCatService {

    public CatResult getItemCatList() ;

}
