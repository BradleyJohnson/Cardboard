$(document).ready(function() {
  $("#admin-search-submit").on("click", function(event) {
    event.preventDefault();
    var q = $("#admin_user_search").val();
    var group_id = $("#group_id").val();

    $.ajax({
      url: "/user-search",
      type: "GET",
      data: {
        userQuery: q,
        group: group_id
      }
    }).done(function(data) {
      for (var i = 0; i < data.length; i++) {
        html = '<li>'+data[i].username+'</li>'
        $("#list").append(html)
      }
    })





  })
})
