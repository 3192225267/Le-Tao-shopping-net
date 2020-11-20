package com.portal.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.common.util.CookieUtils;
import com.common.util.JsonUtils;
import com.portal.service.ItemService;
import com.taotao.pojo.CartItem;
import com.taotao.pojo.TaotaoResult;
import com.taotao.pojo.TbItem;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    /** 分布式 rest
	 */
    @Reference
    private ItemService itemService;

    @RequestMapping("/add/{itemId}")
    public String addCart(@PathVariable Long itemId,
                          @RequestParam(defaultValue="1")Integer num,
                          HttpServletRequest request, HttpServletResponse response) {
        System.out.println("cartadd");
        TaotaoResult result = addCartItem(itemId, num, request, response);
        System.out.println(result+"cart");
        return "redirect:/cart/success.html";//重定向到 下面的controller
    }

    /**
     * 跳转到 购物车添加成功页面
     * 防止刷新页面 提交购物车
     * @return
     */
    @RequestMapping("/success")
    public String showsuccess() {
        System.out.println("cart");
        return "cartSuccess";
    }



    /**
     * 查看购物车
     * @param request
     * @param response
     * @param model
     * @return
     */
    @RequestMapping("/cart")
    public String showCart(HttpServletRequest request, HttpServletResponse response,
                           Model model) {
        List<CartItem> list = getCartItemList(request);
        model.addAttribute("cartList", list);
        return "cart";
    }

    @RequestMapping("/delete/{itemId}")
    public String deleteCart(@PathVariable Long itemId, HttpServletRequest request, HttpServletResponse response) {
        deleteCartItem(itemId, request, response);
        return "redirect:/cart/cart.html";
    }






    /**
         * 添加购物车方法
         * @param itemId
         * @param num
         * @param request
         * @param response
         * @return
         */
        public TaotaoResult addCartItem(long itemId, int num,
        HttpServletRequest request, HttpServletResponse response) {
           try{
               //取商品信息
               CartItem cartItem = null;
               //取购物车商品列表
               List<CartItem> itemList = getCartItemList(request);
               //判断购物车商品列表中是否存在此商品
               for (CartItem cItem : itemList) {
                   //如果存在此商品
                   if (cItem.getId() == itemId) {
                       //增加商品数量
                       cItem.setNum(cItem.getNum() + num);
                       cartItem = cItem;//有此商品替换集合中的商品
                       break;
                   }
               }
               //没有该商品
               if (cartItem == null) {
                   cartItem = new CartItem();
                   //根据商品id查询商品基本信息。
                   TaotaoResult taotaoResult=itemService.getItemBaseInfo(itemId);
                   if (taotaoResult.getStatus() == 200) {
                       TbItem item = (TbItem) taotaoResult.getData();
                       cartItem.setId(item.getId());
                       cartItem.setTitle(item.getTitle());
                       cartItem.setImage(item.getImage() == null ? "":item.getImage().split(",")[0]);
                       cartItem.setNum(num);
                       cartItem.setPrice(item.getPrice());
                   }
                   //添加到购物车列表
                   itemList.add(cartItem);
               }
               //把购物车列表写入cookie 10分钟有效
               CookieUtils.setCookie(request, response, "TT_CART", JsonUtils.objectToJson(itemList),60*10, true);

           }catch (Exception e){
               e.printStackTrace();
               return  TaotaoResult.build(200,"没有此商品");
           }
            return TaotaoResult.ok();
        }
        /**
         * 从cookie中取商品列表
         * <p>Title: getCartItemList</p>
         * <p>Description: </p>
         * @return
         */
        private List<CartItem> getCartItemList(HttpServletRequest request) {
            //从cookie中取商品列表 true 为 utf-8
            String cartJson = CookieUtils.getCookieValue(request, "TT_CART", true);
            if (cartJson == null||cartJson=="") {
                return new ArrayList<>();
            }
            //把json转换成商品列表
            try {
                List<CartItem> list = JsonUtils.jsonToList(cartJson, CartItem.class);
                return list;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return new ArrayList<>();
        }


    @RequestMapping("/update/num/{itemId}/{num}")
    public String update(@PathVariable Long itemId,@PathVariable int num,
                         HttpServletRequest request, HttpServletResponse response) {


        System.out.println(itemId + " " + num);


        List<CartItem> itemList = getCartItemList(request);
        //从列表中找到此商品
        for (CartItem cartItem : itemList) {
            if (cartItem.getId() == itemId) {
                cartItem.setNum(num);
                break;
            }

        }
        //把购物车列表重新写入cookie
        CookieUtils.setCookie(request, response, "TT_CART", JsonUtils.objectToJson(itemList), 60 * 10, true);


        return "redirect:/cart/cart.html";
    } 




        public TaotaoResult deleteCartItem(long itemId, HttpServletRequest request, HttpServletResponse response) {
        //从cookie中取购物车商品列表
        List<CartItem> itemList = getCartItemList(request);
        //从列表中找到此商品
        for (CartItem cartItem : itemList) {
            if (cartItem.getId() == itemId) {
                itemList.remove(cartItem);
                break;
            }

        }
    //把购物车列表重新写入cookie
        CookieUtils.setCookie(request, response, "TT_CART", JsonUtils.objectToJson(itemList), 60 * 10, true);

        return TaotaoResult.ok();

    }
}
