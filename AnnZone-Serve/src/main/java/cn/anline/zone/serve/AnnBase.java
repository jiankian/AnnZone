package cn.anline.zone.serve;

import act.Act;
import act.app.ActionContext;
import act.event.EventBus;
import act.storage.StorageServiceManager;
import org.osgl.http.H;
import org.osgl.web.util.UserAgent;

import javax.inject.Inject;

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


}
