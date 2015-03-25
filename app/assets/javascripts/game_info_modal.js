$(document).ready(function() {
  $("#masonry-div").on("click", "img", function() {
    var modalTitle = $(".modal-header h4");
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
      <dl>\
        <dt>Game Designer</dt> - <dd>" + gameDesigner + "</dd>\
        <dt>Year Published</dt> - <dd>" + gamePublished + "</dd>\
        <dt>Min Players</dt> - <dd>" + gameMinPlayers + "</dd>\
        <dt>Max Players</dt> - <dd>" + gameMaxPlayers + "</dd>\
        <dt>BGG ID</dt> - <dd>" + gameBggId + "</dd>\
      </dl>\
    "
    modalTitle.append("<h4> " + gameName + "</h4>");
    modalBody.append("<p>" + html + "</p>");
    modalBody.append("<p>" + gameDescription + "</p>");

    $('#gameInfoModal').modal();
  });
});
