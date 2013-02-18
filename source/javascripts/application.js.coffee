$(document).ready ->
  $.localScroll.defaults.duration = 400
  $.localScroll()

  $('.flexslider').flexslider
    animation: "slide"
    slideshow: false
    controlNav: false
    directionNav: false
