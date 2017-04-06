$(function () {
  $(".treats").mouseenter(function(){
    $('.treats-i').addClass('treats-steam');
  })

  $(".treats").mouseleave(function(){
    $('.treats-i').removeClass('treats-steam');
  })

  $(".toys").mouseenter(function(){
    $('.horse').addClass('rocking');
  })

  $(".toys").mouseleave(function(){
    $('.horse').removeClass('rocking');
  })

  $(".bobs").mouseenter(function(){
    $('.bobs-i').addClass('bobs-o');
  })

  $(".bobs").mouseleave(function(){
    $('.bobs-i').removeClass('bobs-o');
  })

  $(".apparel").mouseenter(function(){
    $('.apparel-i').addClass('apparel-o');
  })

  $(".apparel").mouseleave(function(){
    $('.apparel-i').removeClass('apparel-o');
  })

  $(".accessories").mouseenter(function(){
    $('.accessories-i').addClass('accessories-o');
  })

  $(".accessories").mouseleave(function(){
    $('.accessories-i').removeClass('accessories-o');
  })

  $(".books").mouseenter(function(){
    $('.books-i').addClass('books-o');
  })

  $(".books").mouseleave(function(){
    $('.books-i').removeClass('books-o');
  })
});
