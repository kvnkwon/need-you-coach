$(document).ready(function() {
  $('.help-form').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "PUT",
      url: $target.attr("action"),
      dataType: "JSON"
    }).done(function(response) {
      console.log(response)
      $target.html('- Coach <a href="/user/' + response.id + '">' + response.name + '</a> is helping.')
    })
  });
})
