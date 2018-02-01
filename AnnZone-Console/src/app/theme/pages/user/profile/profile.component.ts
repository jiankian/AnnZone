import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import {Headers, Http, RequestOptions, Response} from "@angular/http";
import {ActivatedRoute, Router} from "@angular/router";
import {NzMessageService, NzNotificationService, UploadFile} from "ng-zorro-antd";
import {Config} from "../../../../_ann";
import {UserService} from "../../../../auth/_services/user.service";
import {AuthenticationService} from "../../../../auth/_services/authentication.service";

@Component({
    selector: 'app-profile',
    templateUrl: './profile.component.html',
    styles: [],
    encapsulation: ViewEncapsulation.None
})
export class ProfileComponent implements OnInit {
    userinfo:any = {}
    password:any = {}
    avatarUser:any = {}
    //头像上传组件
    loading = false;
    avatarUrl: string;
    fileList = [];
    previewImage = '';
    previewVisible = false;
    avatarUploadUrl: string = ''
    avatarUploadHeaders: any
    //上传附带参数
    avatarFormData: any = {}

    headers: any
    options: any

    returnUrl: string;

    avatar:any = {}

    constructor(
        private _http: Http,
        private _router: Router,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _userService: UserService,
        private _authService: AuthenticationService,
        private _route: ActivatedRoute,
    ) {
        this.returnUrl = this._route.snapshot.queryParams['returnUrl'] || '/';
    }

    ngOnInit() {
        try {
            this.userinfo = JSON.parse(localStorage.getItem('currentUser'));
            if (this.userinfo && this.userinfo.id){
                this._notify.success("用户信息获取成功！","成功加载本地登录用户信息！")
            }
        }catch (error){
            this._notify.error("用户信息获取失败","获取本地用户信息失败，请尝试重新登录~！！！")
        }

        this.headers = new Headers({ 'ann_token': this.userinfo.token });
        this.options = new RequestOptions({ headers: this.headers });

        this.avatarUploadUrl = Config.api_url + 'attachment/upload'
        this.avatarUploadHeaders = { ann_token: this.userinfo.token }
        this.avatarFormData = { origin_name: 'Angular SPA' }

        this.loadAvatar()
    }

    /**
     * 基础信息修改
     */
    basicUpdate(){
        let that = this
        console.log("基础信息更新")
        console.log(this.userinfo)
        that._http.post(Config.api_url + 'user/update',{user:this.userinfo.id,ann_user:that.userinfo},this.options)
            .toPromise()
            .then((response:Response) =>{
                console.log("用户信息更新服务器请求成功")
                console.log(response)
                let resData = response.json()
                console.log(resData)
                if (resData && resData.status == 0){
                    that._notify.success("用户信息更新成功！",resData.msg)
                    that._message.success(resData.msg)
                    setTimeout(()=>{
                        // 刷新才能更新用户本地信息
                        window.location.reload()
                    },2000)
                }else {
                    that._notify.warning("用户信息更新失败！",resData.msg)
                    that._message.warning(resData.msg)
                }
            })
            .catch((err)=>{
                that._notify.error("用户信息更新失败","连接服务器请求失败！")
                that._message.error(err)
            })
    }

