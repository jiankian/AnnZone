package cn.anline.zone.serve.console.v1.controller;

import act.controller.Controller;
import static act.controller.Controller.Util.*;

import act.db.ebean2.EbeanDao;
import act.util.SimpleBean;
import cn.anline.zone.serve.console.v1.bean.UploadBean;
import cn.anline.zone.serve.console.v1.common.Util.FileSafeCode;
import cn.anline.zone.serve.console.v1.common.Util.MD5;
import cn.anline.zone.serve.console.v1.config.Constant;
import cn.anline.zone.serve.console.v1.model.Ann_attachment;
import com.alibaba.fastjson.JSON;
import org.apache.commons.lang3.StringUtils;
import org.osgl.mvc.annotation.GetAction;
import org.osgl.mvc.annotation.PostAction;
import org.osgl.mvc.result.RenderJSON;
import org.osgl.storage.ISObject;
import org.osgl.storage.IStorageService;
import org.osgl.util.Crypto;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

/**
 * 附件接口
 */
@Controller("attachment")
public class AttachmentController extends V1BaseController {

    @Inject
    EbeanDao<Long,Ann_attachment> annAttachmentEbeanDao;

    @PostAction("upload")
    public RenderJSON upload(ISObject file) throws IOException, NoSuchAlgorithmException {
        if (null == file || !file.isValid()){
            v1BaseBean.setStatus(11);
            v1BaseBean.setResult(0);
            v1BaseBean.setMsg("文件上传出现异常");
            v1BaseBean.setExp(-1);
            v1BaseBean.setTime(new Date().getTime());
            throw json(v1BaseBean);
        }


        //配置可选参数
        //来源
        Long origin = Long.valueOf(0);
        //模块 后期在各个客户端各个模块传参
        String module = "Console";
        //版本
        String version = "0.1.0";

        String md5   = FileSafeCode.getMD5(file.asFile());
        String sha1  = FileSafeCode.getSha1(file.asFile());
        String crc32 = FileSafeCode.getCRC32(file.asFile());

        try {
            Ann_attachment ann_attachment = annAttachmentEbeanDao.findOneBy("sha1",sha1);
            //查找数据库是否有已经存在的文件 此处SHA1为标准

            //只要下面有错误就给他抛出异常到新文件存储吧...

            UploadBean uploadBean = new UploadBean();
            uploadBean.setId(ann_attachment.getId());
            uploadBean.setUid(ann_attachment.getUid());
            uploadBean.setName(ann_attachment.getName());
            uploadBean.setModule(ann_attachment.getModule());
            uploadBean.setPath(ann_attachment.getPath());
            uploadBean.setThumb(ann_attachment.getThumb());
            //客户端显示 这里可以先封装下带服务器地址的地址~
            uploadBean.setUrl(ann_attachment.getUrl());
            uploadBean.setMime(ann_attachment.getMime());
            uploadBean.setExt(ann_attachment.getExt());
            uploadBean.setSize(ann_attachment.getSize());
            uploadBean.setSha1(ann_attachment.getSha1());
            uploadBean.setMd5(ann_attachment.getMd5());
            uploadBean.setSha1(ann_attachment.getSha1());
            uploadBean.setCrc32(ann_attachment.getCrc32());
            uploadBean.setDriver(ann_attachment.getDriver());
            uploadBean.setStatus(ann_attachment.getStatus());
            uploadBean.setCreate_time(ann_attachment.getCreate_time());
            uploadBean.setUpdate_time(ann_attachment.getUpdate_time());

            v1BaseBean.setData(uploadBean);
            v1BaseBean.setStatus(0);
            v1BaseBean.setResult(1);
            v1BaseBean.setExp(new Date().getTime() + Constant.exp);
            v1BaseBean.setTime(new Date().getTime());
            v1BaseBean.setMsg("该文件似乎已经上传过，返回服务器所存文件数据！");
            return json(v1BaseBean);

        }catch (Exception e){
//            e.printStackTrace(); //遇到错误就坚决执行新存储文件的任务
            //数据库没有信息就把文件处理到服务器 -->>>>
            IStorageService ss = ssMgr.storageService("upload");
            String ss_key = ss.getKey();
            ISObject sFile = ss.put(ss_key,file);
            Ann_attachment annAttachment = new Ann_attachment();
            annAttachment.setUid(Long.valueOf(__uid));
            annAttachment.setName(sFile.asFile().getName());
            annAttachment.setModule(module);
            annAttachment.setPath(sFile.asFile().getAbsolutePath());
            annAttachment.setThumb("");
            annAttachment.setSs_key(ss_key);
            annAttachment.setUrl(sFile.getUrl());
            annAttachment.setMime(file.getContentType());
            String fileName = sFile.asFile().getName();
            annAttachment.setExt(fileName.substring(fileName.lastIndexOf(".") + 1));
            annAttachment.setSize(sFile.getLength());
            annAttachment.setMd5(md5);
            annAttachment.setSha1(sha1);
            annAttachment.setCrc32(crc32);
            annAttachment.setDriver("upload");
            annAttachment.setOrigin(origin);
            annAttachment.setUa(context.req().userAgentStr());
            annAttachment.setIp(context.req().ip());
            annAttachment.setVersion(version);
            annAttachment.setHttp_info(context.req().fullUrl());
            annAttachment.setCreate_time(new Date().getTime());
            annAttachment.setUpdate_time(new Date().getTime());


            try{
                Ann_attachment ann_attachment = annAttachmentEbeanDao.save(annAttachment);

                UploadBean uploadBean = new UploadBean();
                uploadBean.setId(ann_attachment.getId());
                uploadBean.setUid(ann_attachment.getUid());
                uploadBean.setName(ann_attachment.getName());
                uploadBean.setModule(ann_attachment.getModule());
                uploadBean.setPath(ann_attachment.getPath());
                uploadBean.setThumb(ann_attachment.getThumb());
                //客户端显示 这里可以先封装下带服务器地址的地址~
                uploadBean.setUrl(ann_attachment.getUrl());
                uploadBean.setMime(ann_attachment.getMime());
                uploadBean.setExt(ann_attachment.getExt());
                uploadBean.setSize(ann_attachment.getSize());
                uploadBean.setSha1(ann_attachment.getSha1());
                uploadBean.setMd5(ann_attachment.getMd5());
                uploadBean.setSha1(ann_attachment.getSha1());
                uploadBean.setCrc32(ann_attachment.getCrc32());
                uploadBean.setDriver(ann_attachment.getDriver());
                uploadBean.setStatus(ann_attachment.getStatus());
                uploadBean.setCreate_time(ann_attachment.getCreate_time());
                uploadBean.setUpdate_time(ann_attachment.getUpdate_time());

                v1BaseBean.setData(uploadBean);
                v1BaseBean.setStatus(0);
                v1BaseBean.setResult(1);
                v1BaseBean.setExp(new Date().getTime() + Constant.exp);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setMsg("文件上传到服务器并存储数据库成功！");
                return json(v1BaseBean);
            }catch (Exception e2){
                e2.printStackTrace();
                v1BaseBean.setStatus(12);
                v1BaseBean.setResult(0);
                v1BaseBean.setTime(new Date().getTime());
                v1BaseBean.setExp(-1);
                v1BaseBean.setMsg("文件信息存储到数据库异常！");
                return json(v1BaseBean);
            }
        }



    }

