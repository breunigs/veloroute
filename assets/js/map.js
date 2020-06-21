// limit mapbox tracking
if (window.localStorage) window.localStorage.clear();
import mapboxgl from 'mapbox-gl';

const settings = document.getElementById("settings").dataset;
mapboxgl.accessToken = settings.mapboxAccessToken;

const fitBoundsOpt = { padding: { top: 35, bottom: 35, left: 35, right: 35 }, maxZoom: 17 };

const mapElem = document.getElementById('map');
const map = new mapboxgl.Map({
  container: 'map',
  maxBounds: settings.maxBounds.split(","),
  bounds: settings.initial.split(","),
  fitBoundsOptions: fitBoundsOpt,
  minZoom: 9,
  maxZoom: 19,
  style: 'mapbox://styles/breunigs/ck8hk6y7e0csv1ioh4oqdtybb',
  pitchWithRotate: false,
  dragRotate: false,
});
map.touchZoomRotate.disableRotation();

const routeLayers = ['routes-casing', 'routemarker-circle'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = { layers: routeLayers.concat(articleLayers) };

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
let indicatorRot = null;
function renderIndicator() {
  if (state.lon == "" || state.lat == "") return;
  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);

  if (!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
    indicatorRot = document.getElementById('indicator-rotate');
    if (!map.isMoving() && prevBoundsTs === "") {
      const zoom = Math.max(map.getZoom(), 14);
      map.flyTo({ center: lngLat, zoom: zoom });
    }
  }

  indicatorRot.style.transform = `rotate(${state.bearing}deg)`;
  indicator.setLngLat(lngLat);
}

const ensureIndicatorInView = () => {
  if (map.isMoving() || !indicator) {
    return;
  }

  const indiRect = indicator.getElement().getBoundingClientRect();
  const indiPos = {
    x: indiRect.left + indiRect.width / 2,
    y: indiRect.top + indiRect.height / 2
  };

  const mapRect = mapElem.getBoundingClientRect();
  const cmp = (padding) => {
    return indiPos.y <= mapRect.top + padding
      || indiPos.y >= mapRect.bottom - padding
      || indiPos.x <= mapRect.left + padding
      || indiPos.x >= mapRect.right - padding;
  }

  // add padding in pixels around the viewport
  const outsideViewport = cmp(20);
  if (!outsideViewport) { return; }

  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);
  const veryFarOutside = cmp(-200);
  if (veryFarOutside) {
    console.debug("Flying to location", lngLat)
    map.flyTo({ center: lngLat });
  } else {
    console.debug("Panning to location", lngLat)
    map.panTo(lngLat);
  }
}

let indicatorFocus = null;
let prevIndicatorPos = '';
const maybeEnsureIndicatorInView = () => {
  if (state.sequence !== "" && indicatorFocus === null) {
    indicatorFocus = setInterval(ensureIndicatorInView, 2000);
  } else if (state.sequence === "" && indicatorFocus !== null) {
    clearInterval(indicatorFocus);
    indicatorFocus = null;
  } else if (indicator && prevIndicatorPos !== `${state.lon},${state.lat}`) {
    // console.debug("indicator present, and changed, ensuring it's in view", indicator)
    prevIndicatorPos = `${state.lon},${state.lat}`;
    setTimeout(ensureIndicatorInView, 0);
  }
}


let prevBoundsTs = "";
const maybeFitBounds = () => {
  if (prevBoundsTs == state.boundsTs || state.bounds == "") {
    return;
  }
  console.debug("Bounds have changed from to", state.bounds)
  prevBoundsTs = state.boundsTs;
  map.fitBounds(state.bounds.split(","), fitBoundsOpt);
}

const clickLeniency = 'ontouchstart' in window ? 10 : 3;
const itemsUnderCursor = (evt) => {
  let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
  // be more lenient with click targets
  if (!routes.length) {
    const sw = [evt.point.x - clickLeniency, evt.point.y + clickLeniency];
    const ne = [evt.point.x + clickLeniency, evt.point.y - clickLeniency];
    routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
  }
  return routes;
}

const handleMapHover = (evt) => {
  const none = itemsUnderCursor(evt).length === 0;
  map.getCanvas().style.cursor = none ? '' : 'pointer';
}

const handleMapClick = (evt) => {
  const items = itemsUnderCursor(evt);

  let route = null;
  let article = null;
  items.forEach(r => {
    if (routeLayers.includes(r.layer.id)) {
      route = r.properties.route_id;
    } else if (articleLayers.includes(r.layer.id)) {
      article = r.properties.name;
    }
  });

  if (route === null && article === null) return;

  window.pushEvent("map-click", {
    route: route,
    article: article,
    lon: evt.lngLat.lng,
    lat: evt.lngLat.lat,
    zoom: map.getZoom()
  })
}

const sendBounds = () => {
  window.pushEvent("map-bounds", { bounds: map.getBounds().toArray() });
}

map.on('style.load', () => {
  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);
  map.once('click', removeFakeMap);
});


let fakeMap = document.getElementById("fakeMap");
const removeFakeMap = () => {
  if (fakeMap === null) return;
  fakeMap.style.opacity = 0;
  const localFake = fakeMap
  fakeMap = null;
  setTimeout(() => localFake.remove(), 200);
}
map.once('load', removeFakeMap);



window.mapStateChanged = () => {
  maybeFitBounds();
  renderIndicator();
  maybeEnsureIndicatorInView();

}
