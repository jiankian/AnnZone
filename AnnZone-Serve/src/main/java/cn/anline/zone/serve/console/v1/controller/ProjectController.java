package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;

import act.db.ebean.EbeanDao;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_project;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.result.RenderJSON;

import javax.inject.Inject;
import java.util.Date;
import java.util.List;

/**
 * 项目接口
 */
@Controller("project")
public class ProjectController extends V1BaseController {
    @Inject
    EbeanDao<Long,Ann_project> annProjectEbeanDao;

    /**
     * 获取项目列表接口
     * @return
     */
    @GetAction("list")
    public RenderJSON list(){
        List<Ann_project> ann_projects = annProjectEbeanDao.findAllAsList();
        v1BaseBean.setData(ann_projects);
        v1BaseBean.setResult(ann_projects.size());
        v1BaseBean.setStatus(0);
        v1BaseBean.setMsg("项目列表请求成功！");
        v1BaseBean.setExp(Constant.exp+new Date().getTime());
        v1BaseBean.setTime(new Date().getTime());
        return json(v1BaseBean);
    }
}
