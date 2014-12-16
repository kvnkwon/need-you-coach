$(document).ready(function() {
  $('.help-form').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);
    console.log($target)
    $.ajax({
      type: "POST",
      url: $target.attr("action")
    }).done(function(response) {
      console.log(response)
      $target.html('- Coach <a href="/user/' + response.id + '">' + response.name + '</a> is helping.')
    })
  })
})
