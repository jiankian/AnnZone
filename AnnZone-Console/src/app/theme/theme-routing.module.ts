import { NgModule } from '@angular/core';
import { ThemeComponent } from './theme.component';
import { Routes, RouterModule } from '@angular/router';
import { AuthGuard } from "../auth/_guards/auth.guard";

const routes: Routes = [
    {
        "path": "",
        "component": ThemeComponent,
        "canActivate": [AuthGuard],
        "children": [
            {
                "path": "index",
                "loadChildren": ".\/pages\/subheader--type-search\/index\/index.module#IndexModule"
            },
            {
                "path": "inner",
                "loadChildren": ".\/pages\/default\/inner\/inner.module#InnerModule"
            },
            {
                "path": "account",
                "loadChildren": ".\/pages\/account\/account.module#AccountModule"
            },
            {
                "path": "album",
                "loadChildren": ".\/pages\/album\/album.module#AlbumModule"
            },
            {
                "path": "blog",
                "loadChildren": ".\/pages\/blog\/blog.module#BlogModule"
            },
            {
                "path": "health",
                "loadChildren": ".\/pages\/health\/health.module#HealthModule"
            },
            {
                "path": "microblog",
                "loadChildren": ".\/pages\/microblog\/microblog.module#MicroBlogModule"
            },
            {
                "path": "note",
                "loadChildren": ".\/pages\/note\/note.module#NoteModule"
            },
            {
                "path": "project",
                "loadChildren": ".\/pages\/project\/project.module#ProjectModule"
            },
            {
                "path": "space",
                "loadChildren": ".\/pages\/space\/space.module#SpaceModule"
            },
            {
                "path": "system",
                "loadChildren": ".\/pages\/system\/system.module#SystemModule"
            },
            {
                "path": "task",
                "loadChildren": ".\/pages\/task\/task.module#TaskModule"
            },
            {
                "path": "user",
                "loadChildren": ".\/pages\/user\/user.module#UserModule"
            },
            {
                "path": "video",
                "loadChildren": ".\/pages\/video\/video.module#VideoModule"
            },
            {
                "path": "message",
                "loadChildren": ".\/pages\/message\/message.module#MessageModule"
            },
            {
                "path": "404",
                "loadChildren": ".\/pages\/default\/not-found\/not-found.module#NotFoundModule"
            },
            {
                "path": "",
                "redirectTo": "index",
                "pathMatch": "full"
            }
        ]
    },
    {
        "path": "**",
        "redirectTo": "404",
        "pathMatch": "full"
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})
export class ThemeRoutingModule { }