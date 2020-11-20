package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.util.CookieUtils;
import com.common.util.JsonUtils;
import com.portal.service.OrderService;
import com.taotao.pojo.CartItem;
import com.taotao.pojo.Order;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbUser;
import org.joda.time.DateTime;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("order")
public class OrderController {
    @RequestMapping("/order-cart")
    public String showOrderCart(HttpServletRequest request, HttpServletResponse response, Model model) {
        //取购物车商品列表
        List<CartItem> list = null;
        String cartJson = CookieUtils.getCookieValue(request, "TT_CART", true);
        if (cartJson == null) {
            new ArrayList<>();
        }
        //把json转换成商品列表
        try {
            list = JsonUtils.jsonToList(cartJson, CartItem.class);

        } catch (Exception e) {
            e.printStackTrace();
        }


        //传递给页面
        model.addAttribute("cartList", list);
        return "order-cart";    }


        /**
         * 添加订单
         */
        @Reference
        private OrderService orderService;
        @RequestMapping("/create")
        public String createOrder(Order order, Model model, HttpServletRequest request, HttpServletResponse response) {
            try {
                TaotaoResult result=orderService.createOrder(order,
                        order.getOrderItems(),
                        order.getOrderShipping());

                TbUser users=(TbUser) request.getAttribute("user");
                System.out.println("userid"+users.getId());
                order.setUserId(users.getId());
                order.setBuyerNick(users.getUsername());
                //添加订单 返回订单id
                Long orderId =(Long) result.getData();
                model.addAttribute("orderId", orderId+"");
                model.addAttribute("payment", order.getPayment());
                model.addAttribute("date", new DateTime().plusDays(3).toString("yyyy-MM-dd"));
                //清空购物车
                CookieUtils.deleteCookie(request, response, "TT_CART");
                return "success";
            } catch (Exception e) {
                e.printStackTrace();
                return "error/exception";


            }


}}
