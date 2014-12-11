$(document).ready(function () {

  $(".success-prompt").load(function(){
    window.setTimeout(function(){
      alert("within the timeout function")
    window.location.href='/';
    }, 3000);
  })
});
