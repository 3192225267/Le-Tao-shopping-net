package com.taotao.controller;

import com.taotao.mapper.TbItemMapper;
import com.taotao.mapper.TbOrderMapper;
import com.taotao.mapper.TbUserMapper;
import com.taotao.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class newController {
    @Autowired
    private TbItemMapper tbItemMapper;

    @Autowired
    private TbOrderMapper tbOrderMapper;

    @Autowired
    private TbUserMapper tbUserMapper;
    @RequestMapping("newindex")
    public String newindex(){
        return "main";
    }


    @RequestMapping("initmain")
    public String init(Model model){
        //算出一周前的今天
        Calendar c = Calendar.getInstance();
        //过去七天
        c.setTime(new Date());
        c.add(Calendar.DATE, - 7);
        Date d =  c.getTime();
        //查询最近一周新增的商品
        TbItemExample example=new TbItemExample();
        TbItemExample.Criteria criteria=example.createCriteria();
        criteria.andCreatedBetween(d,new Date());
        List<TbItem>items=tbItemMapper.selectByExample(example);
       //商品总和
        int itemnum=0;
        for (TbItem t:items
             ) {
            //计算新增商品总和
            itemnum++;

        }

        //最近计算最近一周总成交额
        TbOrderExample orderexample1=new TbOrderExample();
        TbOrderExample.Criteria ordercriteria1=orderexample1.createCriteria();
        ordercriteria1.andCreateTimeBetween(d,new Date());
        List<TbOrder>orders=tbOrderMapper.selectByExample(orderexample1);
        //最近一周订单数
        int ordernum=0;
        //最近一周成交额
        Double Amount=0.0;
        for (TbOrder order:orders
             ) {


            //计算订单总数
            ++ordernum;
            Double a=Double.parseDouble(order.getPayment());
            //计算最近一周总成交额
            Amount=Amount+a;
        }



        //最近一周新增用户
        TbUserExample userexample=new TbUserExample();
        TbUserExample.Criteria usercriteria=userexample.createCriteria();
        usercriteria.andCreatedBetween(d,new Date());
        List<TbUser>users=tbUserMapper.selectByExample(userexample);
        int usernum=0;
        for (TbUser user:users
             ) {
            //计算新增用户
            ++usernum;
        }


        //成交额视图
        //算出十一周来，每周的营业总额


        Calendar calendar = Calendar.getInstance();
        // 过去七天
        int a = 7;
        int ss=11;
        int aa=10;
        List<Date>  list = new ArrayList<Date>();
        while (a <= 84) {

            calendar.setTime(new Date());
            calendar.add(Calendar.DATE, -a);
            Date date = calendar.getTime();
            list.add(date);
            a = a + 7;
        }
        List<TbOrder> orderlist=null;
       for (int i=0;i<11;i++) {
            TbOrderExample example1=new TbOrderExample();
            TbOrderExample.Criteria criteria1=example1.createCriteria();
            criteria.andCreatedBetween(list.get(ss), list.get(aa));
            orderlist= tbOrderMapper.selectByExample(example1);
            --ss;
            --aa;
        }



        //取出每周总销售额并将String类型的销售额转换为double类型
        List<Double>dlist=new ArrayList<Double>();
        for (int i=0;i<orderlist.size();i++){
            TbOrder order=orderlist.get(i);
           double dd=Double.parseDouble( order.getPayment());
           dlist.add(dd);
        }
        //再将上面的double类型转换为int传给前台
        List<Integer>ilist=new ArrayList<Integer>();
        int paymentnum=0;
        for (int i=0;i<dlist.size();i++){
            double dle=dlist.get(i);
            int ii=(int)dle;
            paymentnum=paymentnum+ii;

            ilist.add(ii);
        }

        //顶部数据
        model.addAttribute("ordernum",ordernum);
        model.addAttribute("itemnum",itemnum);
        model.addAttribute("Amount",Amount);
        model.addAttribute("usernum",usernum);

        //最近十一周的数据
         model.addAttribute("order1",ilist.get(0));
       model.addAttribute("order2",ilist.get(1));
        model.addAttribute("order3",ilist.get(2));
        model.addAttribute("order4",ilist.get(3));
        model.addAttribute("order5",ilist.get(4));
        model.addAttribute("order6",ilist.get(5));
        model.addAttribute("order7",ilist.get(6));
        model.addAttribute("order8",ilist.get(7));
        model.addAttribute("order9",ilist.get(8));
        model.addAttribute("order10",ilist.get(9));
        model.addAttribute("order11",ilist.get(10));
        model.addAttribute("paymentnum",paymentnum);
        return "main";
    }
}
