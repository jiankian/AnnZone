package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.*;

import act.db.ebean.EbeanDao;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_note;
import cn.anline.zone.serve.console.v1.model.Ann_note_category;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.result.RenderJSON;

import javax.inject.Inject;
import java.util.Date;

import static act.controller.Controller.Util.json;

/**
 * 笔记接口
 */

@Controller("note")
public class NoteController extends V1BaseController {

    @Inject
    EbeanDao<Long,Ann_note> annNoteEbeanDao;
    @Inject
    EbeanDao<Long,Ann_note_category> annNoteCategoryEbeanDao;
    /**
     * 获取总数接口
     * @return
     */
    @GetAction("count")
    public RenderJSON count(){
        long count = annNoteEbeanDao.count();
        v1BaseBean.setData(count);
        v1BaseBean.setTime(new Date().getTime());
        v1BaseBean.setResult(1);
        v1BaseBean.setExp(new Date().getTime()+Constant.exp);
        v1BaseBean.setStatus(0);
        v1BaseBean.setMsg("笔记总数获取成功！");
        return json(v1BaseBean);
    }
}
