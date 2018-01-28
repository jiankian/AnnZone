package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.DbBind;
import act.db.ebean2.EbeanDao;
import cn.anline.zone.serve.console.v1.model.Ann_microblog;
import cn.anline.zone.serve.console.v1.model.Ann_microblog_comment;
import com.alibaba.fastjson.JSON;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.annotation.PostAction;
import org.osgl.mvc.result.RenderJSON;

import javax.inject.Inject;
import javax.validation.constraints.NotNull;

import java.util.Date;
import java.util.List;

import static act.controller.Controller.Util.*;

/**
 * 微博接口
 */
@Controller("microblog")
public class MicroblogController extends V1BaseController {
    @Inject
    EbeanDao<Long,Ann_microblog> microblogEbeanDao;
    @Inject
    EbeanDao<Long,Ann_microblog_comment> microblogCommentEbeanDao;

    /**
     * 微博读取接口
     * @return
     */
    @GetAction("list")
    public RenderJSON list(){
        v1BaseBean.setStatus(0);
        v1BaseBean.setMsg("微博列表请求成功");
        List<Ann_microblog> microblogList = microblogEbeanDao.findAllAsList();
        v1BaseBean.setResult(microblogList.size());
        v1BaseBean.setData(microblogList);
        return json(v1BaseBean);
    }

    /**
     * 微博发布接口
     * @param ann_microblog
     * @return
     */
    @PostAction("publish")
    public RenderJSON publish(Ann_microblog ann_microblog){
        System.out.println("收到请求");
        System.out.println(JSON.toJSONString(ann_microblog));
        if (null == ann_microblog.getContent() || ann_microblog.getContent().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("内容不能为空");
            throw  json(v1BaseBean);
        }
        ann_microblog.setUid(Long.valueOf(__uid));
        ann_microblog.setIp(context.req().ip());
        ann_microblog.setStatus(Long.valueOf(0));
        ann_microblog.setCreate_time(new Date().getTime());
        ann_microblog.setUpdate_time(new Date().getTime());
        try {
            Ann_microblog annMicroblog = microblogEbeanDao.save(ann_microblog);
            if (null != annMicroblog){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("微博发布成功，并给你返回了发布成功的微博对象！");
                v1BaseBean.setData(annMicroblog);
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(7);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("微博发布保存失败！");
                return json(v1BaseBean);
            }
        }catch (Exception e){
            e.printStackTrace();
            v1BaseBean.setStatus(7);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("微博写入数据库失败！");
            return json(v1BaseBean);
        }
    }

    /**
     * 微博更新接口
     * @param microblog
     * @param ann_microblog
     * @return
     */
    @PostAction("update")
    public RenderJSON update(@DbBind Ann_microblog microblog, Ann_microblog ann_microblog){
        if (null == ann_microblog.getContent() || ann_microblog.getContent().equals("")){
            v1BaseBean.setStatus(1);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("内容不能为空");
            return json(v1BaseBean);
        }
        microblog.setUid(Long.valueOf(__uid));
        microblog.setIp(context.req().ip());
        microblog.setUpdate_time(new Date().getTime());
        microblog.setContent(ann_microblog.getContent());
        try {
            Ann_microblog annMicroblog = microblogEbeanDao.save(microblog);
            if (null != annMicroblog){
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setMsg("微博发布成功，并给你返回了发布成功的微博对象！");
                v1BaseBean.setData(annMicroblog);
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(7);
                v1BaseBean.setResult(0);
                v1BaseBean.setMsg("微博发布保存失败！");
                return json(v1BaseBean);
            }
        }catch (Exception e){
            e.printStackTrace();
            v1BaseBean.setStatus(7);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("微博写入数据库失败！");
            return json(v1BaseBean);
        }
    }

    /**
     * 删除接口
     * @param microblog
     * @return
     */
    @PostAction("delete")
    public RenderJSON delete(@DbBind Ann_microblog microblog){
        microblogEbeanDao.delete(microblog);
        v1BaseBean.setMsg("已进行删除操作");
        v1BaseBean.setResult(0);
        v1BaseBean.setStatus(0);
        return json(v1BaseBean);
    }
}