    /**
     * 获取附件详情
     * @param id
     * @return
     */
    @GetAction("view")
    public RenderJSON view(String id){
        if (!StringUtils.isNumeric(id)){
            v1BaseBean.setStatus(1);
            v1BaseBean.setMsg("附件ID不合法");
            v1BaseBean.setResult(0);
            throw json(v1BaseBean);
        }
        long _id = Long.valueOf(id);
        try {
            Ann_attachment ann_attachment = annAttachmentEbeanDao.findOneBy("id",_id);
            if (null != ann_attachment){
                v1BaseBean.setExp(Constant.exp+new Date().getTime());
                v1BaseBean.setMsg("附件详情获取成功！");
                v1BaseBean.setStatus(0);
                v1BaseBean.setData(ann_attachment);
                v1BaseBean.setResult(1);
                v1BaseBean.setTime(new Date().getTime());
                return json(v1BaseBean);
            }else {
                v1BaseBean.setStatus(14);
                v1BaseBean.setMsg("附件不存在");
                v1BaseBean.setExp(-1);
                return json(v1BaseBean);
            }
        }catch (Exception e){
            v1BaseBean.setStatus(14);
            v1BaseBean.setMsg("附件不存在");
            v1BaseBean.setExp(-1);
            return json(v1BaseBean);
        }

    }
}
