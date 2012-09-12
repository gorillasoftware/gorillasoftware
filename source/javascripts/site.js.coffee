jQuery ->

  mapOptions =
    center: new google.maps.LatLng(47.382209, 8.535787)
    zoom: 15
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  console.log $("#map_canvas")
  map = new google.maps.Map($("#map_canvas")[0], mapOptions)
