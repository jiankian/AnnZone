//== Class definition

var BootstrapMaxlength = function () {
    
    //== Private functions
    var demos = function () {
        // minimum setup
        $('#m_maxlength_1').maxlength({
            warningClass: "m-badge m-badge--warning m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide"
        });

        // threshold value
        $('#m_maxlength_2').maxlength({
            threshold: 5,
            warningClass: "m-badge m-badge--danger m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide"
        });

        // always show
        $('#m_maxlength_3').maxlength({
            alwaysShow: true,
            threshold: 5,
            warningClass: "m-badge m-badge--primary m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        // custom text
        $('#m_maxlength_4').maxlength({
            threshold: 3,
            warningClass: "m-badge m-badge--danger m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide",
            separator: ' of ',
            preText: 'You have ',
            postText: ' chars remaining.',
            validate: true
        });

        // textarea example
        $('#m_maxlength_5').maxlength({
            threshold: 5,
            warningClass: "m-badge m-badge--primary m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        // position examples
        $('#m_maxlength_6_1').maxlength({
            alwaysShow: true,
            threshold: 5,
            placement: 'top-left',
            warningClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        $('#m_maxlength_6_2').maxlength({
            alwaysShow: true,
            threshold: 5,
            placement: 'top-right',
            warningClass: "m-badge m-badge--success m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        $('#m_maxlength_6_3').maxlength({
            alwaysShow: true,
            threshold: 5,
            placement: 'bottom-left',
            warningClass: "m-badge m-badge--warning m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        $('#m_maxlength_6_4').maxlength({
            alwaysShow: true,
            threshold: 5,
            placement: 'bottom-right',
            warningClass: "m-badge m-badge--danger m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide"
        });

        //== Modal Examples

        // minimum setup
        $('#m_maxlength_1_modal').maxlength({
            warningClass: "m-badge m-badge--warning m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide",
            appendToParent: true
        });

        // threshold value
        $('#m_maxlength_2_modal').maxlength({
            threshold: 5,
            warningClass: "m-badge m-badge--danger m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide",
            appendToParent: true
        });

        // always show
        // textarea example
        $('#m_maxlength_5_modal').maxlength({
            threshold: 5,
            warningClass: "m-badge m-badge--primary m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--brand m-badge--rounded m-badge--wide",
            appendToParent: true
        });

        // custom text
        $('#m_maxlength_4_modal').maxlength({
            threshold: 3,
            warningClass: "m-badge m-badge--danger m-badge--rounded m-badge--wide",
            limitReachedClass: "m-badge m-badge--success m-badge--rounded m-badge--wide",
            appendToParent: true,
            separator: ' of ',
            preText: 'You have ',
            postText: ' chars remaining.',
            validate: true
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
    BootstrapMaxlength.init();
});