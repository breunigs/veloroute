import {
  maybeSwitchStyle,
  maybeToggleLayers
} from "./map_layer_toggler";

import "./map_image_stub"

if (!window.requestIdleCallback) window.requestIdleCallback = function (callback, _options) {
  window.setTimeout(callback, 40)
}

const video = document.getElementById('videoInner');
const settings = window.document.currentScript.dataset;

// keep in sync with basemap/constants.ex
const flyToSpeed = 0.7
const fitBoundsOpt = {
  maxZoom: 17,
  speed: flyToSpeed,
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
  'rr-line-off-none', 'rr-line-off-none-tunnel',
  'rr-line-off-p1', 'rr-line-off-p1-tunnel',
  'rr-line-off-m1', 'rr-line-off-m1-tunnel',
  'rr-line-off-none-concept', 'rr-line-off-none-concept-tunnel',
  'vr-line-off-none', 'vr-line-off-none-tunnel',
  'vr-line-off-p1', 'vr-line-off-p1-tunnel',
  'vr-line-off-m1', 'vr-line-off-m1-tunnel',
  'br-line-off-none', 'br-line-off-none-concept', 'br-line-off-none-tunnel',
  'br-line-off-p1', 'br-line-off-p1-tunnel',
  'br-line-off-m1', 'br-line-off-m1-tunnel',
  'fr-line', 'fr-line-tunnel',
  'extra-line'
];
const articleLayers = ['article-areas title', 'article-areas bg', 'appointments'];
const clickableSource = 'merged'
const clickableLayers = {
  layers: routeLayers.concat(articleLayers),
  validate: false,
  filter: [
    ">=",
    [
      "coalesce",
      ["get", "line-opacity"],
      ["get", "fill-opacity"],
      1
    ],
    0.15
  ]
};

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
let videoWasPlaying = false;
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

function createIndicator(targetPos) {
  const element = document.getElementById("indicator")

  indicator = new mlgl.Marker({ element: element })
    .setLngLat(targetPos)
    .setRotation(targetPos.bearing * 1)
    .setPitchAlignment("map")
    .setRotationAlignment("map")
    .setSubpixelPositioning(true)

  requestAnimationFrame(() => {
    indicator.addTo(map)
    requestAnimationFrame(() => element.style.filter = `opacity(1)`)
  })

  prevIndicatorPos = targetPos
}

function zoomInOnce() {
  if (zoomedInOnce) return false;
  if (!isVideoPlaying()) return false;
  if (map.getZoom() > 13) return false;
  if (map.isMoving()) return false;

  zoomedInOnce = true;

  map.flyTo({
    center: indicator.getLngLat(),
    zoom: Math.max(map.getZoom(), 14),
    speed: flyToSpeed,
  })

  return true
}

let renderIndicatorAnimation = null;
async function renderIndicator() {
  const targetPos = await getVideoPosition()
  if (!targetPos) return

  if (!indicator) return createIndicator(targetPos)

  if (targetPos.lat == prevIndicatorPos.lat &&
    targetPos.lon == prevIndicatorPos.lon &&
    targetPos.bearing == prevIndicatorPos.bearing) {
    return
  }

  // zoom in once, i.e. when user just clicks play when first visiting the site
  if (zoomInOnce()) return
  // otherwise show the indicator at whatever zoom level
  ensureIndicatorInViewIdle ||= window.requestIdleCallback(ensureIndicatorInView, { timeout: 1000 });

  const videoPlaying = isVideoPlaying();
  const lngLat = new mlgl.LngLat(targetPos.lon, targetPos.lat)
  const dist = indicator.getLngLat().distanceTo(lngLat)
  const animate = dist < 15 || (dist < 50 && videoPlaying && videoWasPlaying)
  videoWasPlaying = videoPlaying

  const animationDuration = 150
  const startPos = prevIndicatorPos
  const bearingDelta = closestEquivalentAngleDelta(prevIndicatorPos, targetPos)

  const startTime = document.timeline.currentTime
  function animateIndicator(timestamp) {
    const ratio = Math.min(1, (timestamp - startTime) / animationDuration)

    const lon = startPos.lon * (1 - ratio) + targetPos.lon * ratio
    const lat = startPos.lat * (1 - ratio) + targetPos.lat * ratio
    const bearing = startPos.bearing + bearingDelta * ratio;

    // save one call to _update()
    // indicator.setRotation(bearing);
    indicator._rotation = bearing;
    indicator.setLngLat(new mlgl.LngLat(lon, lat));

    prevIndicatorPos = { lat, lon, bearing }

    if (ratio < 1) renderIndicatorAnimation = requestAnimationFrame(animateIndicator)
  }

  cancelAnimationFrame(renderIndicatorAnimation)
  if (animate) {
    renderIndicatorAnimation = requestAnimationFrame(animateIndicator)
  } else {
    animateIndicator(startTime + animationDuration)
  }
}

