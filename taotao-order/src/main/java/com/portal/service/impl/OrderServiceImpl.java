package com.portal.service.impl;

import com.order.dao.JedisClient;

import com.portal.service.OrderService;
import com.taotao.mapper.TbOrderItemMapper;
import com.taotao.mapper.TbOrderMapper;
import com.taotao.mapper.TbOrderShippingMapper;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbOrder;
import com.taotao.pojo.TbOrderItem;
import com.taotao.pojo.TbOrderShipping;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.util.Date;
import java.util.List;

@com.alibaba.dubbo.config.annotation.Service
public class OrderServiceImpl implements OrderService {
    /**
     * 订单表
     */
    @Autowired
    private TbOrderMapper orderMapper;
    /**
     * 订单明细
     */
    @Autowired
    private TbOrderItemMapper orderItemMapper;
    /**
     * 物流表
     */
    @Autowired
    private TbOrderShippingMapper orderShippingMapper;

    @Autowired
    private JedisClient jedisClient;

    @Value("${ORDER_GEN_KEY}")
    private String ORDER_GEN_KEY;
    @Value("${ORDER_INIT_ID}")
    private String ORDER_INIT_ID;
    @Value("${ORDER_DETAIL_GEN_KEY}")
    private String ORDER_DETAIL_GEN_KEY;


    @Override
    public TaotaoResult createOrder(TbOrder order, List<TbOrderItem> itemList, TbOrderShipping orderShipping) {
//向订单表中插入记录
        //获得订单号 第一次肯定没有 ，后面就不会进if了
        String string = jedisClient.get(ORDER_GEN_KEY);
        if (StringUtils.isBlank(string)) {//100544
            jedisClient.set(ORDER_GEN_KEY, ORDER_INIT_ID);
        }
        //自增长的 值 //100545  订单id 从 100544开始
        long orderId = jedisClient.incr(ORDER_GEN_KEY);
        //补全pojo的属性
        order.setId(orderId);
        //状态：1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭
        order.setStatus(1);
        Date date = new Date();
        order.setCreateTime(date);
        order.setUpdateTime(date);
        //0：未评价 1：已评价
        order.setBuyerRate(0);
        //向订单表插入数据
        orderMapper.insert(order);
        //插入订单明细 itemlist是购物车
        for (TbOrderItem tbOrderItem : itemList) {
            //补全订单明细
            //取订单明细id
            long orderDetailId = jedisClient.incr(ORDER_DETAIL_GEN_KEY);
            System.out.println("orderDetailId:"+orderDetailId);
            tbOrderItem.setId(orderDetailId + "");
            tbOrderItem.setOrderId(orderId + "");
            //向订单明细插入记录
            orderItemMapper.insert(tbOrderItem);
        }
        //插入物流表
        //补全物流表的属性
       /* orderShipping.setOrderId(orderId + "");
        orderShipping.setCreated(date);
        orderShipping.setUpdated(date);
        orderShippingMapper.insert(orderShipping);*/

        return TaotaoResult.ok(orderId);

    }
}
