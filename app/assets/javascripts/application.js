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

//= require rails-ujs
//= require jquery
//= require turbolinks
//= require materialize-sprockets
//= require_tree .
$(document).ready(function() {
  console.log("document is ready");
  $(".dropdown-button").dropdown({
    hover: true,
    belowOrigin: true
  });
  $('#dropdown1 li a').click(function(event) {
    var fromStationID = parseInt($(event.target).data("from-station-id"));
    var toStationID = parseInt($(event.target).data("to-station-id"));
    $('#from')[0].selectedIndex = fromStationID - 1
    $('#to')[0].selectedIndex = toStationID - 1
    $('select').material_select();
  })
});
