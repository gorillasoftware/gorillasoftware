#= require_tree ./_vendor
#= require foundation/foundation
#= require_tree ./foundation

$ ->
  $(document).foundation('topbar')
  $.localScroll()
