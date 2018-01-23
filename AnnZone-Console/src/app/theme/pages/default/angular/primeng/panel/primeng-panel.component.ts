import {Component, OnInit, ViewEncapsulation} from '@angular/core';
import {Message} from "primeng/primeng";


@Component({
	selector: "app-primeng-panel",
	templateUrl: "./primeng-panel.component.html",
	encapsulation: ViewEncapsulation.None,
})
export class PrimeNgPanelComponent implements OnInit {

	msgs: Message[];
	index: number = 0;
	public save;
	public items;

	ngOnInit() {
	}

	onTabClose(event) {
		this.msgs = [];
		this.msgs.push({severity: 'info', summary: 'Tab Closed', detail: 'Index: ' + event.index});
	}

	onTabOpen(event) {
		this.msgs = [];
		this.msgs.push({severity: 'info', summary: 'Tab Expanded', detail: 'Index: ' + event.index});
	}

	openNext() {
		this.index = (this.index === 3) ? 0 : this.index + 1;
	}

	openPrev() {
		this.index = (this.index === 0) ? 3 : this.index - 1;
	}
}