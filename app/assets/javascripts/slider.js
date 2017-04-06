$(document).ready(function() {

  var slider = $('#slider'),
      sliderList = $('#slider ul'),
      sliderListItem = $('#slider ul li'),
      slideCount = sliderListItem.length,
      slideWidth = sliderListItem.width(),
      slideHeight = sliderListItem.height(),
      sliderUlWidth = slideCount * slideWidth;

  slider.css({ width: slideWidth, height: slideHeight });
  sliderList.css({ width: sliderUlWidth, marginLeft: - slideWidth });
  $('#slider ul li:last-child').prependTo('#slider ul');

  function moveLeft() {
    sliderList.animate({
      left: + slideWidth
    }, 200, function () {
      $('#slider ul li:last-child').prependTo('#slider ul');
      sliderList.css('left', '');
    });
  };

  function moveRight() {
    sliderList.animate({
      left: - slideWidth
    }, 200, function () {
      $('#slider ul li:first-child').appendTo('#slider ul');
      sliderList.css('left', '');
    });
  };

  $('a.control_prev').click(function () {
    moveLeft();
  });

  $('a.control_next').click(function () {
    moveRight();
  });

  $('#checkbox').change(function(){
    setInterval(function() {
      moveRight();
    }, 3000);
  });
});
