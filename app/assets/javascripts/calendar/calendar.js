//= require './calendar'

$(function () {

    var transEndEventNames = {
            'WebkitTransition': 'webkitTransitionEnd',
            'MozTransition': 'transitionend',
            'OTransition': 'oTransitionEnd',
            'msTransition': 'MSTransitionEnd',
            'transition': 'transitionend'
        },
        transEndEventName = transEndEventNames[Modernizr.prefixed('transition')],
        $wrapper = $('#custom-inner'),
        $calendar = $('#calendar'),
        cal = $calendar.calendario({
            onDayClick: function ($el, $contentEl, dateProperties) {
                $contentEl.length > 0 && showEvents($contentEl, dateProperties)
            },
            // caldata: codropsEvents,
            displayWeekAbbr: true
        }),
        $month = $('#custom-month').html(cal.getMonthName()),
        $year = $('#custom-year').html(cal.getYear());

    setData();

    $('#custom-next').on('click', function () {
        cal.gotoNextMonth(updateMonthYear);
        setData();
    });
    $('#custom-prev').on('click', function () {
        cal.gotoPreviousMonth(updateMonthYear);
        setData();
    });

    function updateMonthYear() {
        $month.html(cal.getMonthName());
        $year.html(cal.getYear());
    }

    function setData() {
        $.get('/events.json' +
            '?year=' + cal.getYear() +
            '&month=' + cal.getMonth())
            .done(function (events) {
                var codropsEvents = {};

                events.forEach(function (event) {
                    var key = moment(event.start_date).format('MM-DD-Y');
                    var eventTemplate = '<a>' + event.title + '</a>';

                    codropsEvents[key]  = !!codropsEvents[key]
                        ? codropsEvents[key] + eventTemplate
                        : eventTemplate;
                });

                cal.setData(codropsEvents);
            });
    }

    // just an example..
    function showEvents($contentEl, dateProperties) {
        hideEvents();

        var $events = $('<div id="custom-content-reveal" class="custom-content-reveal"><h4>Events for ' + dateProperties.monthname + ' ' + dateProperties.day + ', ' + dateProperties.year + '</h4></div>'),
            $close = $('<span class="custom-content-close"></span>').on('click', hideEvents);

        $events.append($contentEl.html(), $close).insertAfter($wrapper);

        setTimeout(function () {
            $events.css('top', '0%');
        }, 25);

    }

    function hideEvents() {
        var $events = $('#custom-content-reveal');

        if ($events.length > 0) {
            $events.css('top', '100%');
            Modernizr.csstransitions
                ? $events.on(transEndEventName, function () {
                    $(this).remove();
                })
                : $events.remove();
        }
    }
});