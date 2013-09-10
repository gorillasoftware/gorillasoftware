$ ->
  offset = if Modernizr.touch then 0 else -100
  $.localScroll
    offset: offset

  sticky_class = if Modernizr.touch then 'sticky-disabled' else 'sticky'
  $(document)
    .foundation('topbar', { stickyClass: sticky_class });
