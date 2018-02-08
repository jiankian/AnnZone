import { HttpModule, BaseRequestOptions } from '@angular/http';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { LayoutModule } from '../../layouts/layout.module';
import { DefaultComponent } from '../default/default.component';
import { ListComponent } from './list/list.component';
import { CommentComponent } from './comment/comment.component';
import { PublishComponent } from './publish/publish.component';
import { RecycleComponent } from './recycle/recycle.component';
import { FormsModule } from '@angular/forms';
import {NzCardModule, NzListModule} from "ng-zorro-antd-extra";
import {NzSpinModule} from "ng-zorro-antd";

const routes: Routes = [
    {
        "path": "",
        "component": DefaultComponent,
        "children": [
            {
                "path": "",
                "component": ListComponent
            },
            {
                "path": "comment",
                "component": CommentComponent
            },
            {
                "path": "publish",
                "component": PublishComponent
            },
            {
                "path": "recycle",
                "component": RecycleComponent
            }
        ]
    }
];
@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(routes),
        LayoutModule,
        FormsModule,
        HttpModule,
        NzCardModule,
        NzListModule,
        NzSpinModule,
    ], exports: [
        RouterModule
    ], declarations: [
        ListComponent,
        CommentComponent,
        PublishComponent,
        RecycleComponent
    ],
    providers: [
        BaseRequestOptions
    ]
})
export class MicroBlogModule {

}