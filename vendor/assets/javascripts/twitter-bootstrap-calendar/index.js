function tbsCalendarSetMaxHeight(){
  var maxHeight = -1;

  $('.calendar_grid .week .span1').each(function() {
    maxHeight = maxHeight > $(this).height() ? maxHeight : $(this).height();
  });

  $('.calendar_grid .week .span1').each(function() {
    $(this).height(maxHeight);
  });
}

$(document).ready(function() {
  tbsCalendarSetMaxHeight();
});
