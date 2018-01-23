package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import com.alibaba.fastjson.JSON;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.annotation.PostAction;

/**
 * 用户接口
 */
@Controller("user")
public class UserController extends V1BaseController{
    @GetAction("login")
    public Object login(){
        return JSON.toJSONString(v1BaseBean);
    }

    @PostAction("login")
    public Object _login(){
        return "登录";
    }

    @GetAction("reg")
    public Object reg(){
        return "{\"msg\":\"登录reg接口\"}";
    }

    @PostAction("reg")
    public Object _reg(){
        return "注册";
    }

    @GetAction("logout")
    public Object logout(){
        return "退出登录";
    }



}
