package com.portal.service;



import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbContent;

import java.util.List;

public interface ContentService {
    List<TbContent> getContentList(long contentCid);

}
