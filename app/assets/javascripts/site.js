// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




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
// button menu dropdown 
var nav_bar_ready = function () {
  $(".dropdown-toggle").on("click", function(event){
    console.log("stuff");  
    $("#dropdown-menu-nav").show();
  });
  $(document).on("click", function(event) {
    $("#dropdown-menu-nav").hide();
  });
};

// button rss dropdown 
var dropdown_ready = function () {
  $(".dropdown-toggle-bis").on("mouseover", function(event){
    console.log("stuff from the rss");
    $("#dropdown-menu-links").show();
  });
  $("div.dropdown").on("mouseleave", function(event) {
    $("#dropdown-menu-links").hide();
  });
};


// rss change-show brand
var show_rss_img = function() {
  $('.img-rss').hide();
  $('.img-rss').first().show();
  $("li.link-rss").on("click", function(event){
    $('.img-rss').hide(); 
      switch($(this).data('type')){
        case 1: $("#1").show(); break;
        case 2: $("#2").show(); break;
        case 3: $("#3").show(); break;
        case 4: $("#4").show(); break;
      };
   });
};




var site_ready = function() {
  register_ready();
  login_ready();
  nav_bar_ready();
  dropdown_ready();
  show_rss_img();
};

$(site_ready);

// first step: listener al click de links
// second step: get the value of the li
// third step: hide all the divs that don't match the value and show the one that matches


