L.mapbox.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';
// var map = L.mapbox.map('map', 'mapbox.light')
var map = L.mapbox.map('map', 'mapbox.light')
    .setView([53.5778, 10.0188], 11);

// var baseLayers = {
//   "Emerald": L.mapbox.tileLayer('maxmeles.emerald'),
//   "Light": L.mapbox.tileLayer('maxmeles.light'),
// };

// var overlays = {
//   // "Marker": marker,
//   // "Roads": roadsLayer
// };

// L.control.layers(baseLayers, overlays).addTo(map);

function getRoute(num, options) {
  fetch("geo/route" + num + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      L.geoJSON(jsonResponse, {
        style: function(feature) {
          return {color: options.color};
        },
        onEachFeature: function(feature, layer) {
          // layer.bindPopup("lol");
        }
      }).addTo(map);
    });
}

fetch("routes.json")
  .then(response => response.json())
  .then(jsonResponse => {
    Object.entries(jsonResponse).forEach(([route, details]) => {
      getRoute(route, details)
    })
  });
