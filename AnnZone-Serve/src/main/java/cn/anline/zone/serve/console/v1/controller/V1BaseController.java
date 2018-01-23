package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import cn.anline.zone.serve.AnnBase;
import cn.anline.zone.serve.console.v1.bean.V1BaseBean;
import com.alibaba.fastjson.JSON;
import org.osgl.mvc.annotation.Before;

import javax.inject.Inject;

/**
 * API 基类 所有请求地址 继承到 /api/console/v1下面
 */

@Controller("/api/console/v1")
public class V1BaseController extends AnnBase {

    @Inject V1BaseBean v1BaseBean;
    @Before(except = {"login","reg"})
    public void   __init__(String user){
//        拦截登录 此处可做Token判断
        if (null != user && user.equals("jiankian")){
            v1BaseBean.setMsg("你好"+user);
        }else {
            v1BaseBean.setMsg("请先登录！");
            throw Controller.Util.json(v1BaseBean);
        }
    }
}
