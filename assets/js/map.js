import {
  maybeSwitchStyle,
  maybeToggleLayers
} from "./map_layer_toggler";

if (!window.requestIdleCallback) {
  window.requestIdleCallback = function (x) {
    window.setTimeout(x, 0);
  }
}

const video = document.getElementById('videoInner');
const settings = window.document.currentScript.dataset;

// keep in sync with basemap/constants.ex
const fitBoundsOpt = {
  maxZoom: 17
};


let mapConfig = {}
window.addEventListener("phx:map", e => {
  console.debug("updating map config", e.detail)
  Object.assign(mapConfig, e.detail)
  maybeSwitchStyle(map, mapConfig)
  maybeToggleLayers(map, mapConfig)
});

// TODO: move to settings.ex
const routeLayers = [
  'vr-line-off-none', 'vr-line-off-none-tunnel',
  'vr-line-off-p1', 'vr-line-off-p1-tunnel',
  'vr-line-off-m1', 'vr-line-off-m1-tunnel',
  'br-line-off-none', 'br-line-off-none-tunnel',
  'br-line-off-p1', 'br-line-off-p1-tunnel',
  'br-line-off-m1', 'br-line-off-m1-tunnel',
  'fr-line', 'fr-line-tunnel',
  'rsw-line', 'rsw-line-tunnel',
  'extra-line'
];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = {
  layers: routeLayers.concat(articleLayers),
  validate: false,
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
let prevIndicatorPos = {};

function hidePreview(evt) {
  const [lon, lat, zoom] = settings.initial.split(",")
  if (evt.type === "zoom" && (zoom * 1) === map.getZoom()) return;

  if (evt.type === "move") {
    const c = map.getCenter();
    const maxDiff = 0.000001;
    const diffLon = Math.abs(c.lng - lon);
    const diffLat = Math.abs(c.lat - lat);
    if (diffLon < maxDiff && diffLat < maxDiff) return;
  }

  map.off('idle', hidePreview)
  map.off('move', hidePreview)
  map.off('zoom', hidePreview)

  const elem = document.getElementById("mapPreview");
  if (!elem) return

  const img = elem.getElementsByTagName("img")[0];
  if (!img) return elem.remove();

  img.style.opacity = 0;
  // keep in sync with main.css
  setTimeout(() => elem.remove(), 150);
}

function renderIndicator() {
  const pos = getVideoPosition();
  if (!pos) return;
  if (pos.lat == prevIndicatorPos.lat &&
    pos.lon == prevIndicatorPos.lon &&
    pos.bearing == prevIndicatorPos.bearing) {
    return;
  }

  prevIndicatorPos = pos;

  const lngLat = new mlgl.LngLat(pos.lon, pos.lat);
  const firstRender = !indicator;

  if (firstRender) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mlgl.Marker({ element: el })
      .setLngLat(lngLat)
      .setRotation(pos.bearing * 1)

    requestAnimationFrame(() => {
      indicator.addTo(map);
      requestAnimationFrame(() => el.style.opacity = 1);
    })
  }

  const mapActive = map.isMoving() || map.isZooming();
  const videoPlaying = isVideoPlaying();
  const dist = indicator.getLngLat().distanceTo(lngLat);
  const animate = !mapActive && dist < 50 && ((videoPlaying && videoWasPlaying) || dist < 10)
  indicator.getElement().classList.toggle("animate", animate);

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
    map.flyTo({
      center: lngLat,
      zoom: Math.max(map.getZoom(), 14),
    });
    return;
  }

  if (!firstRender) ensureIndicatorInView(lngLat);
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

  if (!isVideoPlaying() || !indicatorPolyline) {
    isClose
      ? map.panTo(lngLat)
      : map.flyTo({
        center: lngLat,
        zoom: Math.max(map.getZoom(), 14),
      });
    return;
  }

  let bbox = new mlgl.LngLatBounds(lngLat, lngLat)

  const minMs = videoTimeInMs - 4 * 1000
  const maxMs = videoTimeInMs + 15 * 1000

  const minIndex = indicatorIndexBounds(Math.floor(minMs / indicatorPolyline.interval));
  const maxIndex = indicatorIndexBounds(Math.floor(maxMs / indicatorPolyline.interval));

  for (let i = minIndex; i <= maxIndex; i++) {
    bbox.extend(indicatorPolyline.coords[i])
  }

  map.fitBounds(bbox, {
    linear: isClose,
    maxZoom: map.getZoom(),
  });
}

const isVideoPlaying = () => {
  return video && !video.paused && !video.ended;
}

