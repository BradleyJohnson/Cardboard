$(document).ready(function() {

  var $container = $('#masonry-div').imagesLoaded( function() {
  // initialize Packery after all images have loaded
    $container.packery();
  });

});
