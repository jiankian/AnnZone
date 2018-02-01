import { Component, OnInit, ViewEncapsulation, AfterViewInit } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import {Headers, Http, RequestOptions, Response} from "@angular/http";
import {NzMessageService, NzNotificationService} from "ng-zorro-antd";
import {Config} from "../../../../_ann";


@Component({
    selector: "app-index",
    templateUrl: "./index.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class IndexComponent implements OnInit, AfterViewInit {
    userinfo:any = {}
    microblogNum:number = 0
    blogNum:number = 0
    noteNum:number = 0

    headers: any
    options: any

    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _notify: NzNotificationService,
        private _message: NzMessageService,

    ) {
        try {
            this.userinfo = JSON.parse(localStorage.getItem('currentUser'));
            if (this.userinfo && this.userinfo.id){
                // this._notify.success("用户信息获取成功！","成功加载本地登录用户信息！")
            }
        }catch (error){
            // this._notify.error("用户信息获取失败","获取本地用户信息失败，请尝试重新登录~！！！")
        }
    }
    ngOnInit() {
        this.headers = new Headers({ 'ann_token': this.userinfo.token });
        this.options = new RequestOptions({ headers: this.headers });
        this.loadArticleCount()
    }
    ngAfterViewInit() {
        this._script.loadScripts('app-index',
            ['assets/app/js/dashboard.js']);

    }

    /**
     * 加载文章统计
     */
    loadArticleCount(){
        /**
         * 博客文章统计
         */
        this._http.get(Config.api_url + 'blog/count',this.options)
            .toPromise()
            .then((res:Response)=>{
                console.log("博客统计请求成功")
                console.log(res)
                let resData = res.json()
                console.log(resData)
                if (resData && resData.status ==0){
                    this.blogNum == resData.data
                }
            })
            .catch((err)=>{
                console.log("博客统计请求失败")
                console.log(err)
            })
        /**
         * 微博文章统计
         */
        this._http.get(Config.api_url + 'microblog/count',this.options)
            .toPromise()
            .then((res:Response)=>{
                console.log("微博统计请求成功")
                console.log(res)
                let resData = res.json()
                console.log(resData)
                if (resData && resData.status ==0){
                    this.microblogNum == resData.data
                }
            })
            .catch((err)=>{
                console.log("微博统计请求失败")
                console.log(err)
            })
        /**
         * 笔记统计
         */
        this._http.get(Config.api_url + 'note/count',this.options)
            .toPromise()
            .then((res:Response)=>{
                console.log("笔记统计请求成功")
                console.log(res)
                let resData = res.json()
                console.log(resData)
                if (resData && resData.status ==0){
                    this.noteNum == resData.data
                }
            })
            .catch((err)=>{
                console.log("笔记统计请求失败")
                console.log(err)
            })
    }

}