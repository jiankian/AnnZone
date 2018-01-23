import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {MenuItem, Message} from "primeng/primeng";


@Component({
	selector: "app-primeng-button",
	templateUrl: "./primeng-button.component.html",
	encapsulation: ViewEncapsulation.None,
})
export class PrimeNgButtonComponent implements OnInit {

	clicks: number = 0;
	msgs: Message[] = [];
	items: MenuItem[];

	constructor() {
		this.items = [
			{
				label: 'Update', icon: 'fa-refresh', command: () => {
				this.update();
			}
			},
			{
				label: 'Delete', icon: 'fa-close', command: () => {
				this.delete();
			}
			},
			{label: 'Angular.io', icon: 'fa-link', url: 'http://angular.io'},
			{label: 'Theming', icon: 'fa-paint-brush', routerLink: ['/theme']}
		];
	}

	ngOnInit() {
	}

	onclickCount() {
		this.clicks++;
	}

	save() {
		this.msgs = [];
		this.msgs.push({severity: 'info', summary: 'Success', detail: 'Data Saved'});
	}

	update() {
		this.msgs = [];
		this.msgs.push({severity: 'info', summary: 'Success', detail: 'Data Updated'});
	}

	delete() {
		this.msgs = [];
		this.msgs.push({severity: 'info', summary: 'Success', detail: 'Data Deleted'});
	}
}