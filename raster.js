L.mapbox.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';
// var map = L.mapbox.map('map', 'mapbox.light')
var map = L.mapbox.map('map', 'mapbox.emerald')
    .setView([53.5778, 10.0188], 11);
var hash = L.hash(map);
var foregroundRoute = 1;

map.createPane("backgrounds");

function bringRouteToForeground(route) {
  setRouteZIndex(foregroundRoute, 650);
  foregroundRoute = route;
  setRouteZIndex(route, 651);
}

function setRouteZIndex(route, zIndex) {
  map.getPane("route" + route).style.zIndex = zIndex;
}

function getRoute(route, options) {
  map.createPane("route" + route);

  fetch("geo/route" + route + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      L.geoJSON(jsonResponse, {
        style: {weight: 5, color: "#fff", opacity: 0.7},
        interactive: false,
        pane: "backgrounds"
      }).addTo(map);

      L.geoJSON(jsonResponse, {
        style: {weight: 3, color: options.color, opacity: 0.8},
        pane: "route" + route,
        onEachFeature: function(feature, layer) {
          layer.on("click", () => { bringRouteToForeground(route) })
          // layer.click
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
