moveTo = (element, event)->
  $element = $(element)
  starsNumber = 1 + parseInt((5.0 * (event.pageX - $element.offset().left)) / $element.width())
  $element.
    attr('data-stars-selecting', starsNumber).
    find('input[name="star[rating]"]').val(starsNumber)

$(document).
  on('mouseenter', '.new_star', (event)->
    moveTo(@, event)
    $(@).addClass('selecting')
  ).
  on('mousemove', '.new_star', (event)->
    moveTo(@, event)
  ).
  on('mouseleave', '.new_star', (event)->
    $(@).removeClass('selecting')
  ).
  on('click', '.new_star', (event)->
    $element = $(@)
    $.post($element.attr('action'), $element.serialize()).
      success (r)=>
        $element.attr('data-stars-rating', r['rating'])
  )
