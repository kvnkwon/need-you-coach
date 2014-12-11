$(document).ready(function () {

  $(".success-prompt").ready(function(){
    window.setTimeout(function(){
      alert("within the timeout function")
    window.location.href='/';
    }, 3000);
  })
});
