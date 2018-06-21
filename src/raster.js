import { mapillary as mly } from "./mapillary";
import routes from "../routes.json";
import {
  zIndexBase,
  zIndexOffsetIcons,
  zIndexOffsetBackground,
  elemMain,
  elemBr,
  elemMap,
  elemMly
} from "./config";

L.mapbox.accessToken =
  "pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA";
// var map = L.mapbox.map('map', 'mapbox.light')
export const map = L.mapbox
  .map("map", "mapbox.emerald")
  .setView([53.5778, 10.0188], 11);

let foregroundRoute = null;
let toggleMapIsMain = true;

map.createPane("marker").style.zIndex = zIndexBase + zIndexOffsetIcons;

// adds marker near Rathausmarkt where all routes originate from
function addCenterMarker() {
  var icon = L.divIcon({
    className: "route-icon route-icon0",
    iconSize: null,
    html: "★"
  });
  L.marker([53.55053, 9.99421], { icon: icon, pane: "marker" }).addTo(map);
}

// Adds a route marker with the given label and color exactly at the given coordinate.
function addMarker(route, coord, color) {
  var icon = L.divIcon({
    className: "route-icon route-icon" + route,
    iconSize: null,
    html: route
  });
  L.marker(coord, { icon: icon, pane: "marker" })
    .addTo(map)
    .on("click", evt => {
      bringRouteToForeground(route);
      if (typeof mly !== "undefined") mly.goto(evt.latlng);
    });
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
  addMarker(route, best[0], color);
}

// giveCloser checks if the given GeoJSON coordinate is closer to the reference
// point. If so, it returns a new "best".
function giveCloser(ref, best, lineCoord) {
  let newCoord = [lineCoord[1], lineCoord[0]];
  let newDist = ref.distanceTo(newCoord);
  if (newDist < best[1]) return [newCoord, newDist];
  return best;
}

// Increases the zIndex for the given route. If there was a previously focused
// route, its zIndex will be reset.
function bringRouteToForeground(route) {
  if (route == foregroundRoute) return;
  const elemNew = document.getElementById("desc" + route);
  const elemOld = document.getElementById("desc" + foregroundRoute);
  // demote old
  if (elemOld) elemOld.style.display = "none";
  setRouteZIndex(foregroundRoute, 0);
  // promote new
  foregroundRoute = route;
  if (elemNew) elemNew.style.display = "block";
  setRouteZIndex(route, 1);
}

// sets the zIndex for both route and its icons to adhere to the offset. Pass 0
// to reset to default values.
function setRouteZIndex(route, zOffset) {
  if (!route || !map) return;
  const mapPane = map.getPane("route" + route);
  if (mapPane) mapPane.style.zIndex = zIndexBase + zOffset;
  document.querySelectorAll(".route-icon" + route).forEach(elem => {
    elem.style.zIndex = zIndexBase + zOffset + zIndexOffsetIcons;
  });
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
  const clickHandler = evt => {
    bringRouteToForeground(route);
    let coord = map.mouseEventToLatLng(evt);
    if (typeof mly !== "undefined") mly.goto(coord);
  };

  createRoutePane(route, clickHandler);

  fetch("geo/route" + route + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      L.geoJSON(jsonResponse, {
        style: { weight: 5, color: "#fff", opacity: 0.7 },
        pane: "bg-route" + route
      }).addTo(map);

      L.geoJSON(jsonResponse, {
        style: { weight: 3, color: details.color, opacity: 0.8 },
        pane: "route" + route
      }).addTo(map);

      if (details.markers && details.markers[0][0]) {
        details.markers.forEach(coord =>
          addSnappedMarker(route, jsonResponse, coord, details.color)
        );
      }
    });
}

function setRouteColors(jsonResponse) {
  Object.entries(jsonResponse).forEach(([route, details]) => {
    let selector = ".route-icon" + route + ", .icon" + route;
    let rules = "background: " + details.color + ";";
    document.styleSheets[0].insertRule(selector + " { " + rules + " }");
  });
}

function toggleMapMly() {
  if (toggleMapIsMain) {
    elemBr.appendChild(elemMap);
    elemMain.appendChild(elemMly);
  } else {
    elemBr.appendChild(elemMly);
    elemMain.appendChild(elemMap);
  }
  if (mly.viewer.isNavigable) mly.viewer.resize();
  map.invalidateSize();
  toggleMapIsMain = !toggleMapIsMain;
}

function routeIconClick(evt) {
  let route = evt.target.innerText;
  bringRouteToForeground(route);
}

function zoomToName(name) {
  const url = "https://nominatim.openstreetmap.org/search/";
  const params =
    "?format=json&viewbox=9.5732117,53.3825092,10.4081726,53.794973&bounded=1&limit=1";

  fetch(url + encodeURIComponent(name) + params)
    .then(response => response.json())
    .then(jsonResponse => {
      const bbox = jsonResponse[0].boundingbox;
      map.fitBounds([[bbox[0], bbox[2]], [bbox[1], bbox[3]]], { maxZoom: 16 });
    });
}

function getTopLevelText(node) {
  let child = node.firstChild;
  let text = "";
  while (child) {
    if (child.nodeType == Node.TEXT_NODE) text += child.data;
    child = child.nextSibling;
  }
  return text == "" ? null : text;
}

function getAndZoomToName(evt) {
  if (evt.target.nodeName !== "A") return;
  // const text = getTopLevelText(evt.target);
  // if(text) zoomToName(text);
  zoomToName(evt.target.innerText);
}

export function init() {
  Object.entries(routes).forEach(([route, details]) => {
    getRoute(route, details);
  });
  setRouteColors(routes);

  addCenterMarker();
  bringRouteToForeground(1);
  document.getElementById("toggle").onclick = toggleMapMly;
  for (let link of document.querySelectorAll("a.icon")) {
    link.addEventListener("click", routeIconClick);
  }
  for (let link of document.querySelectorAll("table.routing")) {
    link.addEventListener("click", getAndZoomToName);
  }
}
