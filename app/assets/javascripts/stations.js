// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

  $("#search-btn").append(`<%= link_to 'Search', stops_path(from: '${#from.val()}', to: '${#to.val()}'), class: 'btn btn-lg btn-primary' %>`);
