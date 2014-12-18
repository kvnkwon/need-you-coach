$(document).ready(function() {

  $('.request-container').on('submit', '.help-form', function(event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "PUT",
      url: $target.attr("action")
    }).done(function(response) {
      $target.parent().empty().append(response)
    })
  });

  $('.request-container').on('submit', '.unclaim-form', function(event) {
    event.preventDefault();
    var $target = $(event.target);
    $.ajax({
      type: "PUT",
      url: $target.attr("action")
    }).done(function(response) {
      $target.parent().empty().append(response)
    })
  });

})

$('.request-container').ready(function() {
  setTimeout(function() {
    window.location.reload(1);
  }, 10000);
})
