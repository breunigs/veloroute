import mapboxgl from 'mapbox-gl';
import geocoder from './geocoder';
import markers from '../routes/geo/markers.json';
import { readFromHash } from './state';

const hamburgBounds = [8.9236, 53.1336, 10.8897, 53.9682];

const routeLineWidth = 3;
const routeWidthStops = [
  [0, routeLineWidth],
  [16, routeLineWidth*2],
  [19, routeLineWidth*4]
];
const routeWidthCasingStops = [
  [0, routeLineWidth+2],
  [16, routeLineWidth*2+2],
  [19, routeLineWidth*4+2]
];
const collisionOffsets = [
  [{zoom:  0, value: -2},  0               ], [{zoom:  0, value: -1},  0               ], [{zoom:  0, value:  0}, 0],  [{zoom:  0, value:  1}, 0                ], [{zoom:  0, value:  2}, 0                ],
  [{zoom: 14, value: -2}, -2               ], [{zoom: 14, value: -1}, -1               ], [{zoom: 14, value:  0}, 0],  [{zoom: 14, value:  1}, +1               ], [{zoom: 14, value:  2}, +2               ],
  [{zoom: 17, value: -2}, -2*routeLineWidth], [{zoom: 17, value: -1}, -routeLineWidth  ], [{zoom: 17, value:  0}, 0],  [{zoom: 17, value:  1}, +routeLineWidth  ], [{zoom: 17, value:  2}, +2*routeLineWidth],
  [{zoom: 22, value: -2}, -4*routeLineWidth], [{zoom: 22, value: -1}, -2*routeLineWidth], [{zoom: 22, value:  0}, 0],  [{zoom: 22, value:  1}, +2*routeLineWidth], [{zoom: 22, value:  2}, +4*routeLineWidth],
];

mapboxgl.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2oxdWplZWl3MDA4bjM0bW81dzdtYm55YyJ9.lHUbRUDgmKBgUCQot8PPsw';

const inital = readFromHash();

export const map = new mapboxgl.Map({
    container: 'map',
    maxBounds: hamburgBounds,
    center: [inital.lon, inital.lat],
    zoom: inital.zoom,
    minZoom: 10,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/cjrmfmv2w05py2spqq63vxvte',
    pitchWithRotate: false,
    dragRotate: false,
});
map.touchZoomRotate.disableRotation();
new geocoder(map, mapboxgl.accessToken, hamburgBounds);

let routeClickListeners = [];
const addRouteClickListener = (...funcs) => {
  funcs.forEach(f => routeClickListeners.push(f));
}

const createMarker = async (classes, pos, text, clickHandler) => {
  let el = document.createElement('div');
  el.className = classes;
  el.innerText = text;
  el.addEventListener("click", (e) => {
    e.stopPropagation();
    clickHandler(e)
  });

  // keep size in sync with base.scss!
  new mapboxgl.Marker(el, {offset: [0, 5]})
    .setLngLat(pos)
    .addTo(map);
}

const renderIcons = () => {
  markers.forEach(function(marker) {
    const [lon, lat, name] = marker;
    const lngLat = new mapboxgl.LngLat(lon, lat);

    createMarker(`icon icon${name}`, lngLat, name, (e) => {
      routeClickListeners.forEach((f) => f(name, lngLat));
    });
  });
}

const genDiv = (id) => {
  const el = document.createElement('div');
  if(id) el.id = id;
  return el;
}

let indicator = null
async function renderIndicator(lon, lat, bearing) {
  const lngLat = new mapboxgl.LngLat(lon, lat);

  if(!indicator) {
    const rotated = genDiv('indicator-rotate');
    rotated.appendChild(genDiv('indicator-dir'));
    rotated.appendChild(genDiv('indicator-loc'));
    const el = genDiv('indicator');
    el.appendChild(rotated);
    indicator = new mapboxgl.Marker(el)
      .setLngLat(lngLat)
      .addTo(map);
  }

  document.getElementById('indicator-rotate').style.transform = `rotate(${bearing}deg)`;
  indicator.setLngLat(lngLat);

  if(map.isMoving()) {
    console.debug("map already moving, not going to focus indicator");
    return
  }
  moveTo(lngLat);
}

const moveTo = (lngLat) => {
  const indiRect = indicator.getElement().getBoundingClientRect();
  const indiPos = {
    x: indiRect.left + indiRect.width / 2,
    y: indiRect.top + indiRect.height / 2
  };

  const mapRect = document.getElementById('map').getBoundingClientRect();
  const padding = 10;

  const cmp = (padding) => {
    return indiPos.y <= mapRect.top    + padding
        || indiPos.y >= mapRect.bottom - padding
        || indiPos.x <= mapRect.left   + padding
        || indiPos.x >= mapRect.right  - padding;
  }

  // add padding in pixels around the viewport
  const outsideViewport = cmp(10);
  const veryFarOutside = cmp(-200);
  if(outsideViewport && veryFarOutside) {
    console.debug("Flying to location")
    map.flyTo({center: lngLat});
  } else if (outsideViewport) {
    console.debug("Panning to location")
    map.panTo(lngLat);
  }
}

const routeLayers = ['routes-casing'];
const articleLayers = ['article-areas title', 'article-areas bg'];
const clickableLayers = { layers: routeLayers.concat(articleLayers) };
const bodyClasses = document.getElementsByTagName('body')[0].classList;

const itemsUnderCursor = (evt) => {
  let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
  // be more lenient with click targets
  if(!routes.length) {
    const leniency = 'ontouchstart' in window ? 10 : 3;
    const sw = [evt.point.x - leniency, evt.point.y + leniency];
    const ne = [evt.point.x + leniency, evt.point.y - leniency];
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
  let bounds = null;
  items.forEach(r => {
    if(routeLayers.includes(r.layer.id)) {
      route = r.properties.name;
    } else if(articleLayers.includes(r.layer.id)) {
      article = "blog/" + r.properties.name;
      bounds = r.properties.bounds;
    }
  });

  if(bounds) {
    bounds = JSON.parse(bounds);
    console.debug("zooming to geojson feature on mapclick", bounds);
    map.fitBounds(bounds, { padding: 100, maxZoom: 17 });
  }
  if(article || route) {
    routeClickListeners.forEach((f) => f(article || route, evt.lngLat, "mapClick"));
  }
}

map.on('style.load', () => {
  map.on('mousemove', handleMapHover);
  map.on('click', handleMapClick);
  renderIcons();
});

export { addRouteClickListener, renderIndicator };
