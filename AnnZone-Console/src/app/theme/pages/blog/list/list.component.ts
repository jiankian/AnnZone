import { Component, OnInit, ViewEncapsulation, AfterViewInit } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import {Headers, Http, RequestOptions, Response} from "@angular/http";
import {Router} from "@angular/router";
import {NzMessageService, NzModalService, NzNotificationService} from "ng-zorro-antd";
import {Config} from "../../../../_ann";


@Component({
    selector: "app-inner",
    templateUrl: "./list.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class ListComponent implements OnInit, AfterViewInit {
    headers: any
    options: any
    token: string

    _allChecked = false;
    _disabledButton = true;
    _checkedNumber = 0;
    _displayData: Array<any> = [];
    _operating = false;
    _dataSet = [];
    _indeterminate = false;

    _displayDataChange($event) {
        this._displayData = $event;
    }

    _refreshStatus() {
        const allChecked = this._displayData.every(value => value.checked === true);
        const allUnChecked = this._displayData.every(value => !value.checked);
        this._allChecked = allChecked;
        this._indeterminate = (!allChecked) && (!allUnChecked);
        this._disabledButton = !this._dataSet.some(value => value.checked);
        this._checkedNumber = this._dataSet.filter(value => value.checked).length;
    }

    _checkAll(value) {
        if (value) {
            this._displayData.forEach(data => data.checked = true);
        } else {
            this._displayData.forEach(data => data.checked = false);
        }
        this._refreshStatus();
    }

    _operateData() {
        this._operating = true;
        let checkedNow = [];
        this._dataSet.forEach(value => {
            if (value.checked){
                checkedNow.push(value.id)
            }
        })
        console.log('选中操作项目为：')
        console.log(checkedNow)
        //TODO 这里要操作什么内容自己去开发去吧，批量删除，批量关闭，批量置顶，等...
        this._notify.info('批量操作的项目',checkedNow.toString(),{nzDuration:5000})
        setTimeout(_ => {
            this._dataSet.forEach(value => value.checked = false);
            this._refreshStatus();
            this._operating = false;
        }, 1000);
    }
    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _modal: NzModalService,
    ) {
        this.token = JSON.parse(localStorage.getItem("currentUser")).token;
        this.headers = new Headers({ 'ann_token': this.token });
        this.options = new RequestOptions({ headers: this.headers });
    }
    ngOnInit() {
        this._http.get(Config.api_url + 'blog/list',this.options)
            .toPromise()
            .then((response: Response)=>{
                console.log('博文服务器请求成功')
                let res = response.json()
                console.log(res)
                if (res.status == 0){
                    this._dataSet = res.data
                    this._notify.success('博文列表请求失败',res.msg)
                }else {
                    this._notify.error('博文列表请求失败',res.msg)
                }
            })
            .catch((err)=>{
            this._message.error('博文列表请求失败')
        })
    }
    ngAfterViewInit() {
        // this._script.loadScripts('app-inner',
        //     ['assets/app/js/dashboard.js']);

    }

    deleteAll(){
        console.log("全部删除操作")
    }

    editItem(e){
        console.log('编辑项目：')
        console.log(e)
    }
    viewItem(e){
        console.log('预览项目：')
        console.log(e)
    }
    delItem(e){
        console.log('删除项目：')
        console.log(e)
    }
}