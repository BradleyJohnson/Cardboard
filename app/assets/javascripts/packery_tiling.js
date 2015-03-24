$(document).ready(function() {
  // var $container = $('#masonry-div');
  // initialize
  // $container.masonry({
  //   columnWidth: 200,
  //   itemSelector: '.item',
  //   "gutter": 10
  // });


  // var container = document.querySelector('#masonry-div');
  // var msnry;
  // initialize Masonry after all images have loaded
  // imagesLoaded( container, function() {
  //   msnry = new Masonry( container );
  // });

  var $container = $('#masonry-div').imagesLoaded( function() {
  // initialize Packery after all images have loaded
  $container.packery();
});

});
