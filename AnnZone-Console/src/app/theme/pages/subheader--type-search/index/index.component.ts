import { Component, OnInit, ViewEncapsulation, AfterViewInit } from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import {Http} from "@angular/http";
import {NzMessageService, NzNotificationService} from "ng-zorro-antd";


@Component({
    selector: "app-index",
    templateUrl: "./index.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class IndexComponent implements OnInit, AfterViewInit {

    microblogNum:number = 0
    blogNum:number = 0
    noteNum:number = 0


    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _notify: NzNotificationService,
        private _message: NzMessageService,

    ) {

    }
    ngOnInit() {

    }
    ngAfterViewInit() {
        this._script.loadScripts('app-index',
            ['assets/app/js/dashboard.js']);

    }

}