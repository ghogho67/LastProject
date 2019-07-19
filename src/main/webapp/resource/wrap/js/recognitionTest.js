(function($) {
  'use strict';
  $(function() {
	  
   
    
    

    $("#choice-login button").click(function() {
    	  $("#choice-login").css("left", "-50vw");
    	  $("#choice-register").css("top", "-100vh");
    	  $("#register").css("top", "-100vh");
    	});
    	$("#choice-register button").click(function() {
    	  $("#choice-register").css("top", "-100vh");
    	  $("#choice-login").css("left", "-50vw");
    	  $("#login").css("top", "-100vh");
    	});
    	$("#login .reset, #register .reset").click(function() {
    	  $("#choice-register").css("top", "0vh");
    	  $("#choice-login").css("left", "0vw");
    	  $("#register").css("top", "0vh");
    	  $("#login").css("top", "0vh");
    	});

    	$("#nav-butt").click(function() {
    	$("#navi").toggleClass( 'open closed' );
    	});

    
    
    
  });
})