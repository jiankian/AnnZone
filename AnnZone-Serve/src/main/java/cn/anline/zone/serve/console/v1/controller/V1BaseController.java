package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;
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

    @Inject V1BaseBean v1BaseBean;

    @Inject UserService userService;

    /**
     * 用户ID 从Token获取
     */
    protected String __uid;
    /**
     * 用户名 从Token获取
     */
    protected String __username;

    /**
     * 用户Bean
     */
    protected UserBean __user;

    public String get__uid() {
        return __uid;
    }

    public void set__uid(String __uid) {
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

    /**
     * 登录和注册的接口不拦截 Token验证 写方法名。。。
     */
    @Before(except = {"signin","signup","verify","token"})
    public void   __init__(){
        //拦截登录 此处可做Token判断
        String token = context.req().header("ann_token");
        //System.out.println("token获取值："+token);
        if ( null == token || token.trim().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
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
            this.__username = String.valueOf(jwt.get("username")).trim();
            this.__uid = String.valueOf(jwt.getId());
            this.__user = JSON.parseObject(JSON.toJSONString(jwt.get("user")),UserBean.class);
        }catch (Exception e)
        {
            //e.printStackTrace();
            v1BaseBean.setStatus(5);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("您的Token无效，请检查或重新登录获取！");
            throw  json(v1BaseBean);
        }
    }
}
