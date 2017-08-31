function initMap() {
  var loc = {lat: 45.2461, lng: 19.8517};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: loc
  });
  var marker = new google.maps.Marker({
    position: loc,
    map: map
  });
}