package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import cn.anline.zone.serve.AnnBase;
import cn.anline.zone.serve.console.v1.bean.V1BaseBean;
import cn.anline.zone.serve.console.v1.service.UserService;
import com.alibaba.fastjson.JSON;
import org.osgl.mvc.annotation.Before;

import javax.inject.Inject;

/**
 * API 基类 所有请求地址 继承到 /api/console/v1下面
 */

@Controller("/api/console/v1")
public class V1BaseController extends AnnBase {

    @Inject V1BaseBean v1BaseBean;

    @Inject UserService userService;


    //登录和注册的接口不拦截 Token验证
    @Before(except = {"signin","signup"})
    public void   __init__(String user){
//        拦截登录 此处可做Token判断
        if (userService.tokenVerify()){
            v1BaseBean.setMsg("你好"+user);
        }else {
            v1BaseBean.setStatus(-1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("token无效,请重新登录！");
            throw Controller.Util.json(v1BaseBean);
        }
    }
}
