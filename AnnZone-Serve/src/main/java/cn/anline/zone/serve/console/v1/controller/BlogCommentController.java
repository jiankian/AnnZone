package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.ebean.EbeanDao;
import cn.anline.zone.serve.console.v1.model.Ann_blog_comment;

import javax.inject.Inject;

/**
 * 博客评论接口控制器
 */
@Controller("blog/comment")
public class BlogCommentController extends V1BaseController {
    @Inject
    EbeanDao<Long,Ann_blog_comment> annBlogCommentEbeanDao;
}
