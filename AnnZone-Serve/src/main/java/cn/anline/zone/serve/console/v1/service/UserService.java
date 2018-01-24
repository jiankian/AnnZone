package cn.anline.zone.serve.console.v1.service;

import act.app.ActionContext;
import cn.anline.zone.serve.AnnBase;

/**
 * 用户服务 获取登录信息 解析Token 获取用户信息等
 */
public class UserService extends AnnBase {

    public boolean tokenVerify(){
        if (null == context.req().paramVal("token")) return false;
        return context.req().paramVal("token").equals("fake-jwt-token");
    }
}
