import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { SelectItem } from "primeng/primeng";


@Component({
	selector: "app-primeng-input",
	templateUrl: "./primeng-input.component.html",
	encapsulation: ViewEncapsulation.None,
})
export class PrimeNgInputComponent implements OnInit {

	types: SelectItem[];
	selectedType: string;
	selectedTypes: string[] = ['Apartment', 'Studio'];

	chipValues1: string[];
	chipValues2: string[];

	cities: SelectItem[];
	selectedCity: any;

	cars: SelectItem[];
	selectedCar: string;
	selectedCar2: string = 'BMW';
	selectedCars: string[] = [];

	color1: string;
	color2: string = '#1976D2';

	val1: string;
	val2: string;
	val3: string;
	val4: string;
	val5: string;
	val6: string;

	constructor() {
		this.types = [];
		this.types.push({label: 'Apartment', value: 'Apartment'});
		this.types.push({label: 'House', value: 'House'});
		this.types.push({label: 'Studio', value: 'Studio'});

		this.cities = [];
		this.cities.push({label: 'New York', value: {id: 1, name: 'New York', code: 'NY'}});
		this.cities.push({label: 'Rome', value: {id: 2, name: 'Rome', code: 'RM'}});
		this.cities.push({label: 'London', value: {id: 3, name: 'London', code: 'LDN'}});
		this.cities.push({label: 'Istanbul', value: {id: 4, name: 'Istanbul', code: 'IST'}});
		this.cities.push({label: 'Paris', value: {id: 5, name: 'Paris', code: 'PRS'}});

		this.cars = [];
		this.cars.push({label: 'Audi', value: 'Audi'});
		this.cars.push({label: 'BMW', value: 'BMW'});
		this.cars.push({label: 'Fiat', value: 'Fiat'});
		this.cars.push({label: 'Ford', value: 'Ford'});
		this.cars.push({label: 'Honda', value: 'Honda'});
		this.cars.push({label: 'Jaguar', value: 'Jaguar'});
		this.cars.push({label: 'Mercedes', value: 'Mercedes'});
		this.cars.push({label: 'Renault', value: 'Renault'});
		this.cars.push({label: 'VW', value: 'VW'});
		this.cars.push({label: 'Volvo', value: 'Volvo'});
	}

	clear() {
		this.selectedType = null;
		this.selectedTypes = [];
	}

	ngOnInit() {
	}

}