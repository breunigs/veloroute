import {
  maybeSwitchStyle,
  maybeToggleLayers
} from "./map_layer_toggler";

import "./map_image_stub"
import { setupIndicator } from "./map_indicator"

if (!window.requestIdleCallback) window.requestIdleCallback = function (callback, _options) {
  window.setTimeout(callback, 40)
}

const settings = window.document.currentScript.dataset;

// keep in sync with basemap/constants.ex
const flyToSpeed = 0.7
const fitBoundsOpt = {
  maxZoom: 17,
  speed: flyToSpeed,
};


let mapConfig = { highlight: settings.initialHighlight }
window.addEventListener("phx:map", e => {
  console.debug("updating map config", e.detail)
  Object.assign(mapConfig, e.detail)
  maybeSwitchStyle(map, mapConfig)
  maybeToggleLayers(map, mapConfig)
});

// TODO: move to settings.ex
const routeLayers = [
  'rr-line', 'rr-line-tunnel',
  'vr-line', 'vr-line-tunnel',
  'br-line', 'br-line-tunnel',
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

let highlightsAppliedToStyle = null
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
  fullscreenScreenCtrl.on('fullscreenstart', () => document.getElementById('videoInner')?.pause())

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
  setupIndicator(map, flyToSpeed)

  window.map = map;

  function lazyLoadKreuzungsskizzen(x) {
    if (map.getZoom() < 16) return;
    map.off('zoomend', lazyLoadKreuzungsskizzen);
    map.off('moveend', lazyLoadKreuzungsskizzen);
    map.off('idle', lazyLoadKreuzungsskizzen);
    console.log("loading Kreuzungsskizzen")
    window.dispatchEvent(new CustomEvent("js:load", {
      detail: { url: "/assets/kreuzungsskizzen.js", callback: () => { } }
    }));
  }
  map.on('zoomend', lazyLoadKreuzungsskizzen);
  map.on('moveend', lazyLoadKreuzungsskizzen);
  map.on('idle', lazyLoadKreuzungsskizzen);
}

setup()
window.addEventListener("global:mounted", setup)
