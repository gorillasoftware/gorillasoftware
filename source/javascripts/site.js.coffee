jQuery ->

  mapOptions =
    center: new google.maps.LatLng(47.382209, 8.535787)
    zoom: 15
    mapTypeId: google.maps.MapTypeId.ROADMAP
    scrollwheel: false

  console.log $(".map-canvas")
  map = new google.maps.Map($(".map-canvas")[0], mapOptions)
