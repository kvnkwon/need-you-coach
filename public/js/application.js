$(document).ready(function() {

  $('.request-container').on('submit', '.help-form', function(event) {
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
