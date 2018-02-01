import { Component, OnInit, ViewEncapsulation, AfterViewInit } from '@angular/core';
import { Helpers } from '../../../helpers';
import {Headers, Http, RequestOptions, Response} from "@angular/http";
import {Config} from "../../../_ann";

declare let mLayout: any;
@Component({
    selector: "app-header-nav",
    templateUrl: "./header-nav.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class HeaderNavComponent implements OnInit, AfterViewInit {
    userinfo:any = {}
    avatar:any ={}

    headers: any
    options: any
    constructor(
        private _http:Http
    ) {

    }
    ngOnInit() {
        try {
            this.userinfo = JSON.parse(localStorage.getItem('currentUser'));
            if (this.userinfo && this.userinfo.id){
            }
        }catch (error){
        }
        this.headers = new Headers({ 'ann_token': this.userinfo.token });
        this.options = new RequestOptions({ headers: this.headers });
        this.loadAvatar()
    }
    ngAfterViewInit() {

        mLayout.initHeader();

    }

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