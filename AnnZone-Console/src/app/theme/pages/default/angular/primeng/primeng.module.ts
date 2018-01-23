import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {FormsModule} from '@angular/forms';
import {RouterModule, Routes} from '@angular/router';
import {PrimengComponent} from './primeng.component';
import {PrimeNgInputComponent} from './input/primeng-input.component';
import {PrimeNgButtonComponent} from './button/primeng-button.component';
import {PrimeNgPanelComponent} from './panel/primeng-panel.component';
import {DefaultComponent} from '../../default.component';
import {LayoutModule} from '../../../../layouts/layout.module';

import {
	AccordionModule,
	ButtonModule,
	CheckboxModule,
	ChipsModule,
	CodeHighlighterModule,
	ColorPickerModule,
	InputMaskModule,
	FieldsetModule,
	GrowlModule,
	InputTextModule,
	MultiSelectModule,
	PanelModule,
	RadioButtonModule,
	SelectButtonModule,
	SplitButtonModule,
	TabViewModule
} from 'primeng/primeng';


const routes: Routes = [
	{
		path: "",
		component: DefaultComponent,
		children: [
			{
				path: "",
				component: PrimengComponent,
				children: [
					{path: 'input', component: PrimeNgInputComponent},
					{path: 'button', component: PrimeNgButtonComponent},
					{path: 'panel', component: PrimeNgPanelComponent},
				]
			}
		]
	},
];

@NgModule({
	imports: [
		CommonModule, RouterModule.forChild(routes),
		LayoutModule,
		FormsModule,
		// primeng modules
		ButtonModule,
		CheckboxModule,
		ChipsModule,
		CodeHighlighterModule,
		ColorPickerModule,
		InputMaskModule,
		GrowlModule,
		InputTextModule,
		MultiSelectModule,
		RadioButtonModule,
		SelectButtonModule,
		SplitButtonModule,
		TabViewModule,
		AccordionModule,
		PanelModule,
		FieldsetModule
	], declarations: [
		PrimengComponent,
		PrimeNgInputComponent,
		PrimeNgButtonComponent,
		PrimeNgPanelComponent
	]
})
export class PrimengModule {
}