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
//= require materialize-sprockets
//= require emojione
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $(".button-collapse").sideNav();

  $("#query").keydown(function(event) {
    if (event.keyCode === 13){
      query = $(this).val();
      searchYelp(query);
      $(this).val("");
    }
  });

  $(".yelp").submit(function(event) {
    event.preventDefault();
  });

  function searchYelp(query){
    $.ajax({
      url: '/search?query=',
      type: 'GET',
      dataType: 'json',
      data: {query: query}
    })
    .done(function( response ) {
      $(".quesiton-wrapper").removeClass('valign-wrapper').css('height', 'auto');
      displayResults(response);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });
  }

  function displayResults(results){
    table = $("table");
    table.empty();
    $(results).each(function(index, el) {
      place = {
        image: "<td><img src = '" + el.image_url + "'></td>",
        name: "<td><h3>" + el.name + "</h3>",
        rating: "<img src = '" + el.rating_img_url + "'></td>",
        reviews: "<td><p>" + el.review_count + "</p></td>"
      };
      var newRow = $('<tr></tr>');
      newRow.html(place.image + place.name + place.rating + place.reviews);
      table.append(newRow);
    });
  }

  $(".mood-list").click(function(event) {
    var moodId = $(event.target).attr('id');
    $.ajax({
      url: '/moods/' + moodId + '/foods',
      type: 'GET',
      dataType: 'json'
    })
    .done(function(response) {
      var randomFoodFromList = response[Math.floor(Math.random()*response.length)];
      searchYelp(randomFoodFromList.name);
    })
    .fail(function() {
      console.log("error");
    })
    .always(function() {
      console.log("complete");
    });

  });

});
