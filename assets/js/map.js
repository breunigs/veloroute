// limit mapbox tracking
try { if (window.localStorage) window.localStorage.clear(); } catch (e) { }
import mapboxgl from 'mapbox-gl';

if (!window.requestIdleCallback) {
  window.requestIdleCallback = function (x) {
    window.setTimeout(x, 0);
  }
}

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

const routeLayers = ['vr-casing', 'fr-casing', 'vr-marker-circle'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = { layers: routeLayers.concat(articleLayers) };

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
let videoWasPlaying = false;
let indicatorAnimateTimer = null;
let zoomedInOnce = false;
function renderIndicator() {
  if (state.lon == "" || state.lat == "") return;
  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);
  const mapActive = map.isMoving() || map.isZooming();

  if (!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
  }

  const videoPlaying = video && !video.paused;
  const dist = indicator.getLngLat().distanceTo(lngLat);
  const animate = !mapActive && dist < 50 && ((videoPlaying && videoWasPlaying) || dist < 10)
  if (indicatorAnimateTimer) {
    clearTimeout(indicatorAnimateTimer);
    indicatorAnimateTimer = null;
  }
  if(animate) indicatorAnimateTimer = setTimeout(disableIndicatorAnimation, 300);
  indicator.getElement().classList.toggle("animate", animate);

  videoWasPlaying = videoPlaying;

  const shortest = closestEquivalentAngle(indicator.getRotation(), state.bearing)
  indicator.setRotation(shortest);
  indicator.setLngLat(lngLat);

  if (!mapActive && !zoomedInOnce && videoPlaying && prevBoundsTs === "") {
    zoomedInOnce = true;
    const zoom = Math.max(map.getZoom(), 14);
    map.flyTo({ center: lngLat, zoom: zoom });
  }
}

const closestEquivalentAngle = (from, to) => {
    const delta = ((((to - from) % 360) + 540) % 360) - 180;
    return from + delta;
}

const disableIndicatorAnimation = () => {
  if (!indicator) return;
  indicator.getElement().classList.toggle("animate", false)
}

