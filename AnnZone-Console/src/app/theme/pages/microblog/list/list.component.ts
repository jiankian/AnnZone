import {Component, OnInit, ViewEncapsulation, AfterViewInit, ComponentFactoryResolver} from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import {Headers, Http, RequestOptions, Response} from "@angular/http";
import {Router} from "@angular/router";
import {ElMessageService, ElNotificationService} from "element-angular";
import {AlertService} from "../../../../auth/_services/alert.service";
import {Config} from "../../../../_ann";


@Component({
    selector: "app-inner",
    templateUrl: "./list.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class ListComponent implements OnInit, AfterViewInit {

    listData: any
    headers: any
    options: any
    token: string
    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router,
        private _notify: ElNotificationService,
        private _message: ElMessageService,
        private _cfr: ComponentFactoryResolver,
        private _alertService: AlertService,
        ) {
        this.token = JSON.parse(localStorage.getItem("currentUser")).token;
        this.headers = new Headers({ 'ann_token': this.token });
        this.options = new RequestOptions({ headers: this.headers });


        this.loadData()
    }
    ngOnInit() {

    }
    ngAfterViewInit() {
        this._script.loadScripts('app-inner',
            ['assets/app/js/dashboard.js']);

    }

    loadData(){
        this._http.get(Config.api_url+'microblog/list',this.options).toPromise()
            .then((response: Response) => {
                console.log("微博列表请求结果：")
                console.log(response.json())
                let res = response.json()
                if (res && res.status == 0){
                    this._notify.success(res.msg)
                    this.listData = res.data
                    //有了数据再去加载本地列表显示jq脚本 避免打开没有内容
                    this._script.loadScripts('app-inner',
                        ['assets/app/js/microblog-list-html-table.js']);
                }else {
                    this._notify.error(res.msg)
                }
            })
            .catch((err)=>{
                this._notify.error("微博服务器请求失败！")
                this._message.error(err)
            });
    }
    refresh(){
        // window.location.reload()
        // UI框架有时候不会正常加载本地列表 以下方式似乎没什么卵用
        this.listData = []//先清空
        this.loadData()
    }

    editItem(data){
        console.log("编辑操作")
        console.log(data)
    }
    deleteItem(data){
        console.log("删除操作：")
        console.log(data)
    }

}