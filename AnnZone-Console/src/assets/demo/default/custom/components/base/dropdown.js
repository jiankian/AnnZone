//== Class definition

var DropdownDemo = function () {
    
    //== Private functions

    // basic demo
    var demo1 = function () {
        var output = $('#m_dropdown_api_output');
        var dropdown1 = $('#m_dropdown_api_1');
        var dropdown2 = $('#m_dropdown_api_2');

        dropdown1.mDropdown().on('afterShow', function(dropdown) {
            output.append('<p>Dropdown 1: afterShow event fired</p>');
        });
        dropdown1.mDropdown().on('beforeShow', function(dropdown) {
            output.append('<p>Dropdown 1: beforeShow event fired</p>');
        });
        dropdown1.mDropdown().on('afterHide', function(dropdown) {
            output.append('<p>Dropdown 1: afterHide event fired</p>');
        });
        dropdown1.mDropdown().on('beforeHide', function(dropdown) {
            output.append('<p>Dropdown 1: beforeHide event fired</p>');
        });
    
        dropdown2.mDropdown().on('afterShow', function(dropdown) {
            output.append('<p>Dropdown 2: afterShow event fired</p>');
        });
        dropdown2.mDropdown().on('beforeShow', function(dropdown) {
            output.append('<p>Dropdown 2: beforeShow event fired</p>');
        });
        dropdown2.mDropdown().on('afterHide', function(dropdown) {
            output.append('<p>Dropdown 2: afterHide event fired</p>');
        });
        dropdown2.mDropdown().on('beforeHide', function(dropdown) {
            output.append('<p>Dropdown 2: beforeHide event fired</p>');
        });    
    }

    return {
        // public functions
        init: function() {
            demo1();
        }
    };
}();

jQuery(document).ready(function() {    
    DropdownDemo.init();
});