if (!window.requestIdleCallback) {
  window.requestIdleCallback = function (x) {
    window.setTimeout(x, 0);
  }
}

const video = document.getElementById('videoInner');
const settings = document.getElementById("settings").dataset;
mapboxgl.accessToken = "pk.";

const fitBoundsOpt = {
  padding: {
    top: 35,
    bottom: 35,
    left: 35,
    right: 35
  },
  maxZoom: 17
};

const mapElem = document.getElementById('map');
const map = new mapboxgl.Map({
  container: 'map',
  maxBounds: settings.maxBounds.split(","),
  bounds: settings.initial.split(","),
  fitBoundsOptions: fitBoundsOpt,
  minZoom: 9,
  maxZoom: 19,
  style: 'mapbox://styles/breunigs/ckvvdvpy63v3j14n2vwo7sut0',
  pitchWithRotate: false,
  dragRotate: false,
  touchPitch: false,
  logoPosition: 'top-left',
  attributionControl: false,
  locale: {
    'GeolocateControl.FindMyLocation': 'Meine Position anzeigen',
    'GeolocateControl.LocationNotAvailable': 'Ortung nicht verfügbar',
  },
  // https://bugzilla.mozilla.org/show_bug.cgi?id=976173
  preserveDrawingBuffer: navigator.userAgent.indexOf("Gecko/") >= 1,
});
map.touchZoomRotate.disableRotation();
map.addControl(new mapboxgl.AttributionControl(), 'top-right');

const geocontrol = new mapboxgl.GeolocateControl({
  positionOptions: {
    enableHighAccuracy: true
  },
  // When active the map will receive updates to the device's location as it changes.
  trackUserLocation: true,
  // Draw an arrow next to the location dot to indicate which direction the device is heading.
  showUserHeading: false
});
geocontrol.on('error', () => window.plausible('geolocation-error'));
geocontrol.on('trackuserlocationstart', () => window.plausible('geolocation-trackuserlocationstart'));
map.addControl(geocontrol, 'bottom-left');

