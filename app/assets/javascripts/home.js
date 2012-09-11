$(document).ready(function() {
  $(".client-clickable").click(function() {
    $(".cliente-single").hide();
    $("#" + $(this).attr('client')).show();
  })
});