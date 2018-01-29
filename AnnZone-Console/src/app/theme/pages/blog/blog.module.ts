import { CommentComponent } from './comment/comment.component';
import { DraftComponent } from './draft/draft.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { LayoutModule } from '../../layouts/layout.module';
import { DefaultComponent } from '../default/default.component';
import { ListComponent } from './list/list.component';
import { PublishComponent } from './publish/publish.component';
import { ListCategoryComponent } from './category/list.component';
import { AddCategoryComponent } from './category/add.component';
import { RecycleComponent } from './recycle/recycle.component';
import {FormsModule} from "@angular/forms";
import {HttpModule} from "@angular/http";

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
                "path": "publish",
                "component": PublishComponent
            },
            {
                "path": "category",
                "component": ListCategoryComponent
            },
            {
                "path": "category/add",
                "component": AddCategoryComponent
            },
            {
                "path": "comment",
                "component": CommentComponent
            },
            {
                "path": "draft",
                "component": DraftComponent
            },
            {
                "path": "recycle",
                "component": RecycleComponent
            },

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
    ], exports: [
        RouterModule
    ], declarations: [
        ListComponent,
        PublishComponent,
        ListCategoryComponent,
        AddCategoryComponent,
        DraftComponent,
        RecycleComponent,
        CommentComponent
    ]
})
export class BlogModule {

}