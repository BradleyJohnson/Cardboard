$(document).ready(function() {

  $("#masonry-div").on("click", "img", function() {
    var modalTitle = $(".modal-header h3");
    var modalBody = $(".modal-body")

    var gameName = $(this).parent().attr("data-game-name");
    var gameDescription = $(this).parent().attr("data-game-description");
    var gamePublished = $(this).parent().attr("data-year-published");
    var gameMinPlayers = $(this).parent().attr("data-min-players");
    var gameMaxPlayers = $(this).parent().attr("data-max-players");
    var gameDesigner = $(this).parent().attr("data-game-designer");
    var gameBggId = $(this).parent().attr("data-bgg-id");

    $(modalTitle).html("");
    $(modalBody).html("");

    html = "\
      <ul>\
        <li>Game Designer - " + gameDesigner + "</li>\
        <li>Year Published - " + gamePublished + "</li>\
        <li>Min Players - " + gameMinPlayers + "</li>\
        <li>Max Players - " + gameMaxPlayers + "</li>\
        <li>BGG ID - " + gameBggId + "</li>\
      </ul>\
    "
    modalTitle.append(gameName);
    modalBody.append("<p>" + html + "</p>");
    modalBody.append("<p>" + gameDescription + "</p>");

    $('#gameInfoModal').modal();
  });


  // Slide toggler for collection view
  $("#collection-toggle").on("click", function() {
    $("#collection-toggle").toggleClass("rotated");
    $("#games-available").slideToggle();
  });


  // quick search regex
  $( function() {
    var qsRegex;

    // init Isotope
    var $container = $('#masonry-div').imagesLoaded( function() {
      $container.isotope({
        layoutMode: 'packery',
        itemSelector: '.item',
        filter: function() {
          return qsRegex ? $(this).attr("data-game-name").match( qsRegex ) : true;
        }
      });
    });

    // use value of search field to filter
    var $quicksearch = $('#quicksearch').keyup( debounce( function() {
      qsRegex = new RegExp( $quicksearch.val(), 'gi' );
      $container.isotope();
    }, 200 ) );

  });

  // debounce so filtering doesn't happen every millisecond
  function debounce( fn, threshold ) {
    var timeout;
    return function debounced() {
      if ( timeout ) {
        clearTimeout( timeout );
      }
      function delayed() {
        fn();
        timeout = null;
      }
      timeout = setTimeout( delayed, threshold || 100 );
    }
  }

});
