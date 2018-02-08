import { Component, OnInit, ViewEncapsulation, AfterViewInit, ComponentFactoryResolver } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import { Headers, Http, RequestOptions, Response } from "@angular/http";
import { Router } from "@angular/router";
import { AlertService } from "../../../../auth/_services/alert.service";
import { Config } from "../../../../_ann";
import { NzMessageService, NzNotificationService } from "ng-zorro-antd";


@Component({
    selector: "app-inner",
    templateUrl: "./list.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class ListComponent implements OnInit, AfterViewInit {

    listData = []
    headers: any
    options: any
    token: string

    // Loadmore:
    data = [];
    loading = false;
    loadingMore = false;
    showLoadMore = false;
    pi = 1;
    ps = 5;
    show_max_pi = 1;

    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _cfr: ComponentFactoryResolver,
        private _alertService: AlertService,
    ) {
        this.token = JSON.parse(localStorage.getItem("currentUser")).token;
        this.headers = new Headers({ 'ann_token': this.token });
        this.options = new RequestOptions({ headers: this.headers });
    }
    ngOnInit() {
        this.getPageCounts()
        this.loadData()
    }
    ngAfterViewInit() {
        // this._script.loadScripts('app-inner',
        //     ['assets/app/js/dashboard.js']);

    }

    /**
     * 获取分页总数
     */
    getPageCounts(){
        this._http.get(Config.api_url + 'microblog/pagecount',this.options)
            .toPromise()
            .then((res:Response)=>{
                let resData = res.json()
                console.log("分页获取结果")
                console.log(resData)
                if (resData && resData.status == 0){
                    this.show_max_pi = resData.data
                    this.showLoadMore = this.pi < this.show_max_pi;
                }else {
                    this._message.warning("总数计算获取失败！")
                    this.show_max_pi = 1
                    this.showLoadMore = this.pi < this.show_max_pi;
                }

            }).catch((err)=>{
                this._message.warning("总数计算获取失败！")
                this.show_max_pi =1
                this.showLoadMore = this.pi < this.show_max_pi;
        })
    }
    loadData() {
        if (this.pi === 1)
            this.loading = true;
        else
            this.loadingMore = true;

        this._http.get(Config.api_url + 'microblog/list?p='+ this.pi, this.options).toPromise()
            .then((response: Response) => {
                console.log("微博列表请求结果：")
                console.log(response.json())
                let res = response.json()
                if (res && res.status == 0) {
                    this._notify.create('success', '加载成功', res.msg)
                    if (this.pi === 1){
                        console.log("不拼接")
                        this.listData = res.data
                        this.loading = false;
                    }else {
                        console.log("拼接")
                        this.listData = this.listData.concat(res.data)
                        console.log(this.listData)
                        this.loadingMore = false
                    }
                    //有了数据再去加载本地列表显示jq脚本 避免打开没有内容
                    // this._script.loadScripts('app-inner',
                    //     ['assets/app/js/microblog-list-html-table.js']);
                } else {
                    this._notify.create('error', '加载失败', res.msg)
                    this.loading =false
                }

                this.showLoadMore = this.pi < this.show_max_pi;
            })
            .catch((err) => {
                this._notify.create('error', '请求结果', "微博服务器请求失败！")
                this._message.create('error', err)
                this.showLoadMore = this.pi < this.show_max_pi;
            });
    }
    refresh() {
        // window.location.reload()
        // UI框架有时候不会正常加载本地列表 以下方式似乎没什么卵用
        this.listData = []//先清空
        this.loadData()
    }

    editItem = (data) => {
        console.log("编辑操作")
        console.log(data)
    }
    deleteItem = (data) => {
        console.log("删除操作：")
        console.log(data)
    }

    handleLoadMore() {
        ++this.pi;
        this.loadData();
    }

    deleteAll = ()=>{
        console.log("全部删除操作")
    }
    test() {
        console.log("测试")
    }

}