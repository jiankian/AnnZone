package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;
import act.db.ebean.EbeanDao;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_blog_category;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.result.RenderJSON;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

/**
 * 博客分类接口控制器
 */
@Controller("blog/category")
public class BlogCategoryController extends V1BaseController {
    @Inject
    EbeanDao<Long,Ann_blog_category> annBlogCategoryEbeanDao;

    /**
     * 获取顶级主分类接口
     * @return
     */
    @GetAction("list")
    public RenderJSON list(){
        List<Ann_blog_category> ann_blog_categories = annBlogCategoryEbeanDao.q("level",0).findList();
        v1BaseBean.setData(ann_blog_categories);
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setExp(Constant.exp+new Date().getTime());
        v1BaseBean.setStatus(0);
        v1BaseBean.setMsg("主分类列表获取成功！");
        v1BaseBean.setResult(ann_blog_categories.size());
        return json(v1BaseBean);
    }

    /**
     * 子分类接口
     * @param id 父级ID
     * @return
     */
    @GetAction("sub/{id}")
    public RenderJSON sub(Integer id){
        List<Ann_blog_category> ann_blog_categories = annBlogCategoryEbeanDao.q("pid",id).findList();
        v1BaseBean.setData(ann_blog_categories);
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setExp(Constant.exp+new Date().getTime());
        v1BaseBean.setStatus(0);
        v1BaseBean.setMsg("子分类列表获取成功！");
        v1BaseBean.setResult(ann_blog_categories.size());
        return json(v1BaseBean);
    }
}
