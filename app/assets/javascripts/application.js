// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require Chart.bundle
//= require highcharts
//= require chartkick
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require cocoon
//= require bootstrap-select
//= require_tree .

$(document).on('turbolinks:load', function() {
  $('.selectpicker').selectpicker();
  // $ (".m").css ("background-color", m_color($('.my').data("background-color")));
  // n = m_color($('.my').data("background-color"));
  $('.my').each(function (index, element) {
    $(element).css("background-color", m_color($(element).attr('data-background-color')));
    $(element).css("color", "white");
  });
  // $(".m").style.backgroundColor = n ;
  // $('.contact').click(function(){
  //   alert('В.Ю Радыгин тел. 7064, почта VYRadigin@mephi.ru\nД.Ю. Куприянов тел. 7067, почта DYCupriyanov@mephi.ru');
  // });

});


function m_color(color) {
  if ((color >= 0.0) & (color < 50.0)){
    var n = (convert(color,0,50,255,0));
    return ("RGB(0,"+ n +",0)");
  } else if (color < 0.0){
    var n = (convert(color,-100,0,255,0));
    return ("RGB("+ n +",0,0)");
  } else {
    var n = (convert(color,50,100,0,255));
    return ("RGB(0,0," + n +")");
  }
}

function convert(value,From1,From2,To1,To2){
  return Math.round((value-From1)/(From2-From1)*(To2-To1)+To1);
}
