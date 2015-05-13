$(document).ready(function() {
  $("#comment-form").hide();

// Slide handler for comments
  $("#comments-toggle").on("click", function() {
    $("#comments-toggle").toggleClass("rotated");
    $("#comments-list").slideToggle();
  });

// Slide handler for comment form
  $("#comment-form-toggle").on("click", function() {
    $("#comment-form").slideToggle();
  });

  // Slide handler for comment form
  $("#result-form-toggle").on("click", function() {
    $("#result-form-toggle").toggleClass("rotated");
    $("#result-form").slideToggle();
  });


  $("#add-comment").on("click", function(event) {
    event.preventDefault();
    var title = $("#comment-title").val();
    var body = $("#comment-body").val();
    var commenter = $("#comment_user_id").val();
    var commentableType = $("#comment_commentable_type").val();
    var commentableId = $("#comment_commentable_id").val();

    $.ajax({
      url: "/comments",
      type: "POST",
      data: {
        comment: {
          title: title,
          body: body,
          user_id: commenter,
          commentable_type: commentableType,
          commentable_id: commentableId
        }
      }
    }).done(function(data){
      $("#comment-form").slideToggle();
      html = "<div class='well'>\
        <h4>" + data.user.username + "</h4>\
        <hr>\
        <p class='light-grey'><strong>" + data.comment.title + "</strong></p>\
        <p class='light-grey'>" + data.comment.body + "</p>\
      </div>"
      $("#comments-list").append(html);
      $("#comment-title").val("");
      $("#comment-body").val("");
    }).error(function(error) {
      alert(error);
    });


  });

})
