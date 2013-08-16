$ ->
  $('#recentwork .flexslider').flexslider
    animation: "slide"
    slideshow: false
    directionNav: false
    controlsContainer: '#recentwork .controller .bullets'
  $('#recentwork .prev').click ->
    $('#recentwork .flexslider').flexslider("prev")
  $('#recentwork .next').click ->
    $('#recentwork .flexslider').flexslider("next")
