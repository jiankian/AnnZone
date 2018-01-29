import { Component, OnInit, ViewEncapsulation, AfterViewInit, ComponentFactoryResolver } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import { AlertService } from "../../../../auth/_services/alert.service";
import { Router } from "@angular/router";
import { Headers, Http, RequestOptions } from "@angular/http";
import { Config } from "../../../../_ann";
import {NzMessageService, NzNotificationService} from "ng-zorro-antd";


@Component({
    selector: "app-inner",
    templateUrl: "./publish.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class PublishComponent implements OnInit, AfterViewInit {

    ann_blog: any = {}
    contentAlert: boolean = true
    headers: any
    options: any
    user: any = {}
    token: string

    blog_category: any = [
        { id: 1, name: '分类1' },
        { id: 2, name: '分类2' },
        { id: 3, name: '分类3' },
        { id: 4, name: '分类4' },
        { id: 5, name: '分类5' },
        { id: 6, name: '分类6' },
        { id: 7, name: '分类7' },
        { id: 8, name: '分类8' },
        { id: 9, name: '分类9' },
        { id: 10, name: '分类10' },
        { id: 11, name: '分类11' },
        { id: 12, name: '分类12' },]

    //主分类
    cid: number
    // 扩展分类 参照物
    extra_cid_cache: number[] = []
    //扩展分类选中集合
    private extra_cid: string;

    //
    showCoverDialog = false
    coverDialogImageUrl = ''

    //
    coverUploadUrl: string = ''
    coverUploadHeaders: any = {}

    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router,
        private _notify: NzNotificationService,
        private _message: NzMessageService,
        private _cfr: ComponentFactoryResolver,
        private _alertService: AlertService,

    ) {
        this.user = JSON.parse(localStorage.getItem("currentUser"))
        this.token = this.user.token;
        this.headers = new Headers({ 'ann_token': this.token });
        this.options = new RequestOptions({ headers: this.headers });
        this.coverUploadUrl = Config.api_url + 'attachment/upload'
        this.coverUploadHeaders = { 'ann_token': this.token }
    }
    ngOnInit() {

    }
    ngAfterViewInit() {
        this._script.loadScripts('app-inner',
            ['assets/app/js/dashboard.js']);
        this._script.loadScripts('app-inner',
            ['assets/demo/default/custom/components/forms/widgets/summernote.js']);
    }



    publish(e) {
        console.log("博文发布")
        console.log(e)
        console.log(this.ann_blog)
        let content = document.querySelector(".note-editable").innerHTML
        console.log(content)
        // 先把正文内容插入到文章对象中
        this.ann_blog.content = content
        // 选中值插入到提交参数的对象
        this.ann_blog.cid = this.cid
        this.ann_blog.extra_cid = this.extra_cid
        console.log(this.ann_blog)
    }

    mainCategory(e) {
        console.log("主分类选择器值")
        console.log(e)
        this.cid = e.id
        console.log(this.cid)
    }
    extraCategory(e) {
        console.log("扩展分类选择器值")
        console.log(e)
        let index = this.extra_cid_cache.indexOf(e.id)
        console.log('选中内容在参照物的位置：' + index)
        if (index > -1) {//如果是已经存在该选择就删除
            this.extra_cid_cache.splice(index, 1);
        } else {//如果不存在，那就加进去 最后就获得所有选中的数组
            this.extra_cid_cache.push(e.id)
        }
        // 看下选中结果是哪些值：
        console.log(this.extra_cid_cache)
        // 传服务器请转换成 , 分割
        this.extra_cid = this.extra_cid_cache.join(',')
        console.log('此刻正在选中的值：')
        console.log(this.extra_cid)
    }

    coverPreviewHandle(e) {
        console.log('封面预览事件')
        console.log(e)
    }

    coverRemoveHandle(e) {
        console.log('封面移除事件')
        console.log(e)
    }

    coverSeccessHandle(e) {
        console.log('封面上传(请求)成功事件')
        console.log(e)
        console.log(e.response.body)
    }

    clearForm(e) {
        console.log("清空表单")
        this.cid = 0
        this.extra_cid = ''
        this.extra_cid_cache = []
        this.ann_blog = {}
        document.querySelector(".note-editable").innerHTML = ''
    }

}