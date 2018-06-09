L.mapbox.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';
// var map = L.mapbox.map('map', 'mapbox.light')
const map = L.mapbox.map('map', 'mapbox.emerald')
    .setView([53.5778, 10.0188], 11);
const hash = L.hash(map);
const zIndexBase = 650;
const zIndexOffsetIcons = 2;
const zIndexOffsetBackground = -2;

const elemMain = document.getElementById("main");
const elemBr = document.getElementById("bottomright");
const elemMap = document.getElementById("map");
const elemMly = document.getElementById("mly");

let foregroundRoute = null;
let toggleMapIsMain = true;

map.createPane("marker").style.zIndex = zIndexBase + zIndexOffsetIcons;

// adds marker near Rathausmarkt where all routes originate from
function addCenterMarker() {
  var icon = L.divIcon({
     className: 'route-icon route-icon0',
     iconSize: null,
     html: '★'
   });
  L.marker([53.55053, 9.99421], {icon: icon, pane: "marker"}).addTo(map)
}

// Adds a route marker with the given label and color exactly at the given coordinate.
function addMarker(route, coord, color) {
  var icon = L.divIcon({
     className: 'route-icon route-icon' + route,
     iconSize: null,
     html: route
   });
  L.marker(coord, {icon: icon, pane: "marker"})
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
  const elemNew = document.getElementById("desc" + route);
  const elemOld = document.getElementById("desc" + foregroundRoute);
  console.log(elemNew);
  console.log(elemOld);
  // demote old
  if(elemOld) elemOld.style.display = "none";
  setRouteZIndex(foregroundRoute, 0);
  // promote new
  foregroundRoute = route;
  if(elemNew) elemNew.style.display = "block";
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

function createRoutePane(route, clickHandler) {
  const bgPane = map.createPane("bg-route" + route);
  bgPane.style.zIndex = zIndexBase + zIndexOffsetBackground;
  bgPane.addEventListener("click", clickHandler);

  const pane = map.createPane("route" + route);
  pane.addEventListener("click", clickHandler);
  pane.style.zIndex = zIndexBase;
  return "route" + route;
}

function getRoute(route, details) {
  const clickHandler = (evt) => {
    bringRouteToForeground(route);
    let coord = map.mouseEventToLatLng(evt);
    if(typeof mly !== "undefined") mly.goto(coord);
  }

  createRoutePane(route, clickHandler);

  fetch("geo/route" + route + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      L.geoJSON(jsonResponse, {
        style: {weight: 5, color: "#fff", opacity: 0.7},
        pane: "bg-route" + route
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

function setRouteColors(jsonResponse) {
  Object.entries(jsonResponse).forEach(([route, details]) => {
    let selector = ".route-icon" + route + ", .icon" + route;
    let rules = "background: " + details.color + ";"
    document.styleSheets[0].insertRule(selector + " { " + rules + " }")
  })
}

function toggleMapMly() {
  if(toggleMapIsMain) {
    elemBr.appendChild(elemMap);
    elemMain.appendChild(elemMly);
  } else {
    elemBr.appendChild(elemMly);
    elemMain.appendChild(elemMap);
  }
  if(mly.viewer.isNavigable) mly.viewer.resize();
  map.invalidateSize();
  toggleMapIsMain = !toggleMapIsMain;
}

function routeIconClick(evt) {
  let route = evt.target.innerText;
  bringRouteToForeground(route);
}

for (let link of document.querySelectorAll("a.icon")) {
  link.addEventListener("click", routeIconClick)
}

fetch("routes.json")
  .then(response => response.json())
  .then(jsonResponse => {
    Object.entries(jsonResponse).forEach(([route, details]) => {
      getRoute(route, details)
    })
    setRouteColors(jsonResponse);
  });

addCenterMarker();
bringRouteToForeground(1);
document.getElementById("toggle").onclick = toggleMapMly;
