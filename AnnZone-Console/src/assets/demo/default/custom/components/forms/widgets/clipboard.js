//== Class definition

var ClipboardDemo = function () {
    
    //== Private functions
    var demos = function () {
        // basic example
        new Clipboard('[data-clipboard=true]').on('success', function(e) {
            e.clearSelection();
            alert('Copied!');
        });
    }

    return {
        // public functions
        init: function() {
            demos(); 
        }
    };
}();

jQuery(document).ready(function() {    
    ClipboardDemo.init();
});