const ensureIndicatorInView = () => {
  if (map.isMoving() || map.isZooming() || !indicator) {
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

const isVideoPlaying = () => {
  const vid = document.getElementById("videoInner");
  return vid && !vid.paused;
}

let indicatorFocus = null;
let prevIndicatorPos = '';
const maybeEnsureIndicatorInView = () => {
  const playing = isVideoPlaying();
  if (playing && indicatorFocus === null) {
    indicatorFocus = setInterval(ensureIndicatorInView, 2000);
  } else if (!playing && indicatorFocus !== null) {
    clearInterval(indicatorFocus);
    indicatorFocus = null;
  } else if (indicator && prevIndicatorPos !== `${state.lon},${state.lat}`) {
    // console.debug("indicator present, and changed, ensuring it's in view", indicator)
    if (prevIndicatorPos !== '') { window.requestAnimationFrame(ensureIndicatorInView); }
    prevIndicatorPos = `${state.lon},${state.lat}`;
  }
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

const handleMapHover = (evt) => {
  const none = itemsUnderCursor(evt).length === 0;
  map.getCanvas().style.cursor = none ? '' : 'pointer';
}

const handleMapClick = (evt) => {
  const items = itemsUnderCursor(evt);

  let route = null;
  let article = null;
  items.forEach(r => {
    if (r.properties.route_id && routeLayers.includes(r.layer.id)) {
      route = r.properties.route_id;
    } else if (r.properties.name && (routeLayers + articleLayers).includes(r.layer.id)) {
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

let boundsTimeout = null;
const sendBounds = () => {
  if (boundsTimeout) clearTimeout(boundsTimeout);
  boundsTimeout = setTimeout(() => {
    window.pushEvent("map-bounds", { bounds: map.getBounds().toArray() });
  }, 200);
}

const layerVisibilityConfig = [
  ['alltag', 'opacity', [
    ['line', ['vr-casing', 'vr-line-off-p1', 'vr-line-off-m1', 'vr-line-off-none', 'detour-line', 'planned-line']],
    ['icon', ['vr-oneway', 'vr-marker-text']],
    ['circle', ['vr-marker-circle']],
  ]],
  ['freizeit', 'visibility', [
    ['line', ['fr-casing', 'fr-line']],
    ['icon', ['fr-oneway', 'fr-sign', 'fr-warning-icons']],
  ]]
]
// same order as layerVisibilityConfig
let prevVisibility = [true, false];
function setLayerVisibility() {
  const types = state.visibleTypes.split(",");
  for (let i = 0; i < layerVisibilityConfig.length; i++) {
    const type = layerVisibilityConfig[i][0];
    const prevVis = prevVisibility[i];
    const nextVis = types.indexOf(type) >= 0;
    if (prevVis != nextVis) {
      setLayerStyle(layerVisibilityConfig[i][1], layerVisibilityConfig[i][2], nextVis);
      prevVisibility[i] = nextVis;
    }
  }
}

function setLayerStyle(style, layersByType, show) {
  const opacity = show ? 1 : 0.4;
  const lineCap = show ? "round" : "butt";
  const visibility = show ? "visible" : "none";

  for (let i = 0; i < layersByType.length; i++) {
    const type = layersByType[i][0];
    const layers = layersByType[i][1];
    for (let j = 0; j < layers.length; j++) {
      console.log("setting style", style, "for", layers[j], "to", show);
      if (style == "opacity" && type == "line" && layers[j] != 'vr-line-off-p1' && layers[j] != 'vr-line-off-m1')
        map.setLayoutProperty(layers[j], "line-cap", lineCap, { validate: true })
      if (style == "opacity") map.setPaintProperty(layers[j], `${type}-opacity`, opacity, { validate: true })
      if (style == "visibility") map.setLayoutProperty(layers[j], "visibility", visibility, { validate: true })
    }
  }
}

map.on('style.load', () => {
  setLayerVisibility();

  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);

  map.once('click', removeFakeMap);
  map.once('movestart', removeFakeMap);
  map.once('zoomstart', removeFakeMap);

  map.on('movestart', disableIndicatorAnimation);
  map.on('zoomstart', disableIndicatorAnimation);
});


let fakeMap = document.getElementById("fakeMap");
const updateFakeMap = () => {
  if (fakeMap === null) return;

  const w = fakeMap.offsetWidth;
  const h = fakeMap.offsetHeight;
  if (w == 0 || h == 0) return console.warn("element has no decent size, not updating fakemap", w, h);

  const zoom = map.getZoom();
  const center = map.getCenter();
  const imgURL = `https://api.mapbox.com/styles/v1/breunigs/ck8hk6y7e0csv1ioh4oqdtybb/static/${center.lng},${center.lat},${zoom}/${w}x${h}?access_token=${settings.mapboxAccessToken}`;
  console.debug("new fake map URL", imgURL);

  const img = new Image();
  img.onload = () => {
    window.requestAnimationFrame(() => {
      if (fakeMap) {
        // console.debug("better fake map has loaded, replacing");
        fakeMap.style.backgroundImage = `url(${imgURL})`;
      } else {
        // console.debug("better fake map has loaded, but it was too late");
      }
    })
  }
  img.src = imgURL;
}
window.requestIdleCallback(updateFakeMap);

let removeCounter = 0;
const removeFakeMap = () => {
  if (removeCounter < 30 && !map.areTilesLoaded()) {
    removeCounter++;
    setTimeout(removeFakeMap, 200);
    return;
  }

  if (fakeMap === null) return;
  const localFake = fakeMap;
  fakeMap = null;

  window.requestAnimationFrame(() => {
    localFake.style.opacity = 0;
  });
  setTimeout(() => {
    window.requestIdleCallback(() => {
      localFake.remove()
    });
  }, 200);
}
map.once('load', removeFakeMap);

let video = null;
let videoCoords = null;
window.mapUpdateIndicatorFromVideo = (vid, coords) => {
  video = vid;
  videoCoords = coords;
  updateVideoIndicator();
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

let prevCoordVideoIndex = 0;
function maybeHackStateFromVideo() {
  if (!video || !videoCoords || !state.videoHash || Number.isNaN(video.duration)) return;

  const curr = video.currentTime;
  let nextIdx = videoCoords[prevCoordVideoIndex] <= curr ? prevCoordVideoIndex : 0;
  for (; nextIdx < videoCoords.length-3; nextIdx += 3) {
    if (videoCoords[nextIdx] >= curr) break;
  }
  prevCoordVideoIndex = nextIdx;

  if (nextIdx == 0) {
    state.lon = videoCoords[1]
    state.lat = videoCoords[2];

    state.bearing = calcBearing(videoCoords[1], videoCoords[2], videoCoords[4], videoCoords[5])

  } else {
    const [nextT, nextLon, nextLat] = [videoCoords[nextIdx], videoCoords[nextIdx+1], videoCoords[nextIdx + 2]];
    const [prevT, prevLon, prevLat] = [videoCoords[nextIdx-3], videoCoords[nextIdx-2], videoCoords[nextIdx - 1]];

    // interpolate
    const t = Math.min(1, (curr - prevT) / (nextT - prevT));
    state.lat = prevLat + t * (nextLat - prevLat)
    state.lon = prevLon + t * (nextLon - prevLon)

    state.bearing = calcBearing(prevLon, prevLat, nextLon, nextLat)
  }
}

window.map = map;

function updateVideoIndicator() {
  maybeHackStateFromVideo();
  renderIndicator();
  maybeEnsureIndicatorInView();
}

let queued = false;
window.mapStateChanged = () => {
  if (queued) return;
  queued = true;
  window.requestIdleCallback(() => {
    queued = false;
    maybeFitBounds();
    updateVideoIndicator();
    setLayerVisibility();
  }, { timeout: 100 })
}
