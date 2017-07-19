// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

  // $("#search-btn").append(`<%= link_to 'Search', stops_path(from: '${$("#from.val")}', to: '${#to.val()}', time: '14:44'), class: 'btn btn-lg btn-primary' %>`);
$(document).on('turbolinks:load', function() {
  $('select').material_select();
  $('.timepicker').pickatime({
    default: 'now', // Set default time
    fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
    twelvehour: true, // Use AM/PM or 24-hour format
    donetext: 'OK', // text for done-button
    cleartext: '', // text for clear-button
    canceltext: 'Cancel', // Text for cancel-button
    autoclose: false, // automatic close timepicker
    ampmclickable: true, // make AM PM clickable
    aftershow: function(){} //Function for after opening timepicker
  });
  // grab the container.
  let browserHeight = $('img').innerHeight();
  let containerHeight = $('.container').innerHeight();
  let marginTop = parseInt($('.container').css('margin-top'));
  let navHeight = $('nav').innerHeight();
  let marginBottom = (browserHeight - (containerHeight + marginTop + navHeight)).toString();
  $('.container').css('margin-bottom', marginBottom + 'px' );

});
