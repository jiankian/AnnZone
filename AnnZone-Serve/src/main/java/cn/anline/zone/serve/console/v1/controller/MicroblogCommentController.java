package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.ebean2.EbeanDao;
import cn.anline.zone.serve.console.v1.model.Ann_microblog_comment;

import javax.inject.Inject;

/**
 * 微博评论接口控制器
 */
@Controller("microblog/comment")
public class MicroblogCommentController extends V1BaseController {

    @Inject
    EbeanDao<Long,Ann_microblog_comment> annMicroblogCommentEbeanDao;

}
