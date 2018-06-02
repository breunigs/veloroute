L.mapbox.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';
// var map = L.mapbox.map('map', 'mapbox.light')
var map = L.mapbox.map('map', 'mapbox.emerald')
    .setView([53.5778, 10.0188], 11);
var hash = L.hash(map);
var foregroundRoute = null;
var zIndexBase = 650;
var zIndexOffsetIcons = 2;

map.createPane("backgrounds");
map.createPane("marker").style.zIndex = zIndexBase + zIndexOffsetIcons;

// Adds marker with the given label and color exactly at the given coordinate.
function addMarker(route, coord, color) {
  var icon = L.divIcon({
     className: 'route-icon route-icon' + route,
     iconSize: null,
     html: '<div style="background:'+color+'">'+route+'</div>'
   });
  let x = L.marker(coord, {icon: icon, pane: "marker"})
    .addTo(map)
    .on('click', () => bringRouteToForeground(route));
}

// addSnappedMarker takes the given coord and finds the closest start/end of the
// jsonResponse multilinestring GeoJSON. It then adds a marker to that endpoint.
function addSnappedMarker(route, jsonResponse, coord, color) {
  let lines = jsonResponse.features[0].geometry.coordinates;
  let ref = L.latLng(coord);

  let best = [coord, Number.MAX_VALUE];

  lines.forEach(line => {
    best = giveCloser(ref, best, line[0]);
    best = giveCloser(ref, best, line[line.length - 1]);
  });
  addMarker(route, best[0], color)
}

// giveCloser checks if the given GeoJSON coordinate is closer to the reference
// point. If so, it returns a new "best".
function giveCloser(ref, best, lineCoord) {
  let newCoord = [lineCoord[1], lineCoord[0]]
  let newDist = ref.distanceTo(newCoord);
  if(newDist < best[1]) return [newCoord, newDist];
  return best;
}

// Increases the zIndex for the given route. If there was a previously focused
// route, its zIndex will be reset.
function bringRouteToForeground(route) {
  if(route == foregroundRoute) return;
  setRouteZIndex(foregroundRoute, 0);
  foregroundRoute = route;
  setRouteZIndex(route, 1);
}

// sets the zIndex for both route and its icons to adhere to the offset. Pass 0
// to reset to default values.
function setRouteZIndex(route, zOffset) {
  if(!route) return;
  map.getPane("route" + route).style.zIndex = zIndexBase + zOffset;
  document.querySelectorAll(".route-icon" + route).forEach(elem => {
    elem.style.zIndex = zIndexBase + zOffset + zIndexOffsetIcons;
  })
}

function getRoute(route, details) {
  let pane = map.createPane("route" + route)
  pane.addEventListener("click", () => bringRouteToForeground(route));

  fetch("geo/route" + route + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      L.geoJSON(jsonResponse, {
        style: {weight: 5, color: "#fff", opacity: 0.7},
        interactive: false,
        pane: "backgrounds"
      }).addTo(map);

      L.geoJSON(jsonResponse, {
        style: {weight: 3, color: details.color, opacity: 0.8},
        pane: "route" + route,
        onEachFeature: function(feature, layer) {
          // layer.on("click", () => {  })
        }
      }).addTo(map);

      if(details.markers && details.markers[0][0]) {
        details.markers.forEach(coord => addSnappedMarker(route, jsonResponse, coord, details.color))
      }
    });
}

fetch("routes.json")
  .then(response => response.json())
  .then(jsonResponse => {
    Object.entries(jsonResponse).forEach(([route, details]) => {
      getRoute(route, details)
    })
  });
