//== Class definition

var DatatableHtmlTableDemo = function() {
  //== Private functions

  // demo initializer
  var microblog_list = function() {

    var datatable = $('.m-datatable').mDatatable({
      data: {
        saveState: {cookie: false},
      },
      search: {
        input: $('#generalSearch'),
      },
      columns: [
        {
          field: '更新时间',
          type: 'date',
          format: 'YYYY年MM月DD日 H时i分',
        },
      ],
    });
  };

  return {
    //== Public functions
    init: function() {
      // init dmeo
        microblog_list();
    },
  };
}();

jQuery(document).ready(function() {
  DatatableHtmlTableDemo.init();
});