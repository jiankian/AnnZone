package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;

import act.db.ebean2.EbeanDao;
import act.inject.param.NoBind;
import cn.anline.zone.serve.AnnBase;
import cn.anline.zone.serve.console.v1.bean.UserBean;
import cn.anline.zone.serve.console.v1.bean.V1BaseBean;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_user;
import cn.anline.zone.serve.console.v1.service.UserService;
import com.alibaba.fastjson.JSON;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.osgl.mvc.annotation.Before;
import org.osgl.mvc.annotation.ResponseStatus;
import org.osgl.util.C;

import javax.inject.Inject;
import java.util.ArrayList;

/**
 * API 基类 所有请求地址 继承到 /api/console/v1下面
 */

@Controller("/api/console/v1")
public class V1BaseController extends AnnBase {

    @Inject
    V1BaseBean v1BaseBean;

    @Inject
    UserService userService;

    /**
     * 用户表DAO
     */
    @Inject
    EbeanDao<Long,Ann_user> userEbeanDao;

    /**
     * 用户ID 从Token获取
     */
    @NoBind
    protected int __uid;

    /**
     * 用户名 从Token获取
     */
    @NoBind
    protected String __username;

    /**
     * 用户Bean
     */
    @NoBind
    protected UserBean __user;

    public int get__uid() {
        return __uid;
    }

    public void set__uid(int __uid) {
        this.__uid = __uid;
    }

    public String get__username() {
        return __username;
    }

    public void set__username(String __username) {
        this.__username = __username;
    }

    public UserBean get__user() {
        return __user;
    }

    public void set__user(UserBean __user) {
        this.__user = __user;
    }

    //API下的统一响应头处理
    @Before
    public void __header__(){
        //配置API下的请求允许跨域 后边指定的域名可以访问跨域资源
        context.resp().addHeader("Access-Control-Allow-Origin","*");
        context.resp().addHeader("Access-Control-Allow-Methods","ALL");
    }
    /**
     * 登录和注册的接口不拦截 Token验证 写方法名。。。
     */
    @Before(except = {"signin","signup","verify","token", "passwordForget", "passwordReset"})
    public void   __init__(){
        //拦截登录 此处可做Token判断
        System.out.println("获取参数：");
        System.out.println(JSON.toJSONString(context.req().paramNames()));
        String token = context.req().header("ann_token");
        //System.out.println("token获取值："+token);
        if ( null == token || token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setExp(-1);
            v1BaseBean.setMsg("Token不能为空！");
            throw json(v1BaseBean);
        }
        try {
            Claims jwt = Jwts.parser()
                    .setSigningKey(Base64.encodeBase64(Constant.key.getBytes()))
                    .parseClaimsJws(token.trim())
                    .getBody();
            //System.out.println("全局验证的过期时间！");
            //System.out.println(jwt.getExpiration());
            //System.out.println(jwt.get("username").toString());
            //System.out.println("全局装载的对象：");
            //System.out.println(JSON.toJSONString(jwt.get("user")));
            String jwtUsername = String.valueOf(jwt.get("username")).trim();
            String jwtUid = String.valueOf(jwt.getId());
            UserBean jwtUser= JSON.parseObject(JSON.toJSONString(jwt.get("user")),UserBean.class);
            Ann_user dbFindUser = userEbeanDao.findOneBy("id",jwtUser.getId());
            System.out.println("dbFindUser");
            System.out.println(jwtUser.getId());
            System.out.println(JSON.toJSONString(dbFindUser));
            if (null != dbFindUser){
                System.out.println("找到了用户"+jwtUsername);
                context.login(jwtUsername);
                context.param("uid",jwtUid);
                context.cache("user",jwtUser);
                context.attribute("user",jwtUser);
                this.__username = jwtUsername;
                this.__uid = StringUtils.isNumeric(jwtUid)?Integer.valueOf(jwtUid):0;
                this.__user = jwtUser;
                if (!String.valueOf(dbFindUser.getStatus()).equals("0")){
                    System.out.println("用户无权限");
                    v1BaseBean.setStatus(9);
                    v1BaseBean.setResult(0);
                    v1BaseBean.setExp(-1);
                    v1BaseBean.setMsg("您的Token无效，所在用户被封号");
                    throw  json(v1BaseBean);
                }
            }else {
                System.out.println("没有找到用户");
                v1BaseBean.setStatus(8);
                v1BaseBean.setResult(0);
                v1BaseBean.setExp(-1);
                v1BaseBean.setMsg("您的Token无效，所在用户不存在！");
                throw  json(v1BaseBean);
            }

        }catch (Exception e)
        {
//            e.printStackTrace();
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setExp(-1);
            v1BaseBean.setMsg("您的Token无效或用户已被封号，请检查或重新登录获取！");
            throw  json(v1BaseBean);
        }
    }
}
