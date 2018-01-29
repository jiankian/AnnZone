//== Class definition

var BootstrapNotifyDemo = function () {
    
    //== Private functions

    // basic demo
    var demo = function () {
        // init bootstrap switch
        $('[data-switch=true]').bootstrapSwitch();

        // handle the demo
        $('#m_notify_btn').click(function() {
            var content = {};

            content.message = 'New order has been placed';
            if ($('#m_notify_title').prop('checked')) {
                content.title = 'Notification Title';
            }
            if ($('#m_notify_icon').val() != '') {
                content.icon = 'icon ' + $('#m_notify_icon').val();
            }
            if ($('#m_notify_url').prop('checked')) {
                content.url = 'www.keenthemes.com';
                content.target = '_blank';
            }

            var notify = $.notify(content, { 
                type: $('#m_notify_state').val(),
                allow_dismiss: $('#m_notify_dismiss').prop('checked'),
                newest_on_top: $('#m_notify_top').prop('checked'),
                mouse_over:  $('#m_notify_pause').prop('checked'),
                showProgressbar:  $('#m_notify_progress').prop('checked'),
                spacing: $('#m_notify_spacing').val(),                    
                timer: $('#m_notify_timer').val(),
                placement: {
                    from: $('#m_notify_placement_from').val(), 
                    align: $('#m_notify_placement_align').val()
                },
                offset: {
                    x: $('#m_notify_offset_x').val(), 
                    y: $('#m_notify_offset_y').val()
                },
                delay: $('#m_notify_delay').val(),
                z_index: $('#m_notify_zindex').val(),
                animate: {
                    enter: 'animated ' + $('#m_notify_animate_enter').val(),
                    exit: 'animated ' + $('#m_notify_animate_exit').val()
                }
            });

            if ($('#m_notify_progress').prop('checked')) {
                setTimeout(function() {
                    notify.update('message', '<strong>Saving</strong> Page Data.');
                    notify.update('type', 'primary');
                    notify.update('progress', 20);
                }, 1000);

                setTimeout(function() {
                    notify.update('message', '<strong>Saving</strong> User Data.');
                    notify.update('type', 'warning');
                    notify.update('progress', 40);
                }, 2000);

                setTimeout(function() {
                    notify.update('message', '<strong>Saving</strong> Profile Data.');
                    notify.update('type', 'danger');
                    notify.update('progress', 65);
                }, 3000);

                setTimeout(function() {
                    notify.update('message', '<strong>Checking</strong> for errors.');
                    notify.update('type', 'success');
                    notify.update('progress', 100);
                }, 4000);
            }
        });
    }

    return {
        // public functions
        init: function() {
            demo();
        }
    };
}();

jQuery(document).ready(function() {    
    BootstrapNotifyDemo.init();
});