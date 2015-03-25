$(document).ready(function() {
  $("#import-collection").on("click", function() {
    var bggUsername = $("#bgg-username").val();

    $.ajax({
      url: "/bgg",
      type: "GET",
      data: {
        userCollection: bggUsername
      }
    }).done(function(data) {
      $.ajax({
        url: "/bgg",
        type: "PUT",
        data: {
          collectionData: data
        }
      });
    });

  });
});
