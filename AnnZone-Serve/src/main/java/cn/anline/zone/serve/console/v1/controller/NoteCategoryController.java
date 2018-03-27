package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import act.db.ebean.EbeanDao;
import cn.anline.zone.serve.console.v1.model.Ann_note_category;

import javax.inject.Inject;

/**
 * 笔记分类接口控制器
 */
@Controller("note/category")
public class NoteCategoryController extends V1BaseController {

    @Inject
    EbeanDao<Long,Ann_note_category> annNoteCategoryEbeanDao;

}
