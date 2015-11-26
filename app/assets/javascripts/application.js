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
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $(".button-collapse").sideNav();

  $("#query").keydown(function(event) {
    if (event.keyCode === 13){
      var self = $(this);
      query = $(this).val();
      // window.location.href = "/search?query=" + query;
      $.ajax({
        url: '/search?query=',
        type: 'GET',
        dataType: 'json',
        data: {query: query}
      })
      .done(function( response ) {
        console.log(response);
        $(".quesiton-wrapper").removeClass('valign-wrapper').css('height', 'auto');;
        displayResults(response);
      })
      .fail(function() {
        console.log("error");
      })
      .always(function() {
        console.log("complete");
      });

    }
  });

  $(".yelp").submit(function(event) {
    event.preventDefault();
  });

  function displayResults(results){
    table = $("table");
    table.empty();
    $(results).each(function(index, el) {
      place = {
        image: "<td><img src = '" + el.image_url + "'></td>",
        name: "<td><h3>" + el.name + "</h3>",
        rating: "<p>" + el.raiting + "</p></td>",
        reviews: "<td><p>" + el.review_count + "</p></td>"
      };
      var newRow = $('<tr></tr>');
      newRow.html(place.image + place.name + place.rating + place.reviews);
      table.append(newRow);
    });
  }


});
