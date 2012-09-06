$ ->
  map_canvas = $("div#map")
  if map_canvas.length
    latLng = new google.maps.LatLng(map_canvas.data("lat"), map_canvas.data("lng"))
    mapOptions =
      center: latLng
      zoom: 16
      mapTypeId: google.maps.MapTypeId.ROADMAP

    map = new google.maps.Map(document.getElementById("map"), mapOptions);

    marker = new google.maps.Marker
      position: latLng,
      map: map