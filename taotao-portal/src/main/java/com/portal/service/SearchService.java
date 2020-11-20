package com.portal.service;


import com.taotao.pojo.TaotaoResult;

public interface SearchService {
    TaotaoResult search(String queryString, int page, int rows) throws Exception;
}
