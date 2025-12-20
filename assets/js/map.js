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

let resizeTimer
function disableIndicatorAnimationOnce(event) {
  if (!indicator) return
  const cls = indicator.getElement().classList;
  cls.add("no-animation")
  if (event !== null) {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => cls.remove("no-animation"), 100)
  } else {
    requestAnimationFrame(() => cls.remove("no-animation"))
  }
}

async function renderIndicator() {
  const pos = await getVideoPosition();
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
      .setPitchAlignment("map")
      .setRotationAlignment("map")
      .setSubpixelPositioning(true)

    requestAnimationFrame(() => {
      indicator.addTo(map);
      el.style.opacity = 0
      requestAnimationFrame(() => el.style.opacity = 1);
    })

    addEventListener("resize", disableIndicatorAnimationOnce)
  }

  const videoPlaying = isVideoPlaying();
  const dist = indicator.getLngLat().distanceTo(lngLat);
  const animate = dist < 50 && ((videoPlaying && videoWasPlaying) || dist < 10)

  if (!animate) disableIndicatorAnimationOnce()
  videoWasPlaying = videoPlaying;

  const shortest = closestEquivalentAngle(indicator.getRotation(), pos.bearing);
  // save one call to _update()
  // indicator.setRotation(shortest);
  indicator._rotation = shortest;
  indicator.setLngLat(lngLat);

  // zoom in once, i.e. when user just clicks play when first visiting the site
  if (!zoomedInOnce && videoPlaying && map.getZoom() <= 13 && !map.isMoving() && !map.isZooming()) {
    zoomedInOnce = true;
    map.flyTo({
      center: lngLat,
      zoom: Math.max(map.getZoom(), 14),
      speed: flyToSpeed,
    });
    return;
  }

  if (firstRender) return
  ensureIndicatorInViewIdle ||= window.requestIdleCallback(ensureIndicatorInView, { timeout: 1000 });
}

const closestEquivalentAngle = (from, to) => {
  if (to === null) return from;
  const delta = ((((to - from) % 360) + 540) % 360) - 180;
  return from + delta;
}

const updateMapMovingStatus = () => {
  const moving = map.isMoving() || map.isZooming()
  document.getElementById("map").classList.toggle("moving", moving)
}

let ensureIndicatorInViewIdle = null
const ensureIndicatorInView = async () => {
  ensureIndicatorInViewIdle = null
  if (map.isMoving() || map.isZooming() || !indicator) {
    return;
  }

  const lngLat = indicator.getLngLat();
  if (map.getBounds().contains(lngLat)) return;

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

  const minIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(minMs / indicatorPolyline.interval));
  const maxIndex = indicatorIndexBounds(indicatorPolyline, Math.floor(maxMs / indicatorPolyline.interval));

  for (let i = minIndex; i <= maxIndex; i += 10) {
    bbox.extend(indicatorPolyline.coords[i])
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
  disableIndicatorAnimationOnce()
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
    if (map.isMoving() || map.isZooming()) return sendBounds();

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

  const currStyleName = map.getStyle().name
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
    Math.floor(currMs / indicatorPolyline.interval)
  );
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
  let next = indicatorIndexBounds(
    indicatorPolyline,
    index + Math.round(100 / indicatorPolyline.interval)
  );
  let [lon2, lat2] = indicatorPolyline.coords[next];

  // If both points are close to each other, look 1s further
  let close = veryClose(indicatorPolyline, lon1, lat1, lon2, lat2);
  if (close) {
    next += Math.round(1000 / indicatorPolyline.interval)
    next = indicatorIndexBounds(
      indicatorPolyline,
      next
    );
    [lon2, lat2] = indicatorPolyline.coords[next];
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
  return Math.min(index, indicatorPolyline.coords.length - 1);
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
  let coordinates = new Array(Math.floor(str.length / 2));

  let byte;
  while (index < str.length) {
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

    coordinates[coordIndex++] = [lon / factor, lat / factor];
  }

  // remove any over allocated entries
  coordinates.length = coordIndex
  return coordinates
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
    cancelPendingTileRequestsWhileZooming: false,
    locale: {
      'FullscreenControl.Enter': 'Karte im Vollbild anzeigen',
      'FullscreenControl.Exit': 'Vollbild verlassen',
    }
  });

  const fullscreenScreenCtrl = new mlgl.FullscreenControl()
  fullscreenScreenCtrl.on('fullscreenstart', () => {
    if (isVideoPlaying()) video.pause()
    disableIndicatorAnimationOnce()
  })
  fullscreenScreenCtrl.on('fullscreenend', disableIndicatorAnimationOnce)

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

  map.on('movestart', updateMapMovingStatus);
  map.on('moveend', updateMapMovingStatus);

  map.on('style.load', styleChangedHandler)
  map.on('styledata', styleChangedHandler)

  map.on('idle', hidePreview);
  map.on('move', hidePreview);
  map.on('zoom', hidePreview);

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
