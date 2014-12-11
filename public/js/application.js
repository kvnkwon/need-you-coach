$(document).ready(function () {

  $(".success-prompt").on("load", function(){
    window.setTimeout(function(){
      alert("within the timeout function")
    window.location.href='/';
    }, 3000);
  })
});
