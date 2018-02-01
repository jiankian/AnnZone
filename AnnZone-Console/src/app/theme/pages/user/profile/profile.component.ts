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
    avatar:any = {}
    //头像上传组件
    loading = false;
    avatarUrl: string;

    headers: any
    options: any

    returnUrl: string;

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
    }

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
                if (resData && resData.status){
                    that._notify.success("用户信息更新成功！",resData.msg)
                    that._message.success(resData.msg)
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
    avatarUpdate(){
        let that = this
        console.log("头像更新")
        console.log(this.avatar)
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


    beforeUpload = (file: File) => {
        const isJPG = file.type === 'image/jpeg';
        if (!isJPG) {
            this._message.error('You can only upload JPG file!');
        }
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isLt2M) {
            this._message.error('Image must smaller than 2MB!');
        }
        return isJPG && isLt2M;
    }

    private getBase64(img: File, callback: (img: any) => void) {
        const reader = new FileReader();
        reader.addEventListener('load', () => callback(reader.result));
        reader.readAsDataURL(img);
    }

    handleChange(info: { file: UploadFile }) {
        if (info.file.status === 'uploading') {
            this.loading = true;
            return;
        }
        if (info.file.status === 'done') {
            // Get this url from response in real world.
            this.getBase64(info.file.originFileObj, (img: any) => {
                this.loading = false;
                this.avatarUrl = img;
            });
        }
    }

}
