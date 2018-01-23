import {Component, Input, OnInit, ViewEncapsulation} from '@angular/core';
import {FormBuilder} from "@angular/forms";
import {ModalDismissReasons, NgbDateStruct, NgbModal} from "@ng-bootstrap/ng-bootstrap";

const now = new Date();

@Component({
	selector: ".m-grid__item.m-grid__item--fluid.m-wrapper",
	templateUrl: "./ng-bootstrap.component.html",
	encapsulation: ViewEncapsulation.None,
})
export class NgBootstrapComponent implements OnInit {

	@Input()
	public alerts: Array<IAlert> = [];
	public isCollapsed = false;
	public datepickerModel: NgbDateStruct;
	public date: { year: number, month: number };
	public modalClose: string;
	public page = 4;
	public name = 'World';
	public ratingSelected = 0;
	public ratingHovered = 0;
	public ratingReadonly = false;
	public timepickerTime = {hour: 13, minute: 30};
	public timepickerMeridian = true;
	public checkboxModel = {left: true, middle: false, right: false};
	public backup: Array<IAlert>;
	public hovered;

	constructor(private formBuilder: FormBuilder,
	            private modalService: NgbModal) {
	}

	ngOnInit() {
		this.alertInit();
	}

	alertInit() {
		this.alerts.push({
			id: 1,
			type: 'success',
			message: 'This is an success alert',
		}, {
			id: 2,
			type: 'info',
			message: 'This is an info alert',
		}, {
			id: 3,
			type: 'warning',
			message: 'This is a warning alert',
		}, {
			id: 4,
			type: 'danger',
			message: 'This is a danger alert',
		});
		this.backup = this.alerts.map((alert: IAlert) => Object.assign({}, alert));
	}

	public alertClose(alert: IAlert) {
		const index: number = this.alerts.indexOf(alert);
		this.alerts.splice(index, 1);
	}

	public alertReset() {
		this.alerts = this.backup.map((alert: IAlert) => Object.assign({}, alert));
	}

	datepickerToday() {
		this.datepickerModel = {year: now.getFullYear(), month: now.getMonth() + 1, day: now.getDate()};
	}

	modalOpen(content) {
		this.modalService.open(content).result.then((result) => {
			this.modalClose = `Closed with: ${result}`;
		}, (reason) => {
			this.modalClose = `Dismissed ${this.modalDismissReason(reason)}`;
		});
	}

	timepickerToggle() {
		this.timepickerMeridian = !this.timepickerMeridian;
	}

	private modalDismissReason(reason: any): string {
		if (reason === ModalDismissReasons.ESC) {
			return 'by pressing ESC';
		} else if (reason === ModalDismissReasons.BACKDROP_CLICK) {
			return 'by clicking on a backdrop';
		} else {
			return `with: ${reason}`;
		}
	}
}

export interface IAlert {
	id: number;
	type: string;
	message: string;
}