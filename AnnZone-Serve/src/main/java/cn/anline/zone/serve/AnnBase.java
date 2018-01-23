package cn.anline.zone.serve;

import act.Act;
import act.app.ActionContext;
import act.controller.Controller;
import act.event.EventBus;
import act.storage.StorageServiceManager;
import act.view.ProvidesImplicitTemplateVariable;
import act.view.RenderAny;
import org.osgl.http.H;
import org.osgl.mvc.annotation.After;
import org.osgl.mvc.annotation.Before;
import org.osgl.web.util.UserAgent;

import javax.inject.Inject;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import static act.controller.Controller.Util.renderTemplate;

/**
 * 整站基类，用于全局获取session、Context等
 */
public class AnnBase{
    @Inject
    protected ActionContext context;

    @Inject
    protected H.Session session;

    @Inject
    protected UserAgent ua;

    @Inject
    protected H.Flash flash;

    @Inject
    protected EventBus eventBus;

    @Inject
    protected StorageServiceManager ssMgr;

    /**
     * 框架构造器
     */
    @Before
    public void __init(){
//        总的asset目录
        context.renderArg("__asset","/asset/");
    }

    /**
     * 框架析构器
     */
    @After
    public void __uninit(){

    }



    /**
     * 获取当前的url网址啦
     * @param request
     * @return
     */
    @ProvidesImplicitTemplateVariable("__THIS_URL__")
    public String thisUrl(H.Request<?> request) {
        try {
            String fullurl = request.fullUrl();
            fullurl = fullurl.replace("\\","");
            return URLEncoder.encode(fullurl,"utf-8");
        } catch (UnsupportedEncodingException e) {
            String fullurl = this.C("domain.site_home");
            fullurl = fullurl.replace("\\","");
            return fullurl.toString();
        }
    }

    /**
     * 是否手机访问
     * @return
     */

    @ProvidesImplicitTemplateVariable("__IS_MOBILE__")
    public Boolean isMobile(){
        if(ua.isMobile()){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 成功跳转界面
     * @param url
     * @param title
     * @param msg
     * @param sleep
     * @param isRedirect
     * @return
     */
    public RenderAny successMsg(String url,String title,String msg,Integer sleep,boolean isRedirect){
        if (isRedirect){
            throw Controller.Util.redirect(url);
        }
        context.renderArg("url",url);
        context.renderArg("title",title);
        context.renderArg("msg",msg);
        context.renderArg("sleep",sleep);
        context.templatePath("success");
        throw renderTemplate();
    }
    public RenderAny successMsg(String url){
        throw Controller.Util.redirect(url);
    }

    public RenderAny failMsg(String url,String title,String msg,Integer sleep,boolean isRedirect){
        if (isRedirect){
            throw Controller.Util.redirect(url);
        }
        context.renderArg("url",url);
        context.renderArg("title",title);
        context.renderArg("msg",msg);
        context.renderArg("sleep",sleep);
        context.templatePath("fail");
        throw renderTemplate();
    }
    public RenderAny failMsg(String url){
        throw Controller.Util.redirect(url);
    }
    /**
     * 获取配置信息
     * @return
     */
    public String C(String key){
        return Act.appConfig().get(key).toString();
    }

    /**
     * 获取客户端ip
     */
    public String getClientIp(){
        return ActionContext.current().req().ip();
    }

    /**
     * 调用模板啦
     * @param args
     * @return
     */
    public RenderAny tpl(Object... args){
        return renderTemplate(args);
    }

    /**
     * 调用模板啦
     */
    public RenderAny tpl(String path){
        context.templatePath(path);
        return renderTemplate();
    }

    /**
     * 调用模板啦
     */
    public RenderAny tpl(String path,Object... args){
        context.templatePath(path);
        return renderTemplate(args);
    }
    /**
     * 统一跳转页面
     */
    public void AnnGo(String url){
        throw Controller.Util.redirect(url);
    }
}
