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
//= require jquery.themepunch.revolution.min
//= require jquery.themepunch.tools.min
//= require extensions/revolution.extension.actions.min
//= require extensions/revolution.extension.carousel.min
//= require extensions/revolution.extension.kenburn.min
//= require extensions/revolution.extension.layeranimation.min
//= require extensions/revolution.extension.migration.min
//= require extensions/revolution.extension.navigation.min
//= require extensions/revolution.extension.parallax.min
//= require extensions/revolution.extension.slideanims.min
//= require extensions/revolution.extension.video.min
//= require turbolinks
//= require ckeditor/init
//= require_tree .

$(document).ready(function () {

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
        levels:[5,10,15,20,25,30,35,40,45,50],
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
        disableFocusListener:false,
      }
    });
  }

});
