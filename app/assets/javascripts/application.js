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
// about supported directives
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require highcharts
//= require chartkick
//= require bootstrap
//= require_tree .

$(document).ready(function () {
  
  var txtClock = $('#clock');

  
  function updateTime(){
    return false;
    var time = new Date();
    var hours = time.getHours();
    var minutes = time.getMinutes();
    var seconds = time.getSeconds();

    txtClock.html(hours + ' : ' + minutes + ' : ' + seconds);
  }

  // var clock = setInterval(updateTime, 1000);
  // updateTime();
  // clearInterval(clock);
  // Add form-control class to select elements
  // var $selects = $('select');
  // $selects.removeClass('form-control').addClass('form-control');

  $("input#hide_password").click(function () {

    $this = $(this);
    // Check the checkbox state
    if ($this.is(':checked')) {
      $this.attr('checked', 'false');
      // Changing type attribute
      $("#encryption_password").attr("type", "text");

      // Change the Text
      $("#toggleText").text("Hide");
    } else {
      $this.attr('checked', 'true');

      // Changing type attribute
      $("#encryption_password").attr("type", "password");

      // Change the Text
      $("#toggleText").text("Show");
    }

  });
});

