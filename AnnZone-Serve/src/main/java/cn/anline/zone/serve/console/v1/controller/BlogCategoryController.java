package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.ebean2.EbeanDao;
import cn.anline.zone.serve.console.v1.model.Ann_blog_category;

import javax.inject.Inject;

/**
 * 博客分类接口控制器
 */
@Controller("blog/category")
public class BlogCategoryController extends V1BaseController {
    @Inject
    EbeanDao<Long,Ann_blog_category> annBlogCategoryEbeanDao;
}