const closestEquivalentAngleDelta = (from, to) => {
  if (to.bearing === null) return 0;
  return ((((to.bearing - from.bearing) % 360) + 540) % 360) - 180;
}

let ensureIndicatorInViewIdle = null
const ensureIndicatorInView = async () => {
  ensureIndicatorInViewIdle = null
  if (map.isMoving() || !indicator) {
    return;
  }

  const lngLat = indicator.getLngLat();
  const padding = 30; // pixels
  const point = map.project(indicator.getLngLat());

  const canvas = map.getCanvas();
  const width = canvas.clientWidth;
  const height = canvas.clientHeight;

  const inside = point.x >= padding && point.x <= width - padding
    && point.y >= padding && point.y <= height - padding;

  if (inside) return

  const center = map.getCenter();
  const distDiag = center.distanceTo(map.getBounds().getNorthEast())
  const distIndi = center.distanceTo(lngLat);
  const isClose = distIndi <= 1.5 * distDiag;
  const indicatorPolyline = await indicatorPolylinePromise

  if (!isVideoPlaying() || !indicatorPolyline) {
    isClose
      ? map.panTo(lngLat)
      : map.flyTo({
        center: lngLat,
        zoom: Math.max(map.getZoom(), 14),
        speed: flyToSpeed,
      });
    return;
  }

  let bbox = new mlgl.LngLatBounds(lngLat, lngLat)

  const minMs = videoTimeInMs - 4 * 1000
  const maxMs = videoTimeInMs + 15 * 1000

  const minIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(minMs / indicatorPolyline.interval) * 2);
  const maxIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(maxMs / indicatorPolyline.interval) * 2);

  for (let i = minIndex; i <= maxIndex; i += 10) {
    bbox.extend(indicatorPolyline.coords.subarray(i, i + 2))
  }

  map.fitBounds(bbox, {
    linear: isClose,
    maxZoom: map.getZoom(),
    speed: flyToSpeed,
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

const uniqueByProperties = (arr) => {
  const properties = ['route_id', 'route_group', 'title', 'name']
  const indexed = arr.map((item) => {
    const values = properties.map((prop) => item.properties[prop])
    return [values.join(" "), item]
  })

  return [...new Map(indexed).values()];
};

const clickLeniency = 'ontouchstart' in window ? 10 : 3;
const itemsUnderCursor = (evt) => {
  if (!map.getSource(clickableSource)?.loaded()) return []

  // be lenient with click targets at first
  const sw = [evt.point.x - clickLeniency, evt.point.y + clickLeniency];
  const ne = [evt.point.x + clickLeniency, evt.point.y - clickLeniency];
  let routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
  routes = uniqueByProperties(routes)

  // but become strict if more than one matches
  if (routes.length > 1) {
    let routesStrict = map.queryRenderedFeatures(evt.point, clickableLayers);
    if (routesStrict >= 1) routes = uniqueByProperties(routesStrict)
  }

  return routes
}

let pingResetTimer = null;
let pingFadeTimer = null;
let pingIndicator = null;
const pingHideDelaySeconds = 10;
const pingHideTransitionSeconds = 3;
const pingLayers = new Map([
  ['ping-articles', ['title', false]],
  ['ping-articles-bg', ['title', false]],
  ['ping-street', ['name', false]],
  ['ping-street-bg', ['name', false]],
  ['ping-boundary', ['name', true]],
  ['ping-boundary-bg', ['name', true]],
])

window.addEventListener("map:ping", pingShow);

function pingShow(e) {
  if (pingFadeTimer) clearTimeout(pingFadeTimer)
  if (pingResetTimer) clearTimeout(pingResetTimer)
  pingCleanup();

  if ("name" in e.detail) {
    const source = e.detail.name || e.target.innerText
    const names = source.split(/,\s*| & | und |\s*\/\s*/)
    for (const [layer, [field, substrSearch]] of pingLayers) {
      const filterExact = ['in', ['get', field], ["literal", names]]
      const filterSubstr = [
        "any",
        ...names.map(name => ['in', `|${name}|`, ['get', field]])
      ]
      const filter = substrSearch ? filterSubstr : filterExact
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

const collator = new Intl.Collator('de', { numeric: true, sensitivity: 'base' })

let mapHoverRAF = null
let mapHoverEvt = null
const handleMapHover = (evt) => {
  mapHoverEvt = evt

  mapHoverRAF ||= requestAnimationFrame(() => {
    mapHoverRAF = null

    const items = itemsUnderCursor(mapHoverEvt);
    const canvas = map.getCanvas()

    const titles = items.flatMap(item => titleForItem(item)).filter(item => item)
    if (titles.length === 0) {
      canvas.style.cursor = '';
      canvas.title = '';
      return;
    }

    canvas.style.cursor = 'pointer';
    canvas.title = [...new Set(titles)].sort(collator.compare).join("\n")
  })
}

const handleMapClick = (evt) => {
  const items = itemsUnderCursor(evt);

  let routes = [];
  let article = null;
  items.forEach(r => {
    if (r.properties.route_id && routeLayers.includes(r.layer.id)) {
      routes.push(r.properties.route_id)
    } else if (r.properties.name && (routeLayers + articleLayers).includes(r.layer.id)) {
      article ||= r.properties.name;
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
    if (map.isMoving()) return sendBounds();

    window.pushEvent("map-bounds", {
      bounds: map.getBounds().toArray()
    });
  }, 200);
}

let indicatorPolylinePromise = Promise.resolve(null);

window.addEventListener("phx:video_meta", e => {
  updateIndicatorPolyline(e.detail.polyline)
});

// keep in sync with settings.exs map_styles
let highlightsAppliedToStyle = "Standard"
function styleChangedHandler() {
  // Applying the modifications on a partially loaded style might not work. We
  // don't always get an event with the style fully loaded, so retry this way.
  if (!map.isStyleLoaded()) setTimeout(styleChangedHandler, 50)

  // avoid a needless clone
  // const currStyleName = map.getStyle().name
  const currStyleName = map.style.stylesheet.name
  if (highlightsAppliedToStyle == currStyleName) return
  highlightsAppliedToStyle = currStyleName

  maybeToggleLayers(map, mapConfig)
}

function updateIndicatorPolyline(data) {
  if (!data) return

  indicatorPolylinePromise = new Promise((resolve, _reject) => {
    setTimeout(() => {
      console.debug("updating video polyline")
      resolve({
        coords: polyline2coords(data.polyline, data.precision),
        interval: data.interval,
        eps: 10 ** (-data.precision),
      })
    }, 0)
  })
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

async function getVideoPosition() {
  const indicatorPolyline = await indicatorPolylinePromise

  if (!indicatorPolyline) return;
  let currMs = videoTimeInMs

  const index = indicatorIndexBounds(
    indicatorPolyline,
    Math.floor(currMs / indicatorPolyline.interval) * 2
  );
  let lon1;
  let lat1;
  try {
    lon1 = indicatorPolyline.coords[index]
    lat1 = indicatorPolyline.coords[index + 1]
  } catch (e) {
    debugger;
    return;
  }

  // Look 100ms in the future to calculate a bearing that is not too affected by
  // precision/rounding errors.
  let next = indicatorIndexBounds(
    indicatorPolyline,
    index + Math.round(100 / indicatorPolyline.interval) * 2
  );
  let lon2 = indicatorPolyline.coords[next]
  let lat2 = indicatorPolyline.coords[next + 1]

  // If both points are close to each other, look 1s further
  let close = veryClose(indicatorPolyline, lon1, lat1, lon2, lat2);
  if (close) {
    next += Math.round(1000 / indicatorPolyline.interval) * 2
    next = indicatorIndexBounds(
      indicatorPolyline,
      next
    );
    lon2 = indicatorPolyline.coords[next]
    lat2 = indicatorPolyline.coords[next + 1]
    close = veryClose(indicatorPolyline, lon1, lat1, lon2, lat2);
  }

  // If they are still close, we give up and re-use the previous position
  const bearing = close ? null : calcBearing(lon1, lat1, lon2, lat2)

  return {
    lon: lon1,
    lat: lat1,
    bearing: bearing
  };
}

function indicatorIndexBounds(indicatorPolyline, index) {
  if (index <= 0) return 0;
  return Math.min(index, indicatorPolyline.coords.length - 2);
}

// veryClose returns true when the two coordinates only differ in their least
// significant digit, determined from the indicatorPolyline precision.
function veryClose(indicatorPolyline, lon1, lat1, lon2, lat2) {
  const close = indicatorPolyline.eps * 10;
  return Math.abs(lon1 - lon2) < close && Math.abs(lat1 - lat2) < close
}

// algorithm specification: https://developers.google.com/maps/documentation/utilities/polylinealgorithm
function polyline2coords(str, precision) {
  const factor = 10 ** (precision || 6);

  let index = 0;
  let coordIndex = 0;
  let lat = 0;
  let lon = 0;
  const len = str.length
  let coordinates = new Float32Array(Math.floor(len / 2) * 2);

  let byte, shift, val;
  while (index < len) {
    shift = val = 0;

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

    coordinates[coordIndex++] = lon / factor;
    coordinates[coordIndex++] = lat / factor;

    if (coordIndex + 1 >= coordinates.length) {
      console.warn("had to double coord buffer")
      const newCoords = new Float64Array(coordinates.length * 2);
      newCoords.set(coordinates);
      coordinates = newCoords;
    }
  }

  // remove any over allocated entries
  return coordinates.subarray(0, coordIndex);
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

  const mapElement = document.getElementById('map')

  // iOS sometimes sets up the map as if the styles haven't loaded yet. Force a
  // resize if this happens as soon as any container gets styled properly.
  if (mapElement.clientHeight <= 25) {
    const resizeObserver = new ResizeObserver((entries) => {
      resizeObserver.disconnect()
      map.resize()
      map.jumpTo({
        center: initial.slice(0, 2),
        zoom: initial[2],
      })
    })
    resizeObserver.observe(document.querySelector('body'))
    resizeObserver.observe(document.querySelector('#mapOuter'))
    resizeObserver.observe(mapElement)
  }

  const style = mapElement.dataset.style
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
    cancelPendingTileRequestsWhileZooming: false,
    locale: {
      'FullscreenControl.Enter': 'Karte im Vollbild anzeigen',
      'FullscreenControl.Exit': 'Vollbild verlassen',
    }
  });

  const fullscreenScreenCtrl = new mlgl.FullscreenControl({ container: document.getElementById('mapOuter') })
  fullscreenScreenCtrl.on('fullscreenstart', () => {
    if (isVideoPlaying()) video.pause()
  })

  map.addControl(new mlgl.NavigationControl({
    showZoom: true,
    showCompass: false,
  }), 'bottom-right');
  map.addControl(fullscreenScreenCtrl, 'top-right');

  map.touchZoomRotate.disableRotation();
  map.addControl(new mlgl.AttributionControl({ compact: null }), 'top-left');

  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);

  map.on('style.load', styleChangedHandler)
  map.on('styledata', styleChangedHandler)

  map.once('idle', hidePreview)
  map.once('move', hidePreview)
  map.once('zoom', hidePreview)

  map.once('idle', () => window.dispatchEvent(new CustomEvent("map:initialLoad")))

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
