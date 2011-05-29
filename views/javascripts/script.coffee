($ document).ready ->
  ($ '.top').addClass 'hidden'
  $.waypoints.settings.scrollThrottle = 30
  ($ '#wrapper').waypoint (event, direction) ->
    ($ '.top').toggleClass 'hidden', direction is "up",
    offset: '-100%'
  
  ($ '#main-nav-holder').waypoint (event, direction) ->
    ($ this).parent().toggleClass 'sticky', direction is "down"
    event.stopPropagation()