window.addEventListener(`phx:bounds:adjust`, (e) => {
  console.debug("adjusting bounds to", e.detail)
  map.fitBounds(e.detail, fitBoundsOpt);
})

const preloadAbortCtrl = new AbortController();
const preloadAbortSignal = preloadAbortCtrl.signal;
window.addEventListener(`phx:map:preload:tile`, (e) => {
  preloadAbortCtrl.abort();
  fetch(e.detail.url, { preloadAbortSignal })
  if (e.detail.low_prio_url) fetch(e.detail.low_prio_url, { preloadAbortSignal, priority: 'low' })
})

const featureOpacity = (feature) => {
  const paint = feature.layer.paint
  if (typeof paint['line-opacity'] != "undefined") return paint['line-opacity']
  if (typeof paint['fill-opacity'] != "undefined") return paint['fill-opacity']
  return 1
}

const clickLeniency = 'ontouchstart' in window ? 10 : 3;
const itemsUnderCursor = (evt) => {
  if (!map.isStyleLoaded()) return []
  let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
  routes = routes.filter(r => featureOpacity(r) >= 0.15);
  // be more lenient with click targets
  if (!routes.length) {
    const sw = [evt.point.x - clickLeniency, evt.point.y + clickLeniency];
    const ne = [evt.point.x + clickLeniency, evt.point.y - clickLeniency];
    routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
  }
  return routes.filter(r => featureOpacity(r) >= 0.15);
}

let pingResetTimer = null;
let pingFadeTimer = null;
let pingIndicator = null;
const pingHideDelaySeconds = 10;
const pingHideTransitionSeconds = 3;
const pingLayers = new Map([
  ['ping-articles', 'title'],
  ['ping-articles-bg', 'title'],
  ['ping-street', 'name'],
  ['ping-street-bg', 'name']
])

window.addEventListener("map:ping", pingShow);

function pingShow(e) {
  if (pingFadeTimer) clearTimeout(pingFadeTimer)
  if (pingResetTimer) clearTimeout(pingResetTimer)
  pingCleanup();

  if (e.detail.name) {
    for (const [layer, field] of pingLayers) {
      const filter = ['in', ['get', field], ["literal", e.detail.name.split(/,\s*| und |\s*\/\s*/)]];
      map.setFilter(layer, filter)
      map.setLayoutProperty(layer, 'visibility', 'visible')
      map.setPaintProperty(layer, 'line-opacity-transition', {})
      map.setPaintProperty(layer, 'line-opacity', 1.0)
    }
  }

  if (e.detail.center) {
    const center = e.detail.center;
    const lngLat = new mlgl.LngLat(center.lon, center.lat)
    pingIndicator = new mlgl.Marker(genDiv('ping-indicator'))
      .setLngLat(lngLat)
      .addTo(map);
  }

  pingFadeTimer = setTimeout(pingFadeout, pingHideDelaySeconds * 1000)
  pingResetTimer = setTimeout(pingCleanup, (pingHideDelaySeconds + pingHideTransitionSeconds) * 1000)
}

function pingFadeout() {
  if (pingIndicator) pingIndicator.getElement().style.opacity = '0'
  for (const [layer, field] of pingLayers) {
    map.setPaintProperty(layer, 'line-opacity-transition', {
      'duration': pingHideTransitionSeconds * 1000,
    })
    map.setPaintProperty(layer, 'line-opacity', 0)
  }
}

function pingCleanup() {
  if (pingIndicator) {
    pingIndicator.remove()
    pingIndicator = null
  }
  for (const [layer, field] of pingLayers) {
    map.setLayoutProperty(layer, 'visibility', 'none')
  }
}

const titleForItem = (item) => {
  const props = item.properties;
  if (props.title) return props.title.split("\n")
  if (props.route_group) return `${props.route_group} ${props.route_id}`
  return null
}

const handleMapHover = (evt) => {
  const items = itemsUnderCursor(evt);
  const canvas = map.getCanvas()

  const titles = items.flatMap(item => titleForItem(item)).filter(item => item)
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

  let routes = [];
  let article = null;
  items.forEach(r => {
    if (r.properties.route_id && routeLayers.includes(r.layer.id)) {
      routes.push(r.properties.route_id)
    } else if (r.properties.name && (routeLayers + articleLayers).includes(r.layer.id)) {
      article = article || r.properties.name;
    }
  });

  if (routes.length === 0 && article === null) return;

  window.pushEvent("map-click", {
    route: routes,
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
    if (map.isMoving() || map.isZooming()) return sendBounds();

    window.pushEvent("map-bounds", {
      bounds: map.getBounds().toArray()
    });
  }, 200);
}

