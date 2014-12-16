$(document).ready(function() {
  $('.help-form').submit(function(event) {
    event.preventDefault();
    var $target = $(event.target);

    $.ajax({
      type: "POST",
      url: $target.attr("action")
    }).done(function(response) {
      console.log(response)
    })
  })
})
