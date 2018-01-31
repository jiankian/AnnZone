import { HttpModule, BaseRequestOptions } from '@angular/http';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule, ErrorHandler } from '@angular/core';
import { ThemeComponent } from './theme/theme.component';
import { LayoutModule } from './theme/layouts/layout.module';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ScriptLoaderService } from "./_services/script-loader.service";
import { ThemeRoutingModule } from "./theme/theme-routing.module";
import { AuthModule } from "./auth/auth.module";
import { NgZorroAntdModule } from "ng-zorro-antd";
import { HttpClientModule } from "@angular/common/http";
import { NgZorroAntdExtraModule } from "ng-zorro-antd-extra";


//fundebug
// import * as fundebug from "fundebug-javascript";
// fundebug.apikey = "576472ab60c50c49f7b8e3d5e1cec250103c103b88284af5ae9bab217d68ab7d";

// 定义FundebugErrorHandler
// export class FundebugErrorHandler implements ErrorHandler {
//     handleError(err: any): void {
//         fundebug.notifyError(err);
//     }
// }

@NgModule({
    declarations: [
        ThemeComponent,
        AppComponent,
    ],
    imports: [
        LayoutModule,
        BrowserModule,
        BrowserAnimationsModule,
        AppRoutingModule,
        ThemeRoutingModule,
        AuthModule,
        HttpModule,
        NgZorroAntdModule.forRoot(),
        HttpClientModule,
        NgZorroAntdExtraModule.forRoot(),
    ],
    providers: [
        ScriptLoaderService,
        BaseRequestOptions,
        // { provide: ErrorHandler, useClass: FundebugErrorHandler },
    ],
    bootstrap: [AppComponent]
})
export class AppModule { }