$(document).ready(function() {
  $("#admin-search-submit").on("click", function(event) {
    event.preventDefault();
    $(".list-group").html("");
    var q = $("#admin_user_search").val();
    var groupId = $("#group_id").val();

    $.ajax({
      url: "/user-search",
      type: "GET",
      data: {
        userQuery: q,
        group: groupId
      }
    }).done(function(data) {
      for (var i = 0; i < data.length; i++) {
        html = '<li class="list-group-item" data-user-id="' + data[i].id + '">' + data[i].username+'\
        <span class="glyphicon glyphicon-remove pull-right" aria-hidden="true" id="remove-user"></span>\
        <span class="glyphicon glyphicon-ban-circle pull-right" aria-hidden="true" id="ban-user"></span>\
        <span class="glyphicon glyphicon-thumbs-up pull-right" aria-hidden="true" id="make-admin"></span></li>'
        $(".list-group").append(html);
      }
    });
  });


  // Click handler for kick from group
  $(".list-group").on("click", "#remove-user", function() {
    var userId = $(this).parent().attr("data-user-id");
    var groupId = $("#group_id").val();

    $.ajax({
      url: "/memberships",
      type: "DELETE",
      data: {
        user_id: userId,
        group_id: groupId
      }
    });

  });

  // Click handler for make admin
  $(".list-group").on("click", "#make-admin", function() {
    console.log("CLICKED MAKE ADMIN");
    var userId = $(this).parent().attr("data-user-id");
    var groupId = $("#group_id").val();

    $.ajax({
      url: "/memberships",
      type: "PUT",
      data: {
        user_id: userId,
        group_id: groupId,
        admin: true
      }
    }).done(function(data) {
      console.log(data);
    }).error(function(jqXHR){
      var errorMessage = jqXHR.responseText;
      var errorNode = $('<p>')
        .addClass('notice')
        .text(errorMessage);

      $('#primary-content').prepend(errorNode);
    });
  });

})
