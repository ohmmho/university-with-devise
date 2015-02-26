// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// button dropdown menu 
var ready;

// modal login
var login_ready = function() {
  $("#my_modal").hide();
  console.log("stuff happening");

  $("#login").on("click", function(event) {
    event.preventDefault();
    $("#my_modal").show();
    console.log("stuff happening");
  });

  $(".close").on("click", function(event) {
    $("#my_modal").hide();
  });
};

var register_ready = function() {
    $("#my_modal_reg").hide();
    console.log("stuff happening");

    $("#register").on("click", function(event) {
      event.preventDefault();
      $("#my_modal_reg").show();
      console.log("stuff happening");
    });

    $(".close").on("click", function(event) {
      $("#my_modal_reg").hide();
    });
  };


ready = function() {
  $(".dropdown-toggle").on("click", function(event){
    console.log("stuff");    
    $(".dropdown-menu").show();
  });
  $(document).on("click", function(event) {
    $(".dropdown-menu").hide();
  });
  login_ready();
  register_ready();
};

$(document).ready(ready);
$(document).on('page:load', ready);

