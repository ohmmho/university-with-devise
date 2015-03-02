// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.




// modal login & register
var login_ready = function() {
  $("#my_modal").hide();
  $("#login").on("click", function(event) {
    event.preventDefault();
    $("#my_modal").show();
  });

  $(".close").on("click", function(event) {
    $("#my_modal").hide();
  });
};

var register_ready = function() {
    $("#my_modal_reg").hide();
    $("#register").on("click", function(event) {
      event.preventDefault();
      $("#my_modal_reg").show();
    });

    $(".close").on("click", function(event) {
      $("#my_modal_reg").hide();
    });
};

// button menu dropdown 
var nav_bar_ready = function () {
  $(".dropdown-toggle").on("click", function(event){
    $("#dropdown-menu-nav").show();
  });
  $(document).on("click", function(event) {
    $("#dropdown-menu-nav").hide();
  });
};

//button link.rss dropdown

var dropdown_ready2 = function () {
  $("#dropdown-menu-links2").hide();
  $("#dropdownMenu1").on("mouseover", function(event){
    $("#dropdown-menu-links2").show();
  });
  $("div.dropdown").on("mouseleave", function(event) {
    $("#dropdown-menu-links2").hide();
  });
};

// button img.rss dropdown 
var dropdown_ready = function () {
  $(".dropdown-toggle-bis").on("mouseover", function(event){
    $("#dropdown-menu-links").show();
  });
  $("div.dropdown").on("mouseleave", function(event) {
    $("#dropdown-menu-links").hide();
  });
};

var change_name_rss = function(){
  var thing = $("#target-img1").text();
}

// rss change-show inspiración
var show_rss_img = function() {
  $('.img-rss').hide();
  $('.img-rss').first().show();
  $("li.img-link-rss").on("click", function(event){
    var our_text = event.currentTarget.innerText;
    $("#target-img1").text(our_text);
    $('.img-rss').hide(); 
      switch($(this).data('type')){
        case 1: $("#1").show(); break;         
        case 2: $("#2").show(); break;
        case 3: $("#3").show(); break;
        case 4: $("#4").show(); break;
      };
   });
};




// rss change-show noticias

var show_rss_links = function() {

};  





var site_ready = function() {
  register_ready();
  login_ready();
  nav_bar_ready();
  dropdown_ready2();
  dropdown_ready();
  show_rss_img();
  change_name_rss();
};

$(site_ready);

// first step: listener al click de links
// second step: get the value of the li
// third step: hide all the divs that don't match the value and show the one that matches
// $('#target-img').text('Dribbble'); break;


