import { Config } from './_ann/config';
import { Http, Response } from '@angular/http';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { Router, NavigationStart, NavigationEnd } from '@angular/router';
import { Helpers } from "./helpers";
import { NzMessageService, NzModalService, NzNotificationService } from "ng-zorro-antd";

@Component({
    selector: 'body',
    templateUrl: './app.component.html',
    encapsulation: ViewEncapsulation.None,
})
export class AppComponent implements OnInit {
    title = 'app';
    globalBodyClass = 'm-page--loading-non-block m-page--fluid m--skin- m-content--skin-light2 m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-light m-aside-left--fixed m-aside-left--offcanvas m-aside-left--minimize m-brand--minimize m-footer--push m-aside--offcanvas-default';


    constructor(
        private _router: Router,
        private _http: Http,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _modal: NzModalService,
    ) {
        console.log("构造函数：")
        console.log(this._http)
        let http: Http = this._http
        // 为了刚刚关闭浏览器的用户可以被快速纠察Token 在这里开始刷新
        //刷新Token 根据需求去刷新 Token过期时间越短 这里就设置的越快一点吧 
        this.refreshToken(http)//先立即执行一次离开后重新进来时候 Token是否随着最后一次访问时间而失效
        setInterval(() => {
            this.refreshToken(http)
        }, 1000 * 60 * 10);
        // 10分钟请求一次新Token 服务器上的过期时间为2小时
    }

    refreshToken(http: Http): void {
        let that = this
        console.log("Token❤️心跳：")
        console.log(new Date().toLocaleTimeString())
        try {
            let localUser = JSON.parse(localStorage.getItem('currentUser'));
            //获取不到时候就被上面JSON.parse抛出 有的浏览器localStorage获取不到解析JSON直接报错，有的浏览器又不会，不管了 抛出try外执行妥妥的
            console.log(localUser)
            if (localUser && localUser.token) {
                console.log("本地有token,大概是已经登录好了！~")
                console.log(localUser.token)

                //进行token定时请求以去刷新新的Token
                http.post(Config.api_url + 'user/token', { username: localUser.username, token: localUser.token })
                    .toPromise()
                    .then(
                    (response: Response) => {
                        console.log("Token刷新请求返回：")
                        console.log(response)
                        let resData = response.json()
                        console.log(resData)
                        if (resData && resData.status == 0 && resData.data.token) {
                            localStorage.setItem('currentUser', JSON.stringify(resData.data))
                            that._notify.success('Token刷新成功', resData.msg)
                        } else {
                            this._notify.warning('身份认证异常', resData.msg)
                            this._modal.warning({
                                title: '身份验证异常',
                                content: '解析本地保存登录信息异常，请尝试注销后重新登录！',
                                okText: '重新登录',
                                cancelText: '暂不理会',
                                maskClosable: false,
                                onOk() {
                                    console.log('确定了')
                                    that._router.navigate(['logout'])
                                },
                                onCancel() {
                                    console.log('取消了')
                                }
                            })
                        }
                    }
                    )
                    .catch((err) => {
                        console.log("心跳刷新Token请求失败：")
                        console.log(err)
                        that._notify.warning('Token刷新异常', err, )
                        that._message.warning('身份验证服务器请求连接失败')
                    });
            }else {
                that._notify.warning('身份验证失败','获取不到本地用户信息，请登录后操作！')
            }
        } catch (error) {
            console.log("解析本地LocalStorage Token失败")
            this._notify.warning('身份验证异常', '解析本地保存登录信息异常，请尝试注销后重新登录！')
            this._modal.warning({
                title: '身份验证异常',
                content: '解析本地保存登录信息异常，请尝试注销后重新登录！',
                okText: '重新登录',
                cancelText: '暂不理会',
                maskClosable: false,
                onOk() {
                    console.log('确定了')
                    that._router.navigate(['logout'])
                },
                onCancel() {
                    console.log('取消了')
                }
            })
        }

    }

    ngOnInit() {
        this._router.events.subscribe((route) => {
            if (route instanceof NavigationStart) {
                Helpers.setLoading(true);
                Helpers.bodyClass(this.globalBodyClass);
            }
            if (route instanceof NavigationEnd) {
                Helpers.setLoading(false);
            }
        });

    }
}