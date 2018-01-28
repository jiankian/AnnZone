import { Injectable } from "@angular/core";
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from "@angular/router";
import { UserService } from "../_services/user.service";
import { Observable } from "rxjs/Rx";

@Injectable()
export class AuthGuard implements CanActivate {

    constructor(private _router: Router, private _userService: UserService) {
    }

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): Observable<boolean> | boolean {
        try {
            let currentUser = JSON.parse(localStorage.getItem('currentUser'));
            if (currentUser && currentUser.token) {
                return true
            } else {
                this._router.navigate(['/login'], { queryParams: { returnUrl: state.url } });
                return false;
            }
        } catch (error) {
            console.log("解析本地用户信息失败！")
            this._router.navigate(['/login'], { queryParams: { returnUrl: state.url } });
            return false;
        }

    }
}