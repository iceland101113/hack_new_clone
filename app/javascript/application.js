// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import './src/jquery'

$(function() {
  $( ".comment-form-display" ).click(function(){
    $(this).next().child().css("display", "block");
  });

  $( ".comment-form-close" ).click(function(){
    $(this).parent().css("display", "none");
  });
})
