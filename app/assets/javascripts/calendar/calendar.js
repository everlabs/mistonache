$('.events.index').ready(function () {
    var transEndEventNames = {
        'WebkitTransition': 'webkitTransitionEnd',
        'MozTransition': 'transitionend',
        'OTransition': 'oTransitionEnd',
        'msTransition': 'MSTransitionEnd',
        'transition': 'transitionend'
    };
    var transEndEventName = transEndEventNames[Modernizr.prefixed('transition')];
    var $wrapper = $('#custom-inner');
    var $calendar = $('#calendar');
    var cal = $calendar.calendario({
        onDayClick: function ($el, $contentEl, dateProperties) {
            $contentEl.length > 0 && renderEvents(new Date([dateProperties.year, dateProperties.month, dateProperties.day].join('-')));
        },
        displayWeekAbbr: true,
        weekabbrs : ['нд', 'пн', 'вт', 'ср', 'чт', 'пт', 'сб'],
        months : [
            "cічень", "лютий", "березень", "квітень", "травень", "червень",
            "липень", "серпень", "вересень", "жовтень", "листопад", "грудень"
        ]
    });

    $('.place-filter > .place-name').click(function (event) {
        var placeId = $(this).data('place-id');

        $.get('/events/place/' + placeId + '.json')
            .done(function(queriedEvents) {
                $('div.events').html(getEventsTemplate(queriedEvents));

            });
    });

    var $month = $('#custom-month').html(cal.getMonthName());
    var $year = $('#custom-year').html(cal.getYear());

    var events = [];

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
            .done(function (queriedEvents) {
                var codropsEvents = {};
                events = queriedEvents;

                queriedEvents.forEach(function (event) {
                    var key = moment(event.start_date).format('MM-DD-Y');
                    var eventTemplate = '<a>' + event.title + '</a>';

                    codropsEvents[key] = !!codropsEvents[key]
                        ? codropsEvents[key] + eventTemplate
                        : eventTemplate;
                });

                cal.setData(codropsEvents);
            });
    }

    function renderEvents(date) {
        $('div.events').html(getEventsTemplate(events.filter(function (event) {
            var startDate = new Date(event.start_date);

            return  startDate.getDate() == date.getDate() &&
                    startDate.getFullYear() == date.getFullYear() &&
                    startDate.getMonth() == date.getMonth();
        })));
    }

    function getEventsTemplate(events) {

        return events.reduce(function (eventsTemplate, event) {

            return eventsTemplate + getEventTemplate(event)
        }, '');
    }

    function getEventTemplate(event) {
        return '<div class="col-xs-6 col-md-3  event">' +
            ' <a class="event-poster" data-toggle="modal" data-target="#modal-window" data-remote="true" href="events/'+ event.id +'">' +
            '<img src="' + event.image.medium.url + '"  class="img-responsive" alt="Medium biggest 30">'+ '</a>'+
            '   <h3 class="event-title">' + event.title + '</h3>' +
            '   <span class="event-inscription">' +
            '       <i class="fa fa-clock-o" aria-hidden="true"></i>&nbsp;&nbsp;' +
                moment(event.start_date).format('D MMM., H:mm') +
            '   </span>' +
            '</div>';
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