package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;

import com.alibaba.fastjson.JSON;
import org.osgl.mvc.annotation.PostAction;
import org.osgl.mvc.result.RenderJSON;

/**
 * 附件接口
 */
@Controller("attachment")
public class AttachmentController extends V1BaseController {

    @PostAction("upload")
    public RenderJSON upload(){
        System.out.println("文件上传被请求");
        v1BaseBean.setResult(-100);
        v1BaseBean.setData(context.req().paramNames());
        v1BaseBean.setMsg("收到文件上传请求！");
        System.out.println(JSON.toJSONString(context.allParams()));
        return json(v1BaseBean);
    }
}