const routeLayers = ['vr-line-off-none', 'vr-line-off-p1', 'vr-line-off-m1', 'fr-line', 'rsw-line', 'extra-line'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = {
  layers: routeLayers.concat(articleLayers)
};

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
let videoWasPlaying = false;
let indicatorAnimateTimer = null;
let zoomedInOnce = false;
let indicatorFocus = null;
let prevIndicatorPos = {};

function renderIndicator() {
  const pos = getVideoPosition();
  if (!pos) return;
  if (pos.lat == prevIndicatorPos.lat &&
    pos.lon == prevIndicatorPos.lon &&
    pos.bearing == prevIndicatorPos.bearing) {
    return;
  }

  prevIndicatorPos = pos;

  const lngLat = new mapboxgl.LngLat(pos.lon, pos.lat);

  if (!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .setRotation(pos.bearing * 1)
      .addTo(map);
  }

  const mapActive = map.isMoving() || map.isZooming();
  const videoPlaying = isVideoPlaying();
  const dist = indicator.getLngLat().distanceTo(lngLat);
  const animate = !mapActive && dist < 50 && ((videoPlaying && videoWasPlaying) || dist < 10)

  // only update animation status as needed to avoid style recalculations
  if (animate != !!indicatorAnimateTimer) indicator.getElement().classList.toggle("animate", animate);
  if (indicatorAnimateTimer) {
    clearTimeout(indicatorAnimateTimer);
    indicatorAnimateTimer = null;
  }
  // NOTE: also update timeout in main.scss
  if (animate) indicatorAnimateTimer = setTimeout(disableIndicatorAnimation, 150);

  videoWasPlaying = videoPlaying;

  const shortest = closestEquivalentAngle(indicator.getRotation(), pos.bearing);
  indicator.setRotation(shortest);
  indicator.setLngLat(lngLat);

  // zoom in once, i.e. when user just clicks play when first visiting the site
  if (!mapActive && !zoomedInOnce && videoPlaying && map.getZoom() <= 13) {
    zoomedInOnce = true;
    withPreload("flyTo", lngLat);
    return;
  }

  ensureIndicatorInView(lngLat);
}

const withPreload = (action, lngLat) => {
  const opts = {
    center: lngLat,
    zoom: Math.max(map.getZoom(), 14),
  }

  map[action]({
    ...opts,
    preloadOnly: true
  });
  map[action](opts);
}

const closestEquivalentAngle = (from, to) => {
  if (to === null) return from;
  const delta = ((((to - from) % 360) + 540) % 360) - 180;
  return from + delta;
}

const disableIndicatorAnimation = () => {
  if (!indicator) return;
  indicator.getElement().classList.toggle("animate", false)
  if (!indicatorAnimateTimer) return;
  clearTimeout(indicatorAnimateTimer);
  indicatorAnimateTimer = null;
}

const ensureIndicatorInView = (lngLat) => {
  if (map.isMoving() || map.isZooming() || !indicator) {
    return;
  }

  if (map.getBounds().contains(lngLat)) return;

  const center = map.getCenter();
  const distDiag = center.distanceTo(map.getBounds().getNorthEast())
  const distIndi = center.distanceTo(lngLat);
  const isClose = distIndi <= 1.5 * distDiag;

  if (!isVideoPlaying()) {
    isClose
      ?
      withPreload("panTo", lngLat) :
      withPreload("flyTo", lngLat)
    return;
  }

  const prev = getVideoPosition(-4 * 1000);
  const next1 = getVideoPosition(10 * 1000);
  const next2 = getVideoPosition(15 * 1000);
  const bbox = new mapboxgl.LngLatBounds(lngLat, prev)
    .extend([next1.lon, next1.lat])
    .extend([next2.lon, next2.lat]);

  map.fitBounds(bbox, {
    linear: isClose,
    maxZoom: map.getZoom(),
  });
}

const isVideoPlaying = () => {
  return video && !video.paused && !video.ended;
}

let prevBoundsTs = "";
const maybeFitBounds = () => {
  if (prevBoundsTs == state.boundsTs || state.bounds == "") {
    return;
  }
  console.debug("Bounds have changed to", state.bounds)
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

let pingResetTimer = null;
let pingIndicator = null;
const pingHideDelaySeconds = 10;
const pingHideTransitionSeconds = 3;
const pingLayerDefaults = {
  'type': 'line',
  'source': 'ping',
  'layout': {
    'line-join': 'round',
    'line-cap': 'round'
  },
}
const pingLayerTransition = {
  'duration': pingHideTransitionSeconds * 1000,
  'delay': pingHideDelaySeconds * 1000,
}

window.addEventListener("map:ping", showPing);

function showPing(e) {
  hidePing();

  if (e.detail.polylines && e.detail.polylines.length > 0) {
    const geojson = {
      type: 'FeatureCollection',
      features: e.detail.polylines.map((pl, _idx) => polyline2geojson(pl, null))
    }
    console.log("ping: showing ", e.detail.polylines.length, "polylines")

    map.addSource('ping', {
      'type': 'geojson',
      'data': geojson
    });
    map.addLayer(Object.assign({
      'id': 'ping-fg',
      'paint': {
        'line-color': '#F47474',
        'line-opacity-transition': pingLayerTransition,
        'line-width': 2,
        'line-dasharray': [2, 3],
      }
    }, pingLayerDefaults), "road-label");
    map.addLayer(Object.assign({
      'id': 'bing-bg',
      'paint': {
        'line-color': 'rgba(255,255,255,0.9)',
        'line-opacity-transition': pingLayerTransition,
        'line-width': 8,
        'line-blur': 2,
      }
    }, pingLayerDefaults), "ping-fg");
    map.setPaintProperty('ping-fg', 'line-opacity', 0.0)
    map.setPaintProperty('bing-bg', 'line-opacity', 0.0)
  } else if (e.detail.center) {
    const center = e.detail.center;
    const lngLat = new mapboxgl.LngLat(center.lon, center.lat);
    console.log("ping: setting marker @", center)

    pingIndicator = new mapboxgl.Marker(genDiv('ping-indicator'))
      .setLngLat(lngLat)
      .addTo(map);
    window.pingIndicator = pingIndicator;
    // can't be in the same frame, else it'll be hidden instantly
    setTimeout(() => pingIndicator.getElement().style.opacity = '0', 20)
  }
  pingResetTimer = setTimeout(hidePing, (pingHideTransitionSeconds + pingHideDelaySeconds) * 1000);
}

function hidePing() {
  if (pingResetTimer) clearTimeout(pingResetTimer)
  pingResetTimer = null;
  console.log("ping: hiding")

  if (map.getLayer('ping-fg')) map.removeLayer('ping-fg');
  if (map.getLayer('bing-bg')) map.removeLayer('bing-bg');
  if (map.getSource('ping')) map.removeSource('ping');
  if (pingIndicator) pingIndicator.remove();
}

const titleForItem = (item) => {
  const props = item.properties;
  if (props.title) return props.title
  if (props.route_group) return `${props.route_group} ${props.route_id}`
  return null
}

const handleMapHover = (evt) => {
  const items = itemsUnderCursor(evt);
  const canvas = map.getCanvas()

  const titles = items.map(item => titleForItem(item)).filter(item => item)
  if (titles.length === 0) {
    canvas.style.cursor = '';
    canvas.title = '';
    return;
  }

  canvas.style.cursor = 'pointer';
  canvas.title = [...new Set(titles)].join("\n")
}

const handleMapClick = (evt) => {
  const items = itemsUnderCursor(evt);

  let route = null;
  let article = null;
  items.forEach(r => {
    if (r.properties.route_id && routeLayers.includes(r.layer.id)) {
      route = route || r.properties.route_id;
    } else if (r.properties.name && (routeLayers + articleLayers).includes(r.layer.id)) {
      article = article || r.properties.name;
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

let boundsTimeout = null;
const sendBounds = () => {
  if (boundsTimeout) clearTimeout(boundsTimeout);
  boundsTimeout = setTimeout(() => {
    window.pushEvent("map-bounds", {
      bounds: map.getBounds().toArray()
    });
  }, 200);
}

const layerConfig = {
  alltag: {
    line: ['vr-line-off-p1', 'vr-line-off-m1', 'vr-line-off-none'],
    icon: ['vr-oneway', 'vr-sign']
  },

  freizeit: {
    line: ['fr-line'],
    icon: ['fr-oneway', 'fr-sign', 'fr-warning-icons']
  },

  rsw: {
    line: ['rsw-line']
  }
}

// hard codes only, everything else will be optimized for nice display
// depending on opacity status
const layerLineCaps = {
  'vr-line-off-p1': 'butt',
  'vr-line-off-m1': 'butt'
}

const layerAbove = {
  line: "detour-line",
  icon: "article-areas title"
}

const hiddenOpacityRule = ["interpolate", ["linear"],
  ["zoom"], 11, 0, 20, 1
];

function setLayerVisibility() {
  const visibleTypes = state.visibleTypes.split(",");
  Object.keys(layerConfig).forEach(type => {
    const visibleType = visibleTypes.indexOf(type) >= 0;
    const opacity = visibleType ? 1 : hiddenOpacityRule;

    const layers = layerConfig[type];
    Object.keys(layers).forEach(drawPrimitive => {
      layers[drawPrimitive].forEach(layerName => {
        const visible = visibleType || drawPrimitive == 'line' ? 'visible' : 'none';
        map.setLayoutProperty(layerName, "visibility", visible, {
          validate: false
        });

        map.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
          validate: false
        });

        if (drawPrimitive == 'line') {
          const lineCap = layerLineCaps[layerName] || (visibleType ? "round" : "butt");
          map.setLayoutProperty(layerName, "line-cap", lineCap, {
            validate: false
          })
        }

        if (visibleType && drawPrimitive == 'line' && layerName.indexOf('line') >= 0) {
          // console.log("moving", layerName, "above", layerAbove[drawPrimitive])
          map.moveLayer(layerName, layerAbove[drawPrimitive]);
        }

      }); // layers
    }); // drawPrimitives
  }); // layerConfig
}

let mapLoaded = false;
map.on('style.load', () => {
  mapLoaded = true;
  runQueuedUpdate();

  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);

  map.on('movestart', disableIndicatorAnimation);
  map.on('zoomstart', disableIndicatorAnimation);

  // for some reason click events don't fire on iOS and potentially other touch
  // devices
  let simulateClick = false;
  map.on('touchstart', () => simulateClick = true);
  map.on('touchmove', () => simulateClick = false);
  map.on('touchend', (evt) => {
    if (simulateClick) handleMapClick(evt);
  });
});

let indicatorPolyline = null;
window.addEventListener("phx:video_polyline", e => {
  console.log("updating video polyline")
  const decoded = polyline2geojson(e.detail.polyline, e.detail.precision);
  indicatorPolyline = {
    coords: decoded.geometry.coordinates,
    interval: e.detail.interval,
    eps: 10 ** (-e.detail.precision),
  }
})

function toRad(degrees) {
  return degrees * Math.PI / 180;
};

function ToDeg(radians) {
  return radians * 180 / Math.PI;
}

function calcBearing(fromLon, fromLat, toLon, toLat) {
  fromLon = toRad(fromLon);
  fromLat = toRad(fromLat);
  toLon = toRad(toLon);
  toLat = toRad(toLat);

  const y = Math.sin(toLon - fromLon) * Math.cos(toLat);
  const x = Math.cos(fromLat) * Math.sin(toLat) -
    Math.sin(fromLat) * Math.cos(toLat) * Math.cos(toLon - fromLon);
  const bearing = Math.atan2(y, x);
  return ToDeg(bearing);
}

function getVideoPosition(timeAdjustMs) {
  if (!indicatorPolyline) return;
  const videoLoaded = video && state.videoHash && (typeof video.duration) === "number" && video.readyState >= 2;
  let currMs = videoLoaded ? video.currentTime * 1000 + 250 : state.videoStart * 1;
  if (timeAdjustMs) currMs = Math.max(0, currMs + timeAdjustMs);

  const index = indicatorIndexBounds(Math.floor(currMs / indicatorPolyline.interval));
  let lon1;
  let lat1;
  try {
    [lon1, lat1] = indicatorPolyline.coords[index];
  } catch (e) {
    debugger;
  }

  // Look 100ms in the future to calculate a bearing that is not too affected by
  // precision/rounding errors.
  let next = indicatorIndexBounds(index + Math.round(100 / indicatorPolyline.interval));
  let [lon2, lat2] = indicatorPolyline.coords[next];

  // If both points are close to each other, look 1s further
  let close = veryClose(lon1, lat1, lon2, lat2);
  if (close) {
    next += Math.round(1000 / indicatorPolyline.interval)
    next = indicatorIndexBounds(next);
    [lon2, lat2] = indicatorPolyline.coords[next];
    close = veryClose(lon1, lat1, lon2, lat2);
  }

  // If they are still close, we give up and re-use the previous position
  const bearing = close ? null : calcBearing(lon1, lat1, lon2, lat2)

  return {
    lon: lon1,
    lat: lat1,
    bearing: bearing
  };
}

function indicatorIndexBounds(index) {
  if (index <= 0) return 0;
  return Math.min(index, indicatorPolyline.coords.length - 1);
}

// veryClose returns true when the two coordinates only differ in their least
// significant digit, determined from the indicatorPolyline precision.
function veryClose(lon1, lat1, lon2, lat2) {
  const close = indicatorPolyline.eps * 10;
  return Math.abs(lon1 - lon2) < close && Math.abs(lat1 - lat2) < close
}

// algorithm specification: https://developers.google.com/maps/documentation/utilities/polylinealgorithm
function polyline2geojson(str, precision) {
  const factor = 10 ** (precision || 6);

  let index = 0;
  let lat = 0;
  let lon = 0;
  let coordinates = [];

  while (index < str.length) {
    let byte;
    let shift = 0;
    let val = 0;

    do {
      byte = str.charCodeAt(index++) - 63;
      val |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20);

    lat += ((val & 1) ? ~(val >> 1) : (val >> 1));

    shift = val = 0;

    do {
      byte = str.charCodeAt(index++) - 63;
      val |= (byte & 0x1f) << shift;
      shift += 5;
    } while (byte >= 0x20);

    lon += ((val & 1) ? ~(val >> 1) : (val >> 1));

    coordinates.push([lon / factor, lat / factor]);
  }

  return {
    type: 'Feature',
    "properties": {},
    geometry: {
      type: 'LineString',
      coordinates: coordinates
    }
  };
}

window.map = map;

let speculativeIndicator = 0;
window.addEventListener("video:timeupdate", () => {
  speculativeIndicator = 25;
  updateVideoIndicator();
});

let videoIndicatorRAF = false;

function updateVideoIndicator() {
  if (!videoIndicatorRAF) {
    window.requestAnimationFrame(updateVideoIndicator);
    videoIndicatorRAF = true
    return
  }

  renderIndicator();

  if (speculativeIndicator-- > 0) {
    window.requestAnimationFrame(updateVideoIndicator);
  } else {
    videoIndicatorRAF = false
  }
}

function runQueuedUpdate() {
  queued = false;
  maybeFitBounds();
  renderIndicator();
  setLayerVisibility();
}

let queued = false;
window.mapStateChanged = () => {
  if (queued) return;
  queued = true;
  // it will automatically be run once the map loads
  if (!mapLoaded) return;
  window.requestIdleCallback(runQueuedUpdate, {
    timeout: 100
  })
}
