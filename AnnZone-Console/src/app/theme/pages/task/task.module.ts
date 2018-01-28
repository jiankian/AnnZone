import { AddComponent } from './list/add.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Routes, RouterModule } from '@angular/router';
import { LayoutModule } from '../../layouts/layout.module';
import { DefaultComponent } from '../default/default.component';
import { ListComponent } from './list/list.component';

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
                "path": "add",
                "component": AddComponent
            }
        ]
    }
];
@NgModule({
    imports: [
        CommonModule, 
        RouterModule.forChild(routes), 
        LayoutModule
    ], exports: [
        RouterModule
    ], declarations: [
        ListComponent,
        AddComponent
    ]
})
export class TaskModule {

}