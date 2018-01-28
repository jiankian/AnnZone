import { Config } from './../../../../_ann/config';
import { Http, Headers, Response, RequestOptions } from '@angular/http';
import { Component, OnInit, ViewEncapsulation, AfterViewInit } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import { Router } from '@angular/router';
import "rxjs/add/operator/map";


@Component({
    selector: "app-inner",
    templateUrl: "./publish.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class PublishComponent implements OnInit, AfterViewInit {

    ann_microblog:any = {}
    headers: any
    options: any
    token: string
    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router
    
    ) {
        this.token = JSON.parse(localStorage.getItem("currentUser")).token;
        this.headers = new Headers({ 'ann_token':  this.token});
        this.options = new RequestOptions({ headers: this.headers });
    }


    publish(){
        console.log(this.ann_microblog)
        //console.log(this.headers)
        return this._http.post(Config.api_url+'microblog/publish',{ann_microblog: this.ann_microblog},this.options).map((response: Response) => {
            console.log("发布请求结果：")
            console.log(response)
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

}