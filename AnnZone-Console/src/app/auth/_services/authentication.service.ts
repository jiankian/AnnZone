import { Config } from './../../_ann/config';
import { Injectable } from "@angular/core";
import { Http, Response } from "@angular/http";
import "rxjs/add/operator/map";
import {NzMessageService, NzNotificationService} from "ng-zorro-antd";


@Injectable()
export class AuthenticationService {

    constructor(private http: Http,
                private _notify:NzNotificationService,
                private _message:NzMessageService
    ) {
    }

    login(username: string, password: string) {
        //记住，千万别转成JSON.stringify
        let param = { username: username, password: password };
        console.log("参数打印")
        console.log(param)
        // 如需get方式登录
        //let getParams= '?username='+username+'&password='+password;
        return this.http.post(Config.api_url + 'user/signin', param)
            .map((response: Response) => {
                // login successful if there's a jwt token in the response
                console.log("登录服务器请求结果打印：")
                console.log(response)
                let user = response.json();
                console.log(user)
                if (user && user.data.token) {
                    // store user details and jwt token in local storage to keep user logged in between page refreshes
                    localStorage.setItem('currentUser', JSON.stringify(user.data));
                    return true
                } else {
                    this._notify.error("登录失败！",user.msg)
                    return false
                }
            });
    }

    logout() {
        // remove user from local storage to log user out
        localStorage.removeItem('currentUser');
    }
}