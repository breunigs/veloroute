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

const routeLayers = ['routes-casing', 'routemarker-circle'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = { layers: routeLayers.concat(articleLayers) };

const genDiv = (id) => {
  const el = document.createElement('div');
  if (id) el.id = id;
  return el;
}

let indicator = null;
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
    if (!map.isMoving() && prevBoundsTs === "") {
      const zoom = Math.max(map.getZoom(), 14);
      map.flyTo({ center: lngLat, zoom: zoom });
    }
  }

  const dist = indicator.getLngLat().distanceTo(lngLat);
  indicator.getElement().classList.toggle("animate", dist < 10 && !map.isMoving());

  const shortest = closestEquivalentAngle(indicator.getRotation(), state.bearing)
  indicator.setRotation(shortest);
  indicator.setLngLat(lngLat);
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
    window.requestAnimationFrame(ensureIndicatorInView);
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

map.on('style.load', () => {
  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  map.on('moveend', sendBounds);
  map.once('click', removeFakeMap);
  map.once('movestart', removeFakeMap);
  map.on('movestart', disableIndicatorAnimation);
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

window.mapStateChanged = () => {
  window.requestIdleCallback(() => {
    maybeFitBounds();
    renderIndicator();
    maybeEnsureIndicatorInView();
  }, { timeout: 100 })
}
