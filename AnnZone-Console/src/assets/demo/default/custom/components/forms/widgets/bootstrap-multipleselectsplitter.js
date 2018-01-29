//== Class definition

var BootstrapMultipleSelectsplitter = function () {
    
    //== Private functions
    var demos = function () {
        // minimum setup
        $('#m_multipleselectsplitter_1, #m_multipleselectsplitter_2').multiselectsplitter();
    }

    return {
        // public functions
        init: function() {
            demos(); 
        }
    };
}();

jQuery(document).ready(function() {    
    BootstrapMultipleSelectsplitter.init();
});