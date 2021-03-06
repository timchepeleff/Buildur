// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require private_pub
//= require chat
//= require user
//= require foundation
//= require highcharts.js
//= require chartkick
//= require chosen-jquery
//= require jquery.jTinder
//= require jquery.easing.min
//= require jquery.transform2d
//= require tinysort
//= require jquery.tinysort
//= require_tree .

$(function(){ $(document).foundation(); });

$(function() {
  return $('.chosen-select').chosen({
    max_selected_options: 5,
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '100%'
  });
});

$(document).ready(function() {
  setTimeout(function(){
    $('.notice_wrapper').fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4500);
});

jQuery(document).ready(function(){
        jQuery('.friendboxhead').on('click', function(event) {
             jQuery('.friendboxcontent').toggle('show');
        });
    });

