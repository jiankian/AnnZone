//== Class definition

var BootstrapTimepicker = function () {
    
    //== Private functions
    var demos = function () {
        // minimum setup
        $('#m_timepicker_1, #m_timepicker_1_modal').timepicker();

        // minimum setup
        $('#m_timepicker_2, #m_timepicker_2_modal').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false,
            snapToStep: true
        });

        // default time
        $('#m_timepicker_3, #m_timepicker_3_modal').timepicker({
            defaultTime: '11:45:20 AM',
            minuteStep: 1,
            showSeconds: true,
            showMeridian: true
        });

        // default time
        $('#m_timepicker_4, #m_timepicker_4_modal').timepicker({
            defaultTime: '10:30:20 AM',           
            minuteStep: 1,
            showSeconds: true,
            showMeridian: true
        });

        // validation state demos
        // minimum setup
        $('#m_timepicker_1_validate, #m_timepicker_2_validate, #m_timepicker_3_validate').timepicker({
            minuteStep: 1,
            showSeconds: true,
            showMeridian: false,
            snapToStep: true
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
    BootstrapTimepicker.init();
});