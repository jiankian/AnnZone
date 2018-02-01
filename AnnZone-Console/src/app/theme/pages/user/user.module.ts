import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { Routes, RouterModule } from '@angular/router';
import { ProfileComponent } from './profile/profile.component';
import { LayoutModule } from '../../layouts/layout.module';
import { DefaultComponent } from '../default/default.component';
import {FormsModule} from "@angular/forms";
import {HttpModule} from "@angular/http";
import {NzModalModule, NzUploadModule} from "ng-zorro-antd";
import {UserService} from "../../../auth/_services/user.service";
import {AuthenticationService} from "../../../auth/_services/authentication.service";
import {AuthGuard} from "../../../auth/_guards";

const routes: Routes = [
    {
        "path": "",
        "component": DefaultComponent,
        "children": [
            {
                "path": "profile",
                "component": ProfileComponent
            }
        ]
    }
];
@NgModule({
    imports: [
        CommonModule,
        RouterModule.forChild(routes),
        LayoutModule,
        HttpModule,
        FormsModule,
        NzUploadModule,
        NzModalModule,
    ],
    exports: [
        RouterModule
    ],
    providers:[
        AuthGuard,
        AuthenticationService,
        UserService,
    ],
    declarations: [
        ProfileComponent
    ]
})
export class UserModule {

}
