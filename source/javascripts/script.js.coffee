$ ->
  sticky_class = if Modernizr.touch then 'sticky-disabled' else 'sticky'
  $(document)
    .foundation('topbar', { stickyClass: sticky_class });
