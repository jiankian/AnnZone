//== Class definition

var DefaultDatatableDemo = function() {
	//== Private functions

	// basic demo
	var demo = function() {

		var options = {
			// datasource definition
			data: {
				type: 'remote',
				source: {
					read: {
						url: 'https://keenthemes.com/metronic/preview/inc/api/datatables/demos/default.php',
					},
				},
				pageSize: 20, // display 20 records per page
				serverPaging: true,
				serverFiltering: true,
				serverSorting: true,
			},

			// layout definition
			layout: {
				theme: 'default', // datatable theme
				class: '', // custom wrapper class
				scroll: true, // enable/disable datatable scroll both horizontal and vertical when needed.
				height: 550, // datatable's body's fixed height
				footer: false // display/hide footer
			},

			// column sorting
			sortable: true,

			pagination: true,

			search: {
				input: $('#generalSearch'),
			},

			// columns definition
			columns: [
				{
					field: 'RecordID',
					title: '#',
					sortable: false, // disable sort for this column
					width: 40,
					selector: {class: 'm-checkbox--solid m-checkbox--brand'},
				}, {
					field: 'ID',
					title: 'ID',
					sortable: false,
					width: 40,
					template: '{{RecordID}}',
				}, {
					field: 'ShipCountry',
					title: 'Ship Country',
					width: 150,
					template: function(row) {
						// callback function support for column rendering
						return row.ShipCountry + ' - ' + row.ShipCity;
					},
				}, {
					field: 'ShipCity',
					title: 'Ship City',
				}, {
					field: 'Currency',
					title: 'Currency',
					width: 100,
				}, {
					field: 'ShipDate',
					title: 'Ship Date',
					sortable: 'asc',
				}, {
					field: 'Latitude',
					title: 'Latitude',
				}, {
					field: 'Status',
					title: 'Status',
					// callback function support for column rendering
					template: function(row) {
						var status = {
							1: {'title': 'Pending', 'class': 'm-badge--brand'},
							2: {'title': 'Delivered', 'class': ' m-badge--metal'},
							3: {'title': 'Canceled', 'class': ' m-badge--primary'},
							4: {'title': 'Success', 'class': ' m-badge--success'},
							5: {'title': 'Info', 'class': ' m-badge--info'},
							6: {'title': 'Danger', 'class': ' m-badge--danger'},
							7: {'title': 'Warning', 'class': ' m-badge--warning'},
						};
						return '<span class="m-badge ' + status[row.Status].class + ' m-badge--wide">' + status[row.Status].title + '</span>';
					},
				}, {
					field: 'Type',
					title: 'Type',
					// callback function support for column rendering
					template: function(row) {
						var status = {
							1: {'title': 'Online', 'state': 'danger'},
							2: {'title': 'Retail', 'state': 'primary'},
							3: {'title': 'Direct', 'state': 'accent'},
						};
						return '<span class="m-badge m-badge--' + status[row.Type].state + ' m-badge--dot"></span>&nbsp;<span class="m--font-bold m--font-' +
							status[row.Type].state + '">' +
							status[row.Type].title + '</span>';
					},
				}, {
					field: 'Actions',
					width: 110,
					title: 'Actions',
					sortable: false,
					overflow: 'visible',
					template: function (row, index, datatable) {
						var dropup = (datatable.getPageSize() - index) <= 4 ? 'dropup' : '';
						return '\
						<div class="dropdown ' + dropup + '">\
							<a href="#" class="btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="dropdown">\
                                <i class="la la-ellipsis-h"></i>\
                            </a>\
						  	<div class="dropdown-menu dropdown-menu-right">\
						    	<a class="dropdown-item" href="#"><i class="la la-edit"></i> Edit Details</a>\
						    	<a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>\
						    	<a class="dropdown-item" href="#"><i class="la la-print"></i> Generate Report</a>\
						  	</div>\
						</div>\
						<a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details">\
							<i class="la la-edit"></i>\
						</a>\
						<a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete">\
							<i class="la la-trash"></i>\
						</a>\
					';
					},
				}],
		};

		var datatable = $('.m_datatable').mDatatable(options);

		// both methods are supported
		// datatable.methodName(args); or $(datatable).mDatatable(methodName, args);

		$('#m_datatable_destroy').on('click', function() {
			// datatable.destroy();
			$('.m_datatable').mDatatable('destroy');
		});

		$('#m_datatable_init').on('click', function() {
			datatable = $('.m_datatable').mDatatable(options);
		});

		$('#m_datatable_reload').on('click', function() {
			// datatable.reload();
			$('.m_datatable').mDatatable('reload');
		});

		$('#m_datatable_sort').on('click', function() {
			// datatable.sort('ShipCity');
			$('.m_datatable').mDatatable('sort', 'ShipCity');
		});

		// get checked record and get value by column name
		$('#m_datatable_get').on('click', function() {
			// select active rows
			datatable.rows('.m-datatable__row--active');
			// check selected nodes
			if (datatable.nodes().length > 0) {
				// get column by field name and get the column nodes
				var value = datatable.columns('ShipCity').nodes().text();
				$('#datatable_value').html(value);
			}
		});

		// record selection
		$('#m_datatable_check').on('click', function() {
			var input = $('#m_datatable_check_input').val();
			datatable.setActive(input);
		});

		$('#m_datatable_check_all').on('click', function() {
			// datatable.setActiveAll(true);
			$('.m_datatable').mDatatable('setActiveAll', true);
		});

		$('#m_datatable_uncheck_all').on('click', function() {
			// datatable.setActiveAll(false);
			$('.m_datatable').mDatatable('setActiveAll', false);
		});

		$('#m_datatable_hide_column').on('click', function() {
			datatable.columns('Currency').visible(false);
		});

		$('#m_datatable_show_column').on('click', function() {
			datatable.columns('Currency').visible(true);
		});

		$('#m_datatable_remove_row').on('click', function() {
			datatable.rows('.m-datatable__row--active').remove();
		});
	};

	return {
		// public functions
		init: function() {
			demo();
		},
	};
}();

jQuery(document).ready(function() {
	DefaultDatatableDemo.init();
});