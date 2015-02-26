// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// button dropdown menu 
var ready;
ready = function() {
  $(".dropdown-toggle").on("click", function(event){
    console.log("stuff");    
    $(".dropdown-menu").show();
  });
  $(document).on("click", function(event) {
    $(".dropdown-menu").hide();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

// modal login
var login_ready = function() {
  $("#my_modal").hide();

  $("#login").on("click", function(event) {
    event.preventDefault();
      console.log("stuff happening");    

    $("#my_modal").show();
  });

  $(".close").on("click", function(event) {
    $("#my_modal").hide();
  });
};

$(document).ready(login_ready);
$(document).on('page:load', login_ready);

