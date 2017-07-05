// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.themepunch.revolution.min
//= require jquery.themepunch.tools.min
//= require jquery.mCustomScrollbar.concat.min
//= require jquery.readyselector
//= require calendario/modernizr.custom.63321
//= require calendario/jquery.calendario
//= require fancybox/jquery.fancybox
//= require fancybox/jquery.fancybox.pack
//= require fancybox/jquery.fancybox-buttons
//= require fancybox/jquery.fancybox-media
//= require fancybox/jquery.fancybox-thumbs
//= require slick.min
//= require moment
//= require configuration
//= require extensions/revolution.extension.actions.min
//= require extensions/revolution.extension.carousel.min
//= require extensions/revolution.extension.kenburn.min
//= require extensions/revolution.extension.layeranimation.min
//= require extensions/revolution.extension.migration.min
//= require extensions/revolution.extension.navigation.min
//= require extensions/revolution.extension.parallax.min
//= require extensions/revolution.extension.slideanims.min
//= require extensions/revolution.extension.video.min
// require turbolinks
//= require ckeditor/init
//= require just_datetime_picker/nested_form_workaround
//= require_tree .

$(document).ready( function () {

  /*revolution slider for announcements index page*/

  var tpj=jQuery;
  var revapi34;
  if(tpj("#rev_slider_34_1").revolution == undefined){
    revslider_showDoubleJqueryError("#rev_slider_34_1");
  }else{
    revapi34 = tpj("#rev_slider_34_1").show().revolution({
      sliderType:"standard",
      jsFileLocation:"../../revolution/js/",
      sliderLayout:"auto",
      dottedOverlay:"none",
      delay:10000,
      navigation: {
        keyboardNavigation:"on",
        keyboard_direction: "horizontal",
        mouseScrollNavigation:"off",
        onHoverStop:"on",
        touch:{
          touchenabled:"on",
          swipe_threshold: 75,
          swipe_min_touches: 1,
          swipe_direction: "horizontal",
          drag_block_vertical: false
        }
        ,
        arrows: {
          style:"gyges",
          enable:true,
          hide_onmobile:false,
          hide_over:778,
          hide_onleave:false,
          tmp:'',
          left: {
            h_align:"right",
            v_align:"bottom",
            h_offset:40,
            v_offset:0
          },
          right: {
            h_align:"right",
            v_align:"bottom",
            h_offset:0,
            v_offset:0
          }
        }
        ,
        tabs: {
          style:"erinyen",
          enable:true,
          width:250,
          height:100,
          min_width:250,
          wrapper_padding:0,
          wrapper_color:"transparent",
          wrapper_opacity:"0",
          tmp:'<div class="tp-tab-title">{{title}}</div><div class="tp-tab-desc">{{description}}</div>',
          visibleAmount: 3,
          hide_onmobile: true,
          hide_under:778,
          hide_onleave:false,
          hide_delay:200,
          direction:"vertical",
          span:false,
          position:"inner",
          space:10,
          h_align:"right",
          v_align:"center",
          h_offset:30,
          v_offset:0
        }
      },
      viewPort: {
        enable:true,
        outof:"pause",
        visible_area:"80%"
      },
      responsiveLevels:[1240,1024,778,480],
      gridwidth:[1240,1024,778,480],
      gridheight:[500,450,400,350],
      lazyType:"none",
      parallax: {
        type:"scroll",
        origo:"enterpoint",
        speed:400,
        levels:[5,10,15,20,25,30,35,40,45,50]
      },
      shadow:0,
      spinner:"off",
      stopLoop:"off",
      stopAfterLoops:-1,
      stopAtSlide:-1,
      shuffle:"off",
      autoHeight:"off",
      hideThumbsOnMobile:"off",
      hideSliderAtLimit:0,
      hideCaptionAtLimit:0,
      hideAllCaptionAtLilmit:0,
      debugMode:false,
      fallbacks: {
        simplifyAll:"off",
        nextSlideOnWindowFocus:"off",
        disableFocusListener:false
      }
    });
  }

  /*weather icons*/

  var element = $('.icon').first().text();
  var caseElement = $('.icon').first();
  switch (element) {

    case '01d':
      caseElement.addClass('wi wi-day-sunny').text('').html('&nbsp;');
    break;

    case '01n':
      caseElement.addClass('wi wi-night-clear').text('').html('&nbsp;');
    break;

    case '02d':
      caseElement.addClass('wi wi-day-cloudy').text('').html('&nbsp;');
    break;

    case '02n':
      caseElement.addClass('wi wi-night-alt-cloudy').text('').html('&nbsp;');
    break;

    case '03d':
      caseElement.addClass('wi wi-cloud').text('').html('&nbsp;');
    break;

    case '03n':
      caseElement.addClass('wi wi-cloud').text('').html('&nbsp;');
    break;

    case '04d':
      caseElement.addClass('wi wi-cloudy').text('').html('&nbsp;');
    break;

    case '04n':
      caseElement.addClass('wi wi-cloudy').text('').html('&nbsp;');
    break;

    case '09d':
      caseElement.addClass('wi wi-day-showers').text('').html('&nbsp;');
    break;

    case '09n':
      caseElement.addClass('wi wi-night-alt-showers').text('').html('&nbsp;');
    break;

    case '10d':
      caseElement.addClass('wi wi-day-rain').text('').html('&nbsp;');
    break;

    case '10n':
      caseElement.addClass('wi wi-night-alt-rain').text('').html('&nbsp;');
    break;

    case '11d':
      caseElement.addClass('wi wi-day-thunderstorm').text('').html('&nbsp;');
    break;

    case '11n':
      caseElement.addClass('wi wi-night-thunderstorm').text('').html('&nbsp;');
    break;

    case '13d':
      caseElement.addClass('wi wi-day-snow').text('').html('&nbsp;');
    break;

    case '13n':
      caseElement.addClass('wi wi-night-alt-snow').text('').html('&nbsp;');
    break;

    case '50d':
      caseElement.addClass('wi wi-day-fog').text('').html('&nbsp;');
    break;

    case '50n':
      caseElement.addClass('wi wi-night-fog').text('').html('&nbsp;');
    break;
  }

  /*customizing scroll-bar*/

  (function ($) {
    $(window).on('load', function () {
      $('.col-50').mCustomScrollbar({
        theme: 'dark'
      });
    });
  })(jQuery);

  /*facebook widget*/

  (function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/uk_UA/sdk.js#xfbml=1&version=v2.8&appId=1092747934095391";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  /*slick carousel*/

  $('.carousel-slider').slick({
    dots: false,
    infinite: true,
    speed: 300,
    slidesToShow: 5,
    slidesToScroll: 5,
    responsive: [
      {
        breakpoint: 1024,
        settings: {
          slidesToShow: 5,
          slidesToScroll: 5,
          infinite: true,
          dots: false
        }
      },
      {
        breakpoint: 600,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
      // You can unslick at a given breakpoint now by adding:
      // settings: "unslick"
      // instead of a settings object
    ]
  });

  /*fancybox*/

  $('.fancybox').fancybox({
    prevEffect  : 'animate',
    nextEffect  : 'animate'
  });
});
