package com.sso.service.impl;

import com.common.pojo.TaotaoResult;
import com.common.util.CookieUtils;
import com.common.util.IDUtils;
import com.common.util.JsonUtils;
import com.sso.dao.JedisClient;
import com.sso.service.UserService;
import com.taotao.mapper.TbUserMapper;
import com.taotao.pojo.TbUser;
import com.taotao.pojo.TbUserExample;
import org.apache.commons.lang3.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private TbUserMapper tm;


    //查询该账号是否已被注册，被注册返回false，未注册返回ture
    @Override
    public TaotaoResult UserClick(String param, Integer type) {
        TbUserExample example=new TbUserExample();
        TbUserExample.Criteria criteria=example.createCriteria();

        switch (type){
            case 1:
                criteria.andUsernameEqualTo(param);
                break;
            case 2:
                criteria.andPhoneEqualTo(param);

                break;

            case 3:
                criteria.andEmailEqualTo(param);
                break;

        }
        List<TbUser> list=tm.selectByExample(example);
        if (list!=null&&list.size()>0){
            return TaotaoResult.ok(false);
        }



        return TaotaoResult.ok(true);
    }
    //注册
    @Override
    public TaotaoResult createUser(TbUser tbUser) {
        //补全前台未填写的字段
        tbUser.setId(IDUtils.genItemId());
        tbUser.setCreated(new Date());
        tbUser.setUpdated(new Date());
        //md5加密
        tbUser.setPassword(DigestUtils.md5DigestAsHex(tbUser.getPassword().getBytes()));
        tm.insert(tbUser);
        return TaotaoResult.ok();
    }



    /**
     * 存入redis 中的key
	 */
    @Value("${REDIS_USER_SESSION_KEY}")
    private String REDIS_USER_SESSION_KEY;
    /**
     * 失效时间
     */
    @Value("${SSO_SESSION_EXPIRE}")
    private Integer SSO_SESSION_EXPIRE;

    @Autowired
    private JedisClient jedisClient;

    @Override
    public TaotaoResult UserLogin(String username, String password, HttpServletRequest request, HttpServletResponse response) {
        TbUserExample example=new TbUserExample();
        System.out.println("username"+username+"userpwd"+password);
        TbUserExample.Criteria criteria=example.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<TbUser>list=tm.selectByExample(example);
        //如果没有此用户名
        if (list==null||list.size()==0){
            TaotaoResult.build(400,"用户名或密码错误");

    }
    TbUser user=list.get(0);
        //对比密码，看看密码是否正确
        if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
            return TaotaoResult.build(400, "用户名或密码错误");
        }
        //生成token码——产生一段不会重复的随机数
        String token=UUID.randomUUID().toString();

        //保存用户前，先把密码清空
        user.setPassword(null);
        //把用户写入redis
        jedisClient.set(REDIS_USER_SESSION_KEY+":"+token,JsonUtils.objectToJson(user));
        //设置session过期时间
        jedisClient.expire(REDIS_USER_SESSION_KEY+":"+token,SSO_SESSION_EXPIRE);

        CookieUtils.setCookie(request,response,"TT_TOKEN",token,60*30);

        return TaotaoResult.ok(token);

    }

    @Override
    public TaotaoResult UserToken(String token) {
        //根据token从redis中查询信息
        String json =jedisClient.get(REDIS_USER_SESSION_KEY+":"+token);
        //判断是否为空
        if(StringUtils.isBlank(json)){
        return TaotaoResult.build(400,"账号信息过期，请重新登录");
        }
        //更新过期时间
        jedisClient.expire(REDIS_USER_SESSION_KEY+":"+token,SSO_SESSION_EXPIRE);
        return TaotaoResult.ok(JsonUtils.jsonToPojo(json,TbUser.class));
    }

    @Override
    public TaotaoResult delUserToken(String token) {
        //根据token从redis里查询用户信息
        String json=jedisClient.get(REDIS_USER_SESSION_KEY+":"+token);
        //判断是否为空
        if(StringUtils.isBlank(token)){
           return TaotaoResult.build(400,"你还没有登录");
        }
        //删除redis
        jedisClient.del(REDIS_USER_SESSION_KEY+":"+token);
        //返回用户信息
        return TaotaoResult.ok();
    }


}
