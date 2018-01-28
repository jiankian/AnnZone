import { Config } from './_ann/config';
import { Http, Response } from '@angular/http';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { Router, NavigationStart, NavigationEnd } from '@angular/router';
import { Helpers } from "./helpers";

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
        private _http: Http
    ) {
        
    }

    refreshToken(){
        console.log("Token❤️心跳：")
        console.log(new Date().toLocaleTimeString())
        let localUser = JSON.parse(localStorage.getItem('currentUser'));
        console.log(localUser)
        if(localUser && localUser.token){
            console.log("本地有token,大概是已经登录好了！~")
            console.log(localUser.token)

            //进行token定时请求以去刷新新的Token
            this._http.post(Config.api_url+'user/token',{username:localUser.username,token:localUser.token}).map(
                (response: Response) => {
                   console.log("Token刷新请求返回：")
                   console.log(response) 
                }
            );
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
        setInterval(this.refreshToken,3000);
    }
}