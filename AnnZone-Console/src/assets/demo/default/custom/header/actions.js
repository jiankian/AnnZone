//== Class definition

var ActionsDemo = function () {    
    //== Private functions

    return {
        // public functions
        init: function() {
            $('.summernote').summernote({
                height: 250, 
            });
        }
    };
}();

//== Initialization
jQuery(document).ready(function() {
    ActionsDemo.init();
});