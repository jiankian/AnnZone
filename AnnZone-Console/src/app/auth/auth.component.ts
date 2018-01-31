import {
    Component,
    ComponentFactoryResolver,
    OnInit,
    ViewChild,
    ViewContainerRef,
    ViewEncapsulation,
} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ScriptLoaderService } from '../_services/script-loader.service';
import { AuthenticationService } from './_services/authentication.service';
import { AlertService } from './_services/alert.service';
import { UserService } from './_services/user.service';
import { AlertComponent } from './_directives/alert.component';
import { LoginCustom } from './_helpers/login-custom';
import { Helpers } from '../helpers';
import { Http, Response } from "@angular/http";
import { NzMessageService, NzModalService, NzNotificationService } from "ng-zorro-antd";
import { UserRegisterProtocolComponent } from "./register/user-register-protocol.component";
import { Config } from "../_ann";

@Component({
    selector: '.m-grid.m-grid--hor.m-grid--root.m-page',
    templateUrl: './templates/login-1.component.html',
    encapsulation: ViewEncapsulation.None,
})

export class AuthComponent implements OnInit {
    model: any = {};
    loading = false;
    returnUrl: string;

    @ViewChild('alertSignin',
        { read: ViewContainerRef }) alertSignin: ViewContainerRef;
    @ViewChild('alertSignup',
        { read: ViewContainerRef }) alertSignup: ViewContainerRef;
    @ViewChild('alertForgotPass',
        { read: ViewContainerRef }) alertForgotPass: ViewContainerRef;

    constructor(
        private _router: Router,
        private _http: Http,
        private _script: ScriptLoaderService,
        private _userService: UserService,
        private _route: ActivatedRoute,
        private _authService: AuthenticationService,
        private _alertService: AlertService,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _modal: NzModalService,
        private cfr: ComponentFactoryResolver) {
    }

    ngOnInit() {
        this.model.remember = true;
        // get return url from route parameters or default to '/'
        this.returnUrl = this._route.snapshot.queryParams['returnUrl'] || '/';
        this._router.navigate([this.returnUrl]);

        this._script.loadScripts('body', [
            'assets/vendors/base/vendors.bundle.js',
            'assets/demo/demo7/base/scripts.bundle.js'], true).then(() => {
                Helpers.setLoading(false);
                LoginCustom.init();
            });
    }

    signin() {
        // this.loading = true;
        this._authService.login(this.model.username, this.model.password).subscribe(
            data => {
                console.log("回调数据")
                console.log(data)
                if (data) {
                    this._router.navigate([this.returnUrl]);
                } else {
                    this.showAlert('alertSignin');
                    this._alertService.error("登录失败，请检查输入信息是否正确！");
                    this.loading = false;
                }

            },
            error => {
                this.showAlert('alertSignin');
                this._alertService.error(error);
                this.loading = false;
            });
    }

    signup() {
        this.loading = true;
        console.log("注册按钮点击事件")
        if (this.model.password != this.model.rpassword) {
            this._message.warning("两次输入的密码不相同！")
            this.loading = false
            return false
        }
        if (!this.model.agree) {
            this._message.warning("阅读注册协议并同意才能注册帐号！")
            return false
        }
        this._http.post(Config.api_url + 'user/signup', { ann_user: this.model })
            .toPromise()
            .then((response: Response) => {
                console.log("注册服务器请求成功返回")
                console.log(response)
                let resData = response.json()
                console.log(resData)
                if (resData && resData.status == 0) {
                    console.log("注册成功！")
                    this._notify.success("恭喜你，新用户注册成功！", resData.msg)
                    this._message.success("新用户注册成功，用新帐号登录吧！")
                    // this.loading = false
                    // 注册成功就帮忙登录一下吧，呵呵
                    this.signin()
                } else {
                    console.log("连接注册服务器成功，但是服务器返回注册失败信息")
                    this._notify.warning("注册失败", resData.msg, { nzDuration: 6000 })// 6s关闭服务器注册失败的原因给用户长时间显示，免得看不清啥问题
                    this._message.warning(resData.msg)
                    this.loading = false
                }
            })
            .catch((err) => {
                this._notify.error("注册失败", "连接注册服务器异常")
                this._message.error(err)
                this.loading = false
            });

    }

    forgotPass() {
        this.loading = true;
        console.log("点击了找回密码请求")
        this._message.warning("管理员密码不支持自助找回，请联系技术找回吧！")
        this._notify.warning("温馨提示", "管理员密码不支持自助找回，请联系技术找回吧！")
        setTimeout(() => {
            this.loading = false
        }, 3000)
    }

    showAlert(target) {
        this[target].clear();
        let factory = this.cfr.resolveComponentFactory(AlertComponent);
        let ref = this[target].createComponent(factory);
        ref.changeDetectorRef.detectChanges();
    }

    //显示用户注册协议
    showRegisterProtocol($e) {
        let that = this
        console.log("单击了用户注册协议")
        //此处仅需作为显示作用，如需要阅读时间，必须阅读才能进行注册，请在下面参数中配置，具体使用文档去看 ng-zorro-antd的官方文档
        this._modal.open({
            title: '新用户注册协议',
            content: UserRegisterProtocolComponent,
            componentParams: {

            },
            onOk() {
                console.log("打勾")
                that.model.agree = true
            },
            onCancel() {
                console.log("取消打勾")
                that.model.agree = false
            },
            cancelText: "拒绝",
            okText: "同意",

        })
    }
}