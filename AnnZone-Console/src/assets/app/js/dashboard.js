//== Class definition
var Dashboard = function() {

    //== Sparkline Chart helper function
    var _initSparklineChart = function(src, data, color, border) {
        if (src.length == 0) {
            return;
        }

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "",
                    borderColor: color,
                    borderWidth: border,

                    pointHoverRadius: 4,
                    pointHoverBorderWidth: 12,
                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),
                    fill: false,
                    data: data,
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    enabled: false,
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false,
                    labels: {
                        usePointStyle: false
                    }
                },
                responsive: true,
                maintainAspectRatio: true,
                hover: {
                    mode: 'index'
                },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },

                elements: {
                    point: {
                        radius: 4,
                        borderWidth: 12
                    },
                },

                layout: {
                    padding: {
                        left: 0,
                        right: 10,
                        top: 5,
                        bottom: 0
                    }
                }
            }
        };

        return new Chart(src, config);
    }

    //== Daily Sales chart.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var dailySales = function() {
        var chartContainer = $('#m_chart_daily_sales');

        if (chartContainer.length == 0) {
            return;
        }

        var chartData = {
            labels: ["Label 1", "Label 2", "Label 3", "Label 4", "Label 5", "Label 6", "Label 7", "Label 8", "Label 9", "Label 10", "Label 11", "Label 12", "Label 13", "Label 14", "Label 15", "Label 16"],
            datasets: [{
                //label: 'Dataset 1',
                backgroundColor: mUtil.getColor('success'),
                data: [
                    15, 20, 25, 30, 25, 20, 15, 20, 25, 30, 25, 20, 15, 10, 15, 20
                ]
            }, {
                //label: 'Dataset 2',
                backgroundColor: '#f3f3fb',
                data: [
                    15, 20, 25, 30, 25, 20, 15, 20, 25, 30, 25, 20, 15, 10, 15, 20
                ]
            }]
        };

        var chart = new Chart(chartContainer, {
            type: 'bar',
            data: chartData,
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                barRadius: 4,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        stacked: true
                    }],
                    yAxes: [{
                        display: false,
                        stacked: true,
                        gridLines: false
                    }]
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0
                    }
                }
            }
        });
    }

    //== Profit Share Chart.
    //** Based on Chartist plugin - https://gionkunz.github.io/chartist-js/index.html
    var profitShare = function() {
        if ($('#m_chart_profit_share').length == 0) {
            return;
        }

        var chart = new Chartist.Pie('#m_chart_profit_share', {
            series: [{
                    value: 32,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('brand')
                    }
                },
                {
                    value: 32,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('accent')
                    }
                },
                {
                    value: 36,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('warning')
                    }
                }
            ],
            labels: [1, 2, 3]
        }, {
            donut: true,
            donutWidth: 17,
            showLabel: false
        });

        chart.on('draw', function(data) {
            if (data.type === 'slice') {
                // Get the total path length in order to use for dash array animation
                var pathLength = data.element._node.getTotalLength();

                // Set a dasharray that matches the path length as prerequisite to animate dashoffset
                data.element.attr({
                    'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
                });

                // Create animation definition while also assigning an ID to the animation for later sync usage
                var animationDefinition = {
                    'stroke-dashoffset': {
                        id: 'anim' + data.index,
                        dur: 1000,
                        from: -pathLength + 'px',
                        to: '0px',
                        easing: Chartist.Svg.Easing.easeOutQuint,
                        // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
                        fill: 'freeze',
                        'stroke': data.meta.color
                    }
                };

                // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
                if (data.index !== 0) {
                    animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
                }

                // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us

                data.element.attr({
                    'stroke-dashoffset': -pathLength + 'px',
                    'stroke': data.meta.color
                });

                // We can't use guided mode as the animations need to rely on setting begin manually
                // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
                data.element.animate(animationDefinition, false);
            }
        });

        // For the sake of the example we update the chart every time it's created with a delay of 8 seconds
        chart.on('created', function() {
            if (window.__anim21278907124) {
                clearTimeout(window.__anim21278907124);
                window.__anim21278907124 = null;
            }
            window.__anim21278907124 = setTimeout(chart.update.bind(chart), 15000);
        });
    }

    //== Sales Stats.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var salesStats = function() {
        if ($('#m_chart_sales_stats').length == 0) {
            return;
        }

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December",
                    "January", "February", "March", "April"
                ],
                datasets: [{
                    label: "Sales Stats",
                    borderColor: mUtil.getColor('brand'),
                    borderWidth: 2,
                    pointBackgroundColor: mUtil.getColor('brand'),

                    backgroundColor: mUtil.getColor('accent'),

                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color(mUtil.getColor('danger')).alpha(0.2).rgbString(),
                    data: [
                        10, 20, 16,
                        18, 12, 40,
                        35, 30, 33,
                        34, 45, 40,
                        60, 55, 70,
                        65, 75, 62
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false,
                    labels: {
                        usePointStyle: false
                    }
                },
                responsive: true,
                maintainAspectRatio: false,
                hover: {
                    mode: 'index'
                },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        }
                    }]
                },

                elements: {
                    point: {
                        radius: 3,
                        borderWidth: 0,

                        hoverRadius: 8,
                        hoverBorderWidth: 2
                    }
                }
            }
        };

        var chart = new Chart($('#m_chart_sales_stats'), config);
    }

    //== Sales By mUtillication Stats.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var salesByApps = function() {
        // Init chart instances
        _initSparklineChart($('#m_chart_sales_by_apps_1_1'), [10, 20, -5, 8, -20, -2, -4, 15, 5, 8], mUtil.getColor('accent'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_1_2'), [2, 16, 0, 12, 22, 5, -10, 5, 15, 2], mUtil.getColor('danger'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_1_3'), [15, 5, -10, 5, 16, 22, 6, -6, -12, 5], mUtil.getColor('success'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_1_4'), [8, 18, -12, 12, 22, -2, -14, 16, 18, 2], mUtil.getColor('warning'), 2);

        _initSparklineChart($('#m_chart_sales_by_apps_2_1'), [10, 20, -5, 8, -20, -2, -4, 15, 5, 8], mUtil.getColor('danger'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_2_2'), [2, 16, 0, 12, 22, 5, -10, 5, 15, 2], mUtil.getColor('metal'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_2_3'), [15, 5, -10, 5, 16, 22, 6, -6, -12, 5], mUtil.getColor('brand'), 2);
        _initSparklineChart($('#m_chart_sales_by_apps_2_4'), [8, 18, -12, 12, 22, -2, -14, 16, 18, 2], mUtil.getColor('info'), 2);
    }

    //== Latest Updates.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var latestUpdates = function() {
        if ($('#m_chart_latest_updates').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_latest_updates").getContext("2d");

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "Sales Stats",
                    backgroundColor: mUtil.getColor('danger'), // Put the gradient here as a fill color
                    borderColor: mUtil.getColor('danger'),
                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('accent'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),

                    //fill: 'start',
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                hover: {
                    mode: 'index'
                },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Trends Stats.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var trendsStats = function() {
        if ($('#m_chart_trends_stats').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_trends_stats").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#00c5dc').alpha(0.7).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#f2feff').alpha(0).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: [
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April"
                ],
                datasets: [{
                    label: "Sales Stats",
                    backgroundColor: gradient, // Put the gradient here as a fill color
                    borderColor: '#0dc8de',

                    pointBackgroundColor: Chart.helpers.color('#ffffff').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#ffffff').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.2).rgbString(),

                    //fill: 'start',
                    data: [
                        20, 10, 18, 15, 26, 18, 15, 22, 16, 12,
                        12, 13, 10, 18, 14, 24, 16, 12, 19, 21,
                        16, 14, 21, 21, 13, 15, 22, 24, 21, 11,
                        14, 19, 21, 17
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                hover: {
                    mode: 'index'
                },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.19
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 5,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Trends Stats 2.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var trendsStats2 = function() {
        if ($('#m_chart_trends_stats_2').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_trends_stats_2").getContext("2d");

        var config = {
            type: 'line',
            data: {
                labels: [
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April", "May", "June", "July", "August", "September", "October",
                    "January", "February", "March", "April"
                ],
                datasets: [{
                    label: "Sales Stats",
                    backgroundColor: '#d2f5f9', // Put the gradient here as a fill color
                    borderColor: mUtil.getColor('brand'),

                    pointBackgroundColor: Chart.helpers.color('#ffffff').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#ffffff').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.2).rgbString(),

                    //fill: 'start',
                    data: [
                        20, 10, 18, 15, 32, 18, 15, 22, 8, 6,
                        12, 13, 10, 18, 14, 24, 16, 12, 19, 21,
                        16, 14, 24, 21, 13, 15, 27, 29, 21, 11,
                        14, 19, 21, 17
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    intersect: false,
                    mode: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                hover: {
                    mode: 'index'
                },
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.19
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 5,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Trends Stats.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var latestTrendsMap = function() {
        if ($('#m_chart_latest_trends_map').length == 0) {
            return;
        }

        try {
            var map = new GMaps({
                div: '#m_chart_latest_trends_map',
                lat: -12.043333,
                lng: -77.028333
            });
        } catch (e) {
            console.log(e);
        }
    }

    //== Revenue Change.
    //** Based on Morris plugin - http://morrisjs.github.io/morris.js/
    var revenueChange = function() {
        if ($('#m_chart_revenue_change').length == 0) {
            return;
        }

        Morris.Donut({
            element: 'm_chart_revenue_change',
            data: [{
                    label: "New York",
                    value: 10
                },
                {
                    label: "London",
                    value: 7
                },
                {
                    label: "Paris",
                    value: 20
                }
            ],
            colors: [
                mUtil.getColor('accent'),
                mUtil.getColor('danger'),
                mUtil.getColor('brand')
            ],
        });
    }

    //== Support Tickets Chart.
    //** Based on Morris plugin - http://morrisjs.github.io/morris.js/
    var supportTickets = function() {
        if ($('#m_chart_support_tickets').length == 0) {
            return;
        }

        Morris.Donut({
            element: 'm_chart_support_tickets',
            data: [{
                    label: "Margins",
                    value: 20
                },
                {
                    label: "Profit",
                    value: 70
                },
                {
                    label: "Lost",
                    value: 10
                }
            ],
            labelColor: '#a7a7c2',
            colors: [
                mUtil.getColor('accent'),
                mUtil.getColor('brand'),
                mUtil.getColor('danger')
            ]
            //formatter: function (x) { return x + "%"}
        });
    }

    //== Support Tickets Chart.
    //** Based on Morris plugin - http://morrisjs.github.io/morris.js/
    var supportTickets2 = function() {
        if ($('#m_chart_support_tickets2').length == 0) {
            return;
        }

        var chart = new Chartist.Pie('#m_chart_support_tickets2', {
            series: [{
                    value: 32,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('brand')
                    }
                },
                {
                    value: 32,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('accent')
                    }
                },
                {
                    value: 36,
                    className: 'custom',
                    meta: {
                        color: mUtil.getColor('warning')
                    }
                }
            ],
            labels: [1, 2, 3]
        }, {
            donut: true,
            donutWidth: 17,
            showLabel: false
        });

        chart.on('draw', function(data) {
            if (data.type === 'slice') {
                // Get the total path length in order to use for dash array animation
                var pathLength = data.element._node.getTotalLength();

                // Set a dasharray that matches the path length as prerequisite to animate dashoffset
                data.element.attr({
                    'stroke-dasharray': pathLength + 'px ' + pathLength + 'px'
                });

                // Create animation definition while also assigning an ID to the animation for later sync usage
                var animationDefinition = {
                    'stroke-dashoffset': {
                        id: 'anim' + data.index,
                        dur: 1000,
                        from: -pathLength + 'px',
                        to: '0px',
                        easing: Chartist.Svg.Easing.easeOutQuint,
                        // We need to use `fill: 'freeze'` otherwise our animation will fall back to initial (not visible)
                        fill: 'freeze',
                        'stroke': data.meta.color
                    }
                };

                // If this was not the first slice, we need to time the animation so that it uses the end sync event of the previous animation
                if (data.index !== 0) {
                    animationDefinition['stroke-dashoffset'].begin = 'anim' + (data.index - 1) + '.end';
                }

                // We need to set an initial value before the animation starts as we are not in guided mode which would do that for us

                data.element.attr({
                    'stroke-dashoffset': -pathLength + 'px',
                    'stroke': data.meta.color
                });

                // We can't use guided mode as the animations need to rely on setting begin manually
                // See http://gionkunz.github.io/chartist-js/api-documentation.html#chartistsvg-function-animate
                data.element.animate(animationDefinition, false);
            }
        });
    }

    //== Activities Charts.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var activitiesChart = function() {
        if ($('#m_chart_activities').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_activities").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#e14c86').alpha(1).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#e14c86').alpha(0.3).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "Sales Stats",
                    backgroundColor: gradient,
                    borderColor: '#e13a58',

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('light'),
                    pointHoverBorderColor: Chart.helpers.color('#ffffff').alpha(0.1).rgbString(),

                    //fill: 'start',
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Bandwidth Charts 1.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var bandwidthChart1 = function() {
        if ($('#m_chart_bandwidth1').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_bandwidth1").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#d1f1ec').alpha(1).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#d1f1ec').alpha(0.3).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "Bandwidth Stats",
                    backgroundColor: gradient,
                    borderColor: mUtil.getColor('success'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),

                    //fill: 'start',
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Bandwidth Charts 2.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var bandwidthChart2 = function() {
        if ($('#m_chart_bandwidth2').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_bandwidth2").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#ffefce').alpha(1).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#ffefce').alpha(0.3).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "Bandwidth Stats",
                    backgroundColor: gradient,
                    borderColor: mUtil.getColor('warning'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),

                    //fill: 'start',
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Bandwidth Charts 2.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var adWordsStat = function() {
        if ($('#m_chart_adwords_stats').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_adwords_stats").getContext("2d");

        var gradient = ctx.createLinearGradient(0, 0, 0, 240);
        gradient.addColorStop(0, Chart.helpers.color('#ffefce').alpha(1).rgbString());
        gradient.addColorStop(1, Chart.helpers.color('#ffefce').alpha(0.3).rgbString());

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "AdWord Clicks",
                    backgroundColor: mUtil.getColor('brand'),
                    borderColor: mUtil.getColor('brand'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),
                    data: [
                        12, 16, 9, 18, 13, 12, 18, 12, 15, 17
                    ]
                }, {
                    label: "AdWords Views",

                    backgroundColor: mUtil.getColor('accent'),
                    borderColor: mUtil.getColor('accent'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        stacked: true,
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Bandwidth Charts 2.
    //** Based on Chartjs plugin - http://www.chartjs.org/
    var financeSummary = function() {
        if ($('#m_chart_finance_summary').length == 0) {
            return;
        }

        var ctx = document.getElementById("m_chart_finance_summary").getContext("2d");

        var config = {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"],
                datasets: [{
                    label: "AdWords Views",

                    backgroundColor: mUtil.getColor('accent'),
                    borderColor: mUtil.getColor('accent'),

                    pointBackgroundColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointBorderColor: Chart.helpers.color('#000000').alpha(0).rgbString(),
                    pointHoverBackgroundColor: mUtil.getColor('danger'),
                    pointHoverBorderColor: Chart.helpers.color('#000000').alpha(0.1).rgbString(),
                    data: [
                        10, 14, 12, 16, 9, 11, 13, 9, 13, 15
                    ]
                }]
            },
            options: {
                title: {
                    display: false,
                },
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                    position: 'nearest',
                    xPadding: 10,
                    yPadding: 10,
                    caretPadding: 10
                },
                legend: {
                    display: false
                },
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Month'
                        }
                    }],
                    yAxes: [{
                        display: false,
                        gridLines: false,
                        scaleLabel: {
                            display: true,
                            labelString: 'Value'
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                },
                elements: {
                    line: {
                        tension: 0.0000001
                    },
                    point: {
                        radius: 4,
                        borderWidth: 12
                    }
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 0
                    }
                }
            }
        };

        var chart = new Chart(ctx, config);
    }

    //== Quick Stat Charts
    var quickStats = function() {
        _initSparklineChart($('#m_chart_quick_stats_1'), [10, 14, 18, 11, 9, 12, 14, 17, 18, 14], mUtil.getColor('brand'), 3);
        _initSparklineChart($('#m_chart_quick_stats_2'), [11, 12, 18, 13, 11, 12, 15, 13, 19, 15], mUtil.getColor('danger'), 3);
        _initSparklineChart($('#m_chart_quick_stats_3'), [12, 12, 18, 11, 15, 12, 13, 16, 11, 18], mUtil.getColor('success'), 3);
        _initSparklineChart($('#m_chart_quick_stats_4'), [11, 9, 13, 18, 13, 15, 14, 13, 18, 15], mUtil.getColor('accent'), 3);
    }

    var daterangepickerInit = function() {
        if ($('#m_dashboard_daterangepicker').length == 0) {
            return;
        }

        var picker = $('#m_dashboard_daterangepicker');
        var start = moment();
        var end = moment();

        function cb(start, end, label) {
            var title = '';
            var range = '';

            if ((end - start) < 100) {
                title = 'Today:';
                range = start.format('MMM D');
            } else if (label == 'Yesterday') {
                title = 'Yesterday:';
                range = start.format('MMM D');
            } else {
                range = start.format('MMM D') + ' - ' + end.format('MMM D');
            }

            picker.find('.m-subheader__daterange-date').html(range);
            picker.find('.m-subheader__daterange-title').html(title);
        }

        picker.daterangepicker({
            startDate: start,
            endDate: end,
            opens: 'left',
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            }
        }, cb);

        cb(start, end, '');
    }

    var datatableLatestOrders = function() {
        if ($('#m_datatable_latest_orders').length === 0) {
            return;
        }

        var datatable = $('.m_datatable').mDatatable({
            data: {
                type: 'remote',
                source: {
                    read: {
                        url: 'https://keenthemes.com/metronic/preview/inc/api/datatables/demos/default.php'
                    }
                },
                pageSize: 20,
                saveState: {
                    cookie: true,
                    webstorage: true
                },
                serverPaging: true,
                serverFiltering: true,
                serverSorting: true
            },

            layout: {
                theme: 'default',
                class: '',
                scroll: true,
                height: 380,
                footer: false
            },

            sortable: true,

            filterable: false,

            pagination: true,

            columns: [{
                field: "RecordID",
                title: "#",
                sortable: false,
                width: 40,
                selector: {
                    class: 'm-checkbox--solid m-checkbox--brand'
                },
                textAlign: 'center'
            }, {
                field: "OrderID",
                title: "Order ID",
                sortable: 'asc',
                filterable: false,
                width: 150,
                template: '{{OrderID}} - {{ShipCountry}}'
            }, {
                field: "ShipName",
                title: "Ship Name",
                width: 150,
                responsive: {
                    visible: 'lg'
                }
            }, {
                field: "ShipDate",
                title: "Ship Date"
            }, {
                field: "Status",
                title: "Status",
                width: 100,
                // callback function support for column rendering
                template: function(row) {
                    var status = {
                        1: {
                            'title': 'Pending',
                            'class': 'm-badge--brand'
                        },
                        2: {
                            'title': 'Delivered',
                            'class': ' m-badge--metal'
                        },
                        3: {
                            'title': 'Canceled',
                            'class': ' m-badge--primary'
                        },
                        4: {
                            'title': 'Success',
                            'class': ' m-badge--success'
                        },
                        5: {
                            'title': 'Info',
                            'class': ' m-badge--info'
                        },
                        6: {
                            'title': 'Danger',
                            'class': ' m-badge--danger'
                        },
                        7: {
                            'title': 'Warning',
                            'class': ' m-badge--warning'
                        }
                    };
                    return '<span class="m-badge ' + status[row.Status].class + ' m-badge--wide">' + status[row.Status].title + '</span>';
                }
            }, {
                field: "Type",
                title: "Type",
                width: 100,
                // callback function support for column rendering
                template: function(row) {
                    var status = {
                        1: {
                            'title': 'Online',
                            'state': 'danger'
                        },
                        2: {
                            'title': 'Retail',
                            'state': 'primary'
                        },
                        3: {
                            'title': 'Direct',
                            'state': 'accent'
                        }
                    };
                    return '<span class="m-badge m-badge--' + status[row.Type].state + ' m-badge--dot"></span>&nbsp;<span class="m--font-bold m--font-' + status[row.Type].state + '">' + status[row.Type].title + '</span>';
                }
            }, {
                field: "Actions",
                width: 110,
                title: "Actions",
                sortable: false,
                overflow: 'visible',
                template: function(row) {
                    var dropup = (row.getDatatable().getPageSize() - row.getIndex()) <= 4 ? 'dropup' : '';

                    return '\
                        <div class="dropdown ' + dropup + '">\
                            <a href="#" class="btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" data-toggle="dropdown">\
                                <i class="la la-ellipsis-h"></i>\
                            </a>\
                            <div class="dropdown-menu dropdown-menu-right">\
                                <a class="dropdown-item" href="#"><i class="la la-edit"></i> Edit Details</a>\
                                <a class="dropdown-item" href="#"><i class="la la-leaf"></i> Update Status</a>\
                                <a class="dropdown-item" href="#"><i class="la la-print"></i> Generate Report</a>\
                            </div>\
                        </div>\
                        <a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="Edit details">\
                            <i class="la la-edit"></i>\
                        </a>\
                        <a href="#" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill" title="Delete">\
                            <i class="la la-trash"></i>\
                        </a>\
                    ';
                }
            }]
        });
    }

    var calendarInit = function() {
        if ($('#m_calendar').length === 0) {
            return;
        }
        
        var todayDate = moment().startOf('day');
        var YM = todayDate.format('YYYY-MM');
        var YESTERDAY = todayDate.clone().subtract(1, 'day').format('YYYY-MM-DD');
        var TODAY = todayDate.format('YYYY-MM-DD');
        var TOMORROW = todayDate.clone().add(1, 'day').format('YYYY-MM-DD');

        $('#m_calendar').fullCalendar({
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay,listWeek'
            },
            editable: true,
            eventLimit: true, // allow "more" link when too many events
            navLinks: true,
            defaultDate: moment('2017-09-15'),
            events: [
                {
                    title: 'Meeting',
                    start: moment('2017-08-28'),
                    description: 'Lorem ipsum dolor sit incid idunt ut',
                    className: "m-fc-event--light m-fc-event--solid-warning"
                },
                {
                    title: 'Conference',                    
                    description: 'Lorem ipsum dolor incid idunt ut labore',
                    start: moment('2017-08-29T13:30:00'),
                    end: moment('2017-08-29T17:30:00'),
                    className: "m-fc-event--accent"
                },
                {
                    title: 'Dinner',
                    start: moment('2017-08-30'),
                    description: 'Lorem ipsum dolor sit tempor incid',
                    className: "m-fc-event--light  m-fc-event--solid-danger"
                },
                {
                    title: 'All Day Event',
                    start: moment('2017-09-01'),
                    description: 'Lorem ipsum dolor sit incid idunt ut',
                    className: "m-fc-event--danger m-fc-event--solid-focus"
                },
                {
                    title: 'Reporting',                    
                    description: 'Lorem ipsum dolor incid idunt ut labore',
                    start: moment('2017-09-03T13:30:00'),
                    end: moment('2017-09-04T17:30:00'),
                    className: "m-fc-event--accent"
                },
                {
                    title: 'Company Trip',
                    start: moment('2017-09-05'),
                    end: moment('2017-09-07'),
                    description: 'Lorem ipsum dolor sit tempor incid',
                    className: "m-fc-event--primary"
                },
                {
                    title: 'ICT Expo 2017 - Product Release',
                    start: moment('2017-09-09'),
                    description: 'Lorem ipsum dolor sit tempor inci',
                    className: "m-fc-event--light m-fc-event--solid-primary"
                },
                {
                    title: 'Dinner',
                    start: moment('2017-09-12'),
                    description: 'Lorem ipsum dolor sit amet, conse ctetur'
                },
                {
                    id: 999,
                    title: 'Repeating Event',
                    start: moment('2017-09-15T16:00:00'),
                    description: 'Lorem ipsum dolor sit ncididunt ut labore',
                    className: "m-fc-event--danger"
                },
                {
                    id: 1000,
                    title: 'Repeating Event',
                    description: 'Lorem ipsum dolor sit amet, labore',
                    start: moment('2017-09-18T19:00:00'),
                },
                {
                    title: 'Conference',
                    start: moment('2017-09-20T13:00:00'),
                    end: moment('2017-09-21T19:00:00'),
                    description: 'Lorem ipsum dolor eius mod tempor labore',
                    className: "m-fc-event--accent"
                },
                {
                    title: 'Meeting',
                    start: moment('2017-09-11'),
                    description: 'Lorem ipsum dolor eiu idunt ut labore'
                },
                {
                    title: 'Lunch',
                    start: moment('2017-09-18'),
                    className: "m-fc-event--info m-fc-event--solid-accent",
                    description: 'Lorem ipsum dolor sit amet, ut labore'
                },
                {
                    title: 'Meeting',
                    start: moment('2017-09-24'),
                    className: "m-fc-event--warning",
                    description: 'Lorem ipsum conse ctetur adipi scing'
                },
                {
                    title: 'Happy Hour',
                    start: moment('2017-09-24'),
                    className: "m-fc-event--light m-fc-event--solid-focus",
                    description: 'Lorem ipsum dolor sit amet, conse ctetur'
                },
                {
                    title: 'Dinner',
                    start: moment('2017-09-24'),
                    className: "m-fc-event--solid-focus m-fc-event--light",
                    description: 'Lorem ipsum dolor sit ctetur adipi scing'
                },
                {
                    title: 'Birthday Party',
                    start: moment('2017-09-24'),
                    className: "m-fc-event--primary",
                    description: 'Lorem ipsum dolor sit amet, scing'
                },
                {
                    title: 'Company Event',
                    start: moment('2017-09-24'),
                    className: "m-fc-event--danger",
                    description: 'Lorem ipsum dolor sit amet, scing'
                },
                {
                    title: 'Click for Google',
                    url: 'http://google.com/',
                    start: moment('2017-09-26'),
                    className: "m-fc-event--solid-info m-fc-event--light",
                    description: 'Lorem ipsum dolor sit amet, labore'
                }
            ],

            eventRender: function(event, element) {
                if (element.hasClass('fc-day-grid-event')) {
                    element.data('content', event.description);
                    element.data('placement', 'top');
                    mApp.initPopover(element);
                } else if (element.hasClass('fc-time-grid-event')) {
                    element.find('.fc-title').append('<div class="fc-description">' + event.description + '</div>');
                } else if (element.find('.fc-list-item-title').lenght !== 0) {
                    element.find('.fc-list-item-title').append('<div class="fc-description">' + event.description + '</div>');
                }
            }
        });
    }

    return {
        //== Init demos
        init: function() {
            // init charts
            dailySales();
            profitShare();
            salesStats();
            salesByApps();
            latestUpdates();
            trendsStats();
            trendsStats2();
            latestTrendsMap();
            revenueChange();
            supportTickets();
            supportTickets2();
            activitiesChart();
            bandwidthChart1();
            bandwidthChart2();
            adWordsStat();
            financeSummary();
            quickStats();

            // init daterangepicker
            daterangepickerInit();

            // datatables
            datatableLatestOrders();

            // calendar
            calendarInit();
        }
    };
}();

//== Class initialization on page load
jQuery(document).ready(function() {
    Dashboard.init();
});