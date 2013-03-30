
ready = ->

  # The last element of the whole bread crumb path is not to be shown slim
  # in order to not have an open end (like " A >> C > D > " if E is slim).
  $( "li.slim.crumb.last" ).removeClass( "slim" )

  # Initially hide all slim elements.
  $( "li.slim.crumb" ).hide()

  # Define some timers: The slim elements are not to be shown immediately after
  # mouseover(), but a while after, that is if the user stays over the element.
  breadcrumb_slim_in_timer = 0
  breadcrumb_slim_out_timer = 0

  # status variable that knows whether an animation is currently running.
  animating = false

  # Time required to dwell.
  time_to_dwell = 1000 # milliseconds

  # Show the slim elements if the mouse stays over the separator.
  $( "li.crumb.sep" ).mouseover( ->
    hovered_sep = $( this )
    breadcrumb_slim_in_timer = setTimeout( ->
      show_slim_breadcrumbs( hovered_sep )
    , time_to_dwell )
  ).mouseout( ->
    clearTimeout( breadcrumb_slim_in_timer )
  )

  # Show the slim element on click as well.
  $( "li.crumb.sep" ).click( ->
    if not animating
      show_slim_breadcrumbs( $( this ) )
  )

  # Show all elements on dblclick.
  $( "#breadcrumb" ).dblclick( ->
    delay_time = 0
    delay_time = 600 if animating # because then, a click event is performing an animation
    animating = true
    $( "li.slim.crumb:not(:visible)" ).delay( delay_time ).show( "drop", ->
      animating = false
    )
  )

  # If the mouse leaves the breadcrumb, hide the slim elements.
  $( "#breadcrumb" ).mouseout( ->
    breadcrumb_slim_out_timer = setTimeout( ->
      hide_slim_breadcrumbs()
    , time_to_dwell )
  ).mouseover( ->
    clearTimeout( breadcrumb_slim_out_timer )
  )

  # show animation:
  breadcrumb_slim_effect = "drop"
  show_slim_breadcrumbs = ( next_to_element = null ) ->
    elements_to_show = close_slim_elements( next_to_element )
    for elem in elements_to_show
      unless $( elem ).is( ":visible" )
        animating = true
        $( elem ).show( breadcrumb_slim_effect, ->
          animating = false
        )

  # hide animation:
  hide_slim_breadcrumbs = () ->
    if $( "li.slim.crumb:visible" ).html()
      animating = true
      $( "li.crumb" ).hide( "fade", "fast", ->
        $( "li.crumb:not(.slim)" ).show( "fade", ->
          animating = false
        )
      )

  # helper function to find nearby slim elements
  close_slim_elements = ( next_to_element ) ->
    return $( "li.slim.crumb" ) if next_to_element is null
    left_element = $( next_to_element ).prevAll( "li.crumb:not(.slim,.sep)" ).last()
    right_element = $( next_to_element ).nextAll( "li.crumb:not(.slim,.sep)" ).first()
    elements_between = left_element.nextUntil( right_element, "li.slim.crumb" )
    return elements_between

$(document).ready(ready)
$(document).on('page:load', ready)

