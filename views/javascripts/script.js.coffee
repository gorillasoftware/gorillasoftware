initialize_map = ->
  address =
    company: "gorilla software"
    address1: "Baumstrasse 10"
    address2: "CH-8005 Z&uuml;rich"

  myOptions =
    zoom: 15
    center: new google.maps.LatLng(47.382326, 8.535765)
    mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)

  myLatLng = new google.maps.LatLng(47.382326, 8.535765);
  marker = new google.maps.Marker
    map: map
    position: myLatLng
    title: address.company

  template = Handlebars.compile ($ "#map-marker-template").html() 
  infowindow = new google.maps.InfoWindow
    content: template address

  google.maps.event.addListener marker, 'click', ->
    infowindow.open map, marker

($ document).ready ->
  initialize_map()
  ($ 'a[href^="http://"]').attr "target", "_blank"

