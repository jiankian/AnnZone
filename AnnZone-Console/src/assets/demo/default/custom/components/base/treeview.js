var Treeview = function () {

    var demo1 = function () {
        $('#m_tree_1').jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }            
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder"
                },
                "file" : {
                    "icon" : "fa fa-file"
                }
            },
            "plugins": ["types"]
        });
    }

    var demo2 = function () {
        $('#m_tree_2').jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }            
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder m--font-warning"
                },
                "file" : {
                    "icon" : "fa fa-file  m--font-warning"
                }
            },
            "plugins": ["types"]
        });

        // handle link clicks in tree nodes(support target="_blank" as well)
        $('#m_tree_2').on('select_node.jstree', function(e,data) { 
            var link = $('#' + data.selected).find('a');
            if (link.attr("href") != "#" && link.attr("href") != "javascript:;" && link.attr("href") != "") {
                if (link.attr("target") == "_blank") {
                    link.attr("href").target = "_blank";
                }
                document.location.href = link.attr("href");
                return false;
            }
        });
    }

    var demo3 = function () {
        $('#m_tree_3').jstree({
            'plugins': ["wholerow", "checkbox", "types"],
            'core': {
                "themes" : {
                    "responsive": false
                },    
                'data': [{
                        "text": "Same but with checkboxes",
                        "children": [{
                            "text": "initially selected",
                            "state": {
                                "selected": true
                            }
                        }, {
                            "text": "custom icon",
                            "icon": "fa fa-warning m--font-danger"
                        }, {
                            "text": "initially open",
                            "icon" : "fa fa-folder m--font-default",
                            "state": {
                                "opened": true
                            },
                            "children": ["Another node"]
                        }, {
                            "text": "custom icon",
                            "icon": "fa fa-warning m--font-waring"
                        }, {
                            "text": "disabled node",
                            "icon": "fa fa-check m--font-success",
                            "state": {
                                "disabled": true
                            }
                        }]
                    },
                    "And wholerow selection"
                ]
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder m--font-warning"
                },
                "file" : {
                    "icon" : "fa fa-file  m--font-warning"
                }
            },
        });
    }

    var demo4 = function() {
        $("#m_tree_4").jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }, 
                // so that create works
                "check_callback" : true,
                'data': [{
                        "text": "Parent Node",
                        "children": [{
                            "text": "Initially selected",
                            "state": {
                                "selected": true
                            }
                        }, {
                            "text": "Custom Icon",
                            "icon": "fa fa-warning m--font-danger"
                        }, {
                            "text": "Initially open",
                            "icon" : "fa fa-folder m--font-success",
                            "state": {
                                "opened": true
                            },
                            "children": [
                                {"text": "Another node", "icon" : "fa fa-file m--font-waring"}
                            ]
                        }, {
                            "text": "Another Custom Icon",
                            "icon": "fa fa-warning m--font-waring"
                        }, {
                            "text": "Disabled Node",
                            "icon": "fa fa-check m--font-success",
                            "state": {
                                "disabled": true
                            }
                        }, {
                            "text": "Sub Nodes",
                            "icon": "fa fa-folder m--font-danger",
                            "children": [
                                {"text": "Item 1", "icon" : "fa fa-file m--font-waring"},
                                {"text": "Item 2", "icon" : "fa fa-file m--font-success"},
                                {"text": "Item 3", "icon" : "fa fa-file m--font-default"},
                                {"text": "Item 4", "icon" : "fa fa-file m--font-danger"},
                                {"text": "Item 5", "icon" : "fa fa-file m--font-info"}
                            ]
                        }]
                    },
                    "Another Node"
                ]
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder m--font-brand"
                },
                "file" : {
                    "icon" : "fa fa-file  m--font-brand"
                }
            },
            "state" : { "key" : "demo2" },
            "plugins" : [ "contextmenu", "state", "types" ]
        });    
    }

    var demo5 = function() {
        $("#m_tree_5").jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }, 
                // so that create works
                "check_callback" : true,
                'data': [{
                        "text": "Parent Node",
                        "children": [{
                            "text": "Initially selected",
                            "state": {
                                "selected": true
                            }
                        }, {
                            "text": "Custom Icon",
                            "icon": "fa fa-warning m--font-danger"
                        }, {
                            "text": "Initially open",
                            "icon" : "fa fa-folder m--font-success",
                            "state": {
                                "opened": true
                            },
                            "children": [
                                {"text": "Another node", "icon" : "fa fa-file m--font-waring"}
                            ]
                        }, {
                            "text": "Another Custom Icon",
                            "icon": "fa fa-warning m--font-waring"
                        }, {
                            "text": "Disabled Node",
                            "icon": "fa fa-check m--font-success",
                            "state": {
                                "disabled": true
                            }
                        }, {
                            "text": "Sub Nodes",
                            "icon": "fa fa-folder m--font-danger",
                            "children": [
                                {"text": "Item 1", "icon" : "fa fa-file m--font-waring"},
                                {"text": "Item 2", "icon" : "fa fa-file m--font-success"},
                                {"text": "Item 3", "icon" : "fa fa-file m--font-default"},
                                {"text": "Item 4", "icon" : "fa fa-file m--font-danger"},
                                {"text": "Item 5", "icon" : "fa fa-file m--font-info"}
                            ]
                        }]
                    },
                    "Another Node"
                ]
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder m--font-success"
                },
                "file" : {
                    "icon" : "fa fa-file  m--font-success"
                }
            },
            "state" : { "key" : "demo2" },
            "plugins" : [ "dnd", "state", "types" ]
        });    
    }

    var demo6 = function() {
        $("#m_tree_6").jstree({
            "core" : {
                "themes" : {
                    "responsive": false
                }, 
                // so that create works
                "check_callback" : true,
                'data' : {
                    'url' : function (node) {
                      return 'https://keenthemes.com/metronic/preview/inc/api/jstree/ajax_data.php';
                    },
                    'data' : function (node) {
                      return { 'parent' : node.id };
                    }
                }
            },
            "types" : {
                "default" : {
                    "icon" : "fa fa-folder m--font-brand"
                },
                "file" : {
                    "icon" : "fa fa-file  m--font-brand"
                }
            },
            "state" : { "key" : "demo3" },
            "plugins" : [ "dnd", "state", "types" ]
        });
    }

    return {
        //main function to initiate the module
        init: function () {
            demo1();
            demo2();
            demo3();
            demo4();
            demo5();
            demo6();
        }
    };
}();

jQuery(document).ready(function() {    
    Treeview.init();
});