let indicatorPolyline = null

window.addEventListener("phx:video_meta", e => {
  updateIndicatorPolyline(e.detail.polyline)
});

let highlightsAppliedToStyle = ""
let highlightsTimeout = null

function styleChangedHandler() {
  // Applying the modifications on a partially loaded style might not work. We
  // don't always get an event with the style fully loaded, so retry this way.
  if (highlightsTimeout) clearTimeout(highlightsTimeout)
  if (!map.isStyleLoaded()) setTimeout(styleChangedHandler, 50)

  const currStyleName = map.getStyle().name
  if (highlightsAppliedToStyle == currStyleName) return
  highlightsAppliedToStyle = currStyleName

  maybeToggleLayers(map, mapConfig)
}

function updateIndicatorPolyline(data) {
  if (!data) return

  console.debug("updating video polyline")
  const decoded = polyline2geojson(data.polyline, data.precision);
  indicatorPolyline = {
    coords: decoded.geometry.coordinates,
    interval: data.interval,
    eps: 10 ** (-data.precision),
  }

  // videoPathDebug render
  // const videoLayerDefaults = {
  //   'type': 'line',
  //   'source': 'video',
  //   'layout': {
  //     'line-join': 'round',
  //     'line-cap': 'round'
  //   },
  // }
  // const source = map.getSource('video');
  // if (source) {
  //   source.setData(decoded)
  //   return
  // }

  // map.addSource('video', {
  //   'type': 'geojson',
  //   'data': decoded
  // });

  // map.addLayer(Object.assign({
  //   'id': 'video-fg',
  //   'paint': {
  //     'line-color': '#000',
  //     'line-width': 0.5,
  //   }
  // }, videoLayerDefaults), "road-label");
  // map.addLayer(Object.assign({
  //   'id': 'video-bg',
  //   'paint': {
  //     'line-color': '#fff',
  //     'line-width': 2,
  //     'line-blur': 0,
  //   }
  // }, videoLayerDefaults), "video-fg");
}

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

function getVideoPosition() {
  if (!indicatorPolyline) return;
  let currMs = videoTimeInMs

  const index = indicatorIndexBounds(Math.floor(currMs / indicatorPolyline.interval));
  let lon1;
  let lat1;
  try {
    [lon1, lat1] = indicatorPolyline.coords[index];
  } catch (e) {
    debugger;
    return;
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

// for some reason click events don't fire on iOS and potentially other touch
// devices
let simulateClick = false;

function setupTouchDeviceClick() {
  map.on('touchstart', () => simulateClick = true);
  map.on('touchmove', () => simulateClick = false);
  map.on('touchend', (evt) => {
    if (simulateClick) handleMapClick(evt);
  });

  map.on('idle', hidePreview);
  map.on('move', hidePreview);
  map.on('zoom', hidePreview);
}

let map = null;

function setup() {
  if (map) {
    const realMapContainer = map.getContainer()
    const pageMapContainer = document.getElementById("map")
    if (realMapContainer === pageMapContainer) return
    console.warn("previous map present, but it got removed from DOM")
    window.plausible('mapReset')
    pageMapContainer.parentNode.replaceChild(realMapContainer, pageMapContainer);
    return
  }

  let style = document.getElementById('map').dataset.style
  console.log("map: loading style", style)
  const initial = settings.initial.split(",")

  map = new mlgl.Map({
    container: 'map',
    maxBounds: settings.maxBounds.split(","),
    center: initial.slice(0, 2),
    zoom: initial[2],
    fitBoundsOptions: fitBoundsOpt,
    // keep in sync with basemap/constants.ex
    minZoom: 9,
    maxZoom: 19,
    style: style,
    pitchWithRotate: false,
    dragRotate: false,
    touchPitch: false,
    logoPosition: 'top-left',
    attributionControl: false,
    validateStyle: false,
  });
  map.touchZoomRotate.disableRotation();
  map.addControl(new mlgl.AttributionControl(), 'top-right');

  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);

  map.on('movestart', disableIndicatorAnimation);
  map.on('zoomstart', disableIndicatorAnimation);

  map.on('style.load', styleChangedHandler)
  map.on('styledata', styleChangedHandler)

  setupTouchDeviceClick()

  window.map = map;
}

setup()
window.addEventListener("global:mounted", setup)

let videoTimeInMs = 0;
window.addEventListener("video:timeupdate", (e) => {
  videoTimeInMs = e.detail.timeInMs;
  renderIndicator();
});
