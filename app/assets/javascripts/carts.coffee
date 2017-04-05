$(window).load ->
  $('a[data-target]').click (e) ->
    e.preventDefault()
    $this = $(this)
    if $this.data('target') == 'Add to'
      url = $this.data('addurl')
      new_target = "Remove from"
    else
      url = $this.data('removeurl')
      new_target = "Add to"
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.find('span').html(new_target)
      $this.data('target', new_target)

$(window).load ->
  $('#mycart .fa.fa-times-circle-o').click (e) ->
    e.preventDefault()
    removePrice = $(this).parent().parent().children('p.price').text()
    totalMoney = $('p.total-money').text()
    newTotal = "£" + (totalMoney.slice(1) - removePrice.slice(1)) + ".00"

    $this = $(this).closest('a')
    url = $this.data('targeturl')
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.closest('.cart-product').slideUp()
      $('p.total-money').html('<strong>' + newTotal + '</strong>')