    /**
     * 头像上传
     * @returns {boolean}
     */
    avatarUpdate(){
        let that = this
        console.log("头像更新")
        console.log(that.fileList)
        if (that.fileList.length == 0){
            this._message.warning("头像不能为空！")
            return false
        }
        if (that.fileList[0] && that.fileList[0].status != "done"){
            that._message.warning("头像没有准备好！")
            return false
        }
        if (that.fileList[0] && that.fileList[0].response.status != 0){
            that._notify.warning("服务器上传文件失败！",that.fileList[0] && that.fileList[0].response.msg)
            that._message.warning("头像没有正确传入服务器数据库！")
            return false
        }
        that.avatarUser.avatar = that.fileList[0] && that.fileList[0].response.data.id
        if (that.avatarUser.avatar){
            that._http.post(Config.api_url+'user/avatar',{user:that.userinfo.id,ann_user:that.avatarUser},this.options)
                .toPromise()
                .then((response:Response)=>{
                    let resData = response.json()
                    if (resData && resData.status == 0){
                        that._notify.success("头像更新成功！",resData.msg)
                        that._message.success("头像更新成功！")
                        //本地头像显示刷新-->>>>>
                        window.location.reload()
                    }else {
                        that._notify.error("头像保存服务器失败",resData.msg)
                        that._message.error("头像更新失败，保存到服务器异常！")
                    }
                })
                .catch((err)=>{
                    that._notify.error("头像更新失败",err)
                    that._message.error("头像更新失败，连接服务器异常！")
                })
        }
    }
    passwordUpdate(){
        let that = this
        this.password.username = this.userinfo.username
        console.log("密码更新")
        console.log(this.password)
        if (null == that.password.old_password ||
            that.password.old_password.length ==0 ||
            null == that.password.new_password ||
            that.password.new_password.length == 0 ||
            null == that.password.new_password2 ||
            that.password.new_password2.length == 0){
            that._notify.error("输入错误","旧密码，新密码，确认密码不能为空！请输入完整的表单信息！")
            that._message.error("表单输入不完整！")
            return false
        }
        if (that.password.new_password != that.password.new_password2){
            that._notify.warning("新密码不相等","请确认两次输入的新密码是否一致")
            that._message.warning("两次新密码需要一致！")
            return false
        }
        that._http.post(Config.api_url +'user/password/modify',
            {username:this.userinfo.username,
                old_password:this.password.old_password,
                new_password:this.password.new_password
            },this.options)
            .toPromise()
            .then((response:Response)=>{
                console.log("服务器请求成功！")
                console.log(response)
                let resData = response.json()
                console.log(resData)
                if (resData && resData.status == 0){
                    that._notify.success("密码更新成功！",resData.msg)
                    this._message.success(resData.msg)
                    //下面重新登录吧！！
                    this._authService.login(this.userinfo.username, this.password.new_password).subscribe(
                        data => {
                            console.log("回调数据")
                            console.log(data)
                            if (data) {
                                this._router.navigate([this.returnUrl]);
                            } else {
                                that._notify.error("自动重新登录失败","请手动登录！")
                                that._message.error("请重新登录！")
                            }

                        },
                        error => {
                            that._notify.error("自动重新登录失败","请手动登录！")
                            that._message.error(error)
                        });
                }else {
                    that._notify.warning("密码更新错误！",resData.msg)
                    this._message.warning(resData.msg)
                }
            })
            .catch((err)=>{
                console.log("服务器请求失败！")
                that._notify.error("密码更新失败","连接服务器请求失败！")
                that._message.error(err)
            })
    }

    /**
     * 上传过滤器
     * @param {File} file
     * @returns {boolean}
     */
    beforeUpload = (file: File) => {
        const isJPG = file.type === 'image/jpeg';
        const isPNG = file.type === 'image/png';
        const isGIF = file.type === 'image/gif';
        if (!isJPG && !isPNG && !isGIF) {
            this._message.error('你只能上传jpg/png/gif格式的图片');
            return false
        }
        const isInSize = file.size  < 1024 * 1024 * 0.5;
        if (!isInSize) {
            this._message.error('图片不能超过 0.5MB!');
            return false
        }
        return isInSize;
    }

    /**
     * 预览事件
     * @param {UploadFile} file
     */
    handlePreview = (file: UploadFile) => {
        this.previewImage = file.url || file.thumbUrl;
        this.previewVisible = true;
    }

    /**
     * 头像选择器改变
     * @param e
     */
    avatarChange = (e) => {
        console.log("头像上传状态改变")
        console.log(e)
        console.log("this.fileList")
        console.log(this.fileList)
    }

    /**
     * 加载头像
     */
    loadAvatar(){
        if (this.userinfo.avatar && this.userinfo.avatar.length !== 0){
            this._http.get(Config.api_url + 'attachment/view?'+'id='+this.userinfo.avatar,this.options)
                .toPromise()
                .then((res:Response)=>{
                    console.log("头像加载请求成功")
                    let resData = res.json()
                    if (resData && resData.status == 0){
                        this.avatar = resData.data
                        this.avatar.url = Config.api_base + this.avatar.url
                    }
                })
                .catch((err)=>{
                    console.log("头像加载请求失败")
                    console.log(err)
                })
        }else {
            console.log("头像数据不存在，停止了头像加载请求")
        }
    }
}
