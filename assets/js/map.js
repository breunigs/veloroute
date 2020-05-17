import mapboxgl from 'mapbox-gl';

const state = document.getElementById("control").dataset;
const settings = document.getElementById("settings").dataset;

mapboxgl.accessToken = settings.mapboxAccessToken;

const mapElem = document.getElementById('map');
const map = new mapboxgl.Map({
    container: 'map',
    maxBounds: settings.bounds.split(","),
    bounds: settings.initial.split(","),
    minZoom: 9,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/ck8hk6y7e0csv1ioh4oqdtybb',
    pitchWithRotate: false,
    dragRotate: false,
});
map.touchZoomRotate.disableRotation();

const genDiv = (id) => {
  const el = document.createElement('div');
  if(id) el.id = id;
  return el;
}

let indicator = null;
let indicatorRot = null;
function renderIndicator() {
  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);

  if(!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
    indicatorRot = document.getElementById('indicator-rotate');
    if(!map.isMoving()) {
      map.flyTo({center: lngLat, zoom: 14});
    }
  }

  indicatorRot.style.transform = `rotate(${state.bearing}deg)`;
  indicator.setLngLat(lngLat);
}

const ensureIndicatorInView = () => {
  const indiRect = indicator.getElement().getBoundingClientRect();
  const indiPos = {
    x: indiRect.left + indiRect.width / 2,
    y: indiRect.top + indiRect.height / 2
  };

  const mapRect = mapElem.getBoundingClientRect();
  const cmp = (padding) => {
    return indiPos.y <= mapRect.top    + padding
        || indiPos.y >= mapRect.bottom - padding
        || indiPos.x <= mapRect.left   + padding
        || indiPos.x >= mapRect.right  - padding;
  }


  // add padding in pixels around the viewport
  const outsideViewport = cmp(10);
  if(!outsideViewport) { return; }

  const lngLat = new mapboxgl.LngLat(state.lon, state.lat);
  const veryFarOutside = cmp(-200);
  if(veryFarOutside) {
    console.debug("Flying to location")
    map.flyTo({center: lngLat});
  } else {
    console.debug("Panning to location")
    map.panTo(lngLat);
  }
}

let indicatorFocus = null;
window.mapStateChanged = () => {
  renderIndicator();
  if(state.slideshow === "true" && indicatorFocus === null) {
    indicatorFocus = setInterval(ensureIndicatorInView, 2000);
  } else if(state.slideshow !== "true" && indicatorFocus !== null) {
    clearInterval(ensureIndicatorInView);
    indicatorFocus = null;
  }
}

// const routeLayers = ['routes-casing', 'routemarker-circle'];
// const articleLayers = ['article-areas title', 'article-areas bg'];
// const clickableLayers = { layers: routeLayers.concat(articleLayers) };
// const bodyClasses = document.getElementsByTagName('body')[0].classList;

// const itemsUnderCursor = (evt) => {
//   let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
//   // be more lenient with click targets
//   if(!routes.length) {
//     const leniency = 'ontouchstart' in window ? 10 : 3;
//     const sw = [evt.point.x - leniency, evt.point.y + leniency];
//     const ne = [evt.point.x + leniency, evt.point.y - leniency];
//     routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
//   }
//   return routes;
// }

// const handleMapHover = (evt) => {
//   const none = itemsUnderCursor(evt).length === 0;
//   map.getCanvas().style.cursor = none ? '' : 'pointer';
// }

// const handleMapClick = (evt) => {
//   const items = itemsUnderCursor(evt);

//   let route = null;
//   let article = null;
//   let bounds = null;
//   items.forEach(r => {
//     if(routeLayers.includes(r.layer.id)) {
//       route = r.properties.name;
//     } else if(articleLayers.includes(r.layer.id)) {
//       article = "blog/" + r.properties.name;
//       bounds = r.properties.bounds;
//     }
//   });

//   if(bounds) {
//     bounds = JSON.parse(bounds);
//     console.debug("zooming to geojson feature on mapclick", bounds);
//     map.fitBounds(bounds, { padding: 100, maxZoom: 17 });
//   }```

//    killall steam
//    `
//   if(article || route) {
//     routeClickListeners.forEach((f) => f(article || route, evt.lngLat, "mapClick"));
//   }
// }

// map.on('style.load', () => {
//   map.on('mousemove', handleMapHover);
//   map.on('click', handleMapClick);
// });
