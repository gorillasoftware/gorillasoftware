($ document).ready ->
  ($ '.top').addClass 'hidden'
  $.waypoints.settings.scrollThrottle = 30
  ($ '#wrapper').waypoint (event, direction) ->
    ($ '.top').toggleClass 'hidden', direction is "up",
    offset: '-100%'

  ($ 'nav').waypoint (event, direction) ->
    ($ this).toggleClass 'sticky', direction is "down"
    event.stopPropagation()

