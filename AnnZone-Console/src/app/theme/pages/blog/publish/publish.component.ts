import {Component, OnInit, ViewEncapsulation, AfterViewInit, ComponentFactoryResolver} from '@angular/core';
import { Helpers } from '../../../../helpers';
import { ScriptLoaderService } from '../../../../_services/script-loader.service';
import {ElMessageService, ElNotificationService} from "element-angular";
import {AlertService} from "../../../../auth/_services/alert.service";
import {Router} from "@angular/router";
import {Http} from "@angular/http";


@Component({
    selector: "app-inner",
    templateUrl: "./publish.component.html",
    encapsulation: ViewEncapsulation.None,
})
export class PublishComponent implements OnInit, AfterViewInit {

    ann_blog: any = {}
    contentAlert: boolean = true
    constructor(
        private _script: ScriptLoaderService,
        private _http: Http,
        private _router: Router,
        private _notify: ElNotificationService,
        private _message: ElMessageService,
        private _cfr: ComponentFactoryResolver,
        private _alertService: AlertService,

    ) {

    }
    ngOnInit() {

    }
    ngAfterViewInit() {
        this._script.loadScripts('app-inner',
            ['assets/app/js/dashboard.js']);
        this._script.loadScripts('app-inner',
            ['assets/demo/default/custom/components/forms/widgets/summernote.js']);

    }

    publish(e){
        console.log("博文发布")
        console.log(e)
        console.log(this.ann_blog)
        let  content = document.querySelector(".note-editable").innerHTML
        console.log(content)

    }

}