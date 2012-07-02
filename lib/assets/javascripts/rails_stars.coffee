moveTo = (element, event)->
  $element = $(element)
  starsNumber = 1 + parseInt((5.0 * (event.pageX - $element.offset().left)) / $element.width())
  $element.attr('data-stars-selecting', starsNumber)

$(document).
  on('mouseenter', '[data-stars-for]', (event)->
    moveTo(@, event)
    $(@).addClass('selecting')
  ).
  on('mousemove', '[data-stars-for]', (event)->
    moveTo(@, event)
  ).
  on('mouseleave', '[data-stars-for]', (event)->
    $(@).removeClass('selecting')
  ).
  on('click', '[data-stars-for]', (event)->
  )
