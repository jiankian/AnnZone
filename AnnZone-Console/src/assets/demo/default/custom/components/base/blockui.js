//== Class definition

var BlockUIDemo = function () {
    
    //== Private functions

    //== Basic demo
    var demo1 = function () {
        // default
        $('#m_blockui_1_1').click(function() {
            mApp.block('#m_blockui_1_content', {});

            setTimeout(function() {
                mApp.unblock('#m_blockui_1_content');
            }, 2000);
        });

        $('#m_blockui_1_2').click(function() {
            mApp.block('#m_blockui_1_content', {
                overlayColor: '#000000',
                state: 'primary'
            });  

            setTimeout(function() {
                mApp.unblock('#m_blockui_1_content');
            }, 2000);
        });

        $('#m_blockui_1_3').click(function() {
            mApp.block('#m_blockui_1_content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                size: 'lg'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_1_content');
            }, 2000);
        });

        $('#m_blockui_1_4').click(function() {
            mApp.block('#m_blockui_1_content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                message: 'Please wait...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_1_content');
            }, 2000);
        });

        $('#m_blockui_1_5').click(function() {
            mApp.block('#m_blockui_1_content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'primary',
                message: 'Processing...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_1_content');
            }, 2000);
        });
    }

    // portlet blocking
    var demo2 = function () {
        // default
        $('#m_blockui_2_1').click(function() {
            mApp.block('#m_blockui_2_portlet', {});

            setTimeout(function() {
                mApp.unblock('#m_blockui_2_portlet');
            }, 2000);
        });

        $('#m_blockui_2_2').click(function() {
            mApp.block('#m_blockui_2_portlet', {
                overlayColor: '#000000',
                state: 'primary'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_2_portlet');
            }, 2000);
        });

        $('#m_blockui_2_3').click(function() {
            mApp.block('#m_blockui_2_portlet', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                size: 'lg'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_2_portlet');
            }, 2000);
        });

        $('#m_blockui_2_4').click(function() {
            mApp.block('#m_blockui_2_portlet', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                message: 'Please wait...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_2_portlet');
            }, 2000);
        });

        $('#m_blockui_2_5').click(function() {
            mApp.block('#m_blockui_2_portlet', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'primary',
                message: 'Processing...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_2_portlet');
            }, 2000);
        });
    }

    // page blocking
    var demo3 = function () {
        // default
        $('#m_blockui_3_1').click(function() {
            mApp.blockPage();

            setTimeout(function() {
                mApp.unblockPage();
            }, 2000);
        });

        $('#m_blockui_3_2').click(function() {
            mApp.blockPage({
                overlayColor: '#000000',
                state: 'primary'
            });

            setTimeout(function() {
                mApp.unblockPage();
            }, 2000);
        });

        $('#m_blockui_3_3').click(function() {
            mApp.blockPage({
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                size: 'lg'
            });

            setTimeout(function() {
                mApp.unblockPage();
            }, 2000);
        });

        $('#m_blockui_3_4').click(function() {
            mApp.blockPage({
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                message: 'Please wait...'
            });

            setTimeout(function() {
                mApp.unblockPage();
            }, 2000);
        });

        $('#m_blockui_3_5').click(function() {
            mApp.blockPage({
                overlayColor: '#000000',
                type: 'loader',
                state: 'primary',
                message: 'Processing...'
            });

            setTimeout(function() {
                mApp.unblockPage();
            }, 2000);
        });
    }

    // modal blocking
    var demo4 = function () {
        // default
        $('#m_blockui_4_1').click(function() {
            mApp.block('#m_blockui_4_1_modal .modal-content', {});

            setTimeout(function() {
                mApp.unblock('#m_blockui_4_1_modal .modal-content');
            }, 2000);
        });

        $('#m_blockui_4_2').click(function() {
            mApp.block('#m_blockui_4_2_modal .modal-content', {
                overlayColor: '#000000',
                state: 'primary'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_4_2_modal .modal-content');
            }, 2000);
        });

        $('#m_blockui_4_3').click(function() {
            mApp.block('#m_blockui_4_3_modal .modal-content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                size: 'lg'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_4_3_modal .modal-content');
            }, 2000);
        });

        $('#m_blockui_4_4').click(function() {
            mApp.block('#m_blockui_4_4_modal .modal-content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'success',
                message: 'Please wait...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_4_4_modal .modal-content');
            }, 2000);
        });

        $('#m_blockui_4_5').click(function() {
            mApp.block('#m_blockui_4_5_modal .modal-content', {
                overlayColor: '#000000',
                type: 'loader',
                state: 'primary',
                message: 'Processing...'
            });

            setTimeout(function() {
                mApp.unblock('#m_blockui_4_5_modal .modal-content');
            }, 2000);
        });
    }

    return {
        // public functions
        init: function() {
            demo1();
            demo2(); 
            demo3(); 
            demo4(); 
        }
    };
}();

jQuery(document).ready(function() {    
    BlockUIDemo.init();
});