$ ->
  sticky_class = if Modernizr.touch then 'sticky-disabled' else 'sticky'
  $(document).foundation('topbar', {
    stickyClass: sticky_class
    scrolltop: false
  });
  $(document).foundation('orbit', {
    timer_show_progress_bar: false
  })
  $(document).foundation('tooltips')
