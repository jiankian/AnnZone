import { Config } from './../../../../_ann/config';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Component, OnInit, ViewEncapsulation, AfterViewInit, ViewContainerRef, ViewChild, ComponentFactoryResolver } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import { Router } from '@angular/router';
import { AlertService } from './../../../../auth/_services/alert.service';
import { AlertComponent } from '../../../../auth/_directives/alert.component';
import { NzMessageService, NzNotificationService } from "ng-zorro-antd";

@Component({
    selector: "app-inner",
    templateUrl: "./publish.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class PublishComponent implements OnInit, AfterViewInit {

    @ViewChild('alertPublish',
        { read: ViewContainerRef }) alertPublish: ViewContainerRef;
    ann_microblog: any = {}
    headers: any
    options: any
    token: string
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

    message(type: string, msg: string): void {
        this._message[type](msg)
    }

    publish() {
        console.log(this.ann_microblog)
        if (!this.ann_microblog.content || this.ann_microblog.content.trim() == "") {
            this.showAlert('alertPublish');
            this._alertService.error("微博不能为空！");
            return false;
        }
        //console.log(this.headers)
        return this._http.post(Config.api_url + 'microblog/publish', { ann_microblog: this.ann_microblog }, this.options)
            .toPromise()
            .then(
            (response: Response) => {
                console.log("发布请求结果：")
                console.log(response)
                console.log(response.json())
                let res = response.json()
                if (res && res.status == 0) {
                    this.message("success", "微博发布成功！")
                    this.showAlert('alertPublish');
                    this._alertService.success("微博发布成功！");
                    // 清空表单输入
                    this.ann_microblog = {}
                    this._router.navigate(['/microblog'])
                } else {
                    this.message("error", "微博发布失败！")
                    this.showAlert('alertPublish');
                    this._alertService.error("微博发布失败！" + res.msg);
                }

            })
            .catch((err) => {
                console.log(err);
                this.message("error", "微博发布失败！")
                this.showAlert('alertPublish');
                this._alertService.error("微博发布失败！" + err);
            });
        // this._http.post(Config.api_url + "microblog/publish",{ann_microblog: this.ann_microblog},this.options).toPromise().then((res) =>{
        //     console.log(res);

        // })
    }
    ngOnInit() {

    }
    ngAfterViewInit() {
        this._script.loadScripts('app-inner',
            ['assets/app/js/dashboard.js']);

    }
    showAlert(target) {
        this[target].clear();
        let factory = this._cfr.resolveComponentFactory(AlertComponent);
        let ref = this[target].createComponent(factory);
        ref.changeDetectorRef.detectChanges();
    }
}