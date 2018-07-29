import mapboxgl from 'mapbox-gl';
import markers from '../routes/geo/markers.json';
import { readFromHash } from './state';

const hamburgBounds = new mapboxgl.LngLatBounds([8.9236, 53.1336], [10.8897, 53.9682]);
const rathausmarktCoord = [9.993148, 53.550974];

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
  [{zoom:  0, value: -1}, 0],
  [{zoom:  0, value:  0}, 0],
  [{zoom:  0, value:  1}, 0],
  [{zoom: 14, value: -1}, -1],
  [{zoom: 14, value:  0}, 0],
  [{zoom: 14, value:  1}, +1],
  [{zoom: 17, value: -1}, -routeLineWidth],
  [{zoom: 17, value:  0}, 0],
  [{zoom: 17, value:  1}, +routeLineWidth],
  [{zoom: 22, value: -1}, -2*routeLineWidth],
  [{zoom: 22, value:  0}, 0],
  [{zoom: 22, value:  1}, +2*routeLineWidth],
];

mapboxgl.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';

const inital = readFromHash();

export const map = new mapboxgl.Map({
    container: 'map',
    maxBounds: hamburgBounds,
    center: [inital.lon, inital.lat],
    zoom: inital.zoom,
    minZoom: 10,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/cjjhfyliv5v202rl6cfxsh458',
    pitchWithRotate: false,
    dragRotate: false,
});
map.touchZoomRotate.disableRotation();

let clickListeners = [];
const addClickListener = (...funcs) => {
  funcs.forEach(f => clickListeners.push(f));
}


const addRouteSource = () => {
  map.addSource(`source-routes`, {
    type: 'geojson',
    data: `/routes/geo/routes.geojson`,
    tolerance: 0.6 // default 0.375
  });
}

const renderRoutes = () => {
  map.addLayer({
    id: `layer-routes`,
    source: `source-routes`,
    type: 'line',
    layout: {
      "line-cap": "round"
    },
    paint: {
      "line-width": {
        type: "exponential",
        base: 3,
        stops: routeWidthStops,
      },
      'line-color': { "type": "identity", "property": "color" },
      'line-offset': {
        type: "exponential",
        property: "offset",
        stops: collisionOffsets
      }
    },
  }, 'route-itself');

  map.addLayer({
    "id": 'layer-routes-arrows',
    "type": "symbol",
    "source": 'source-routes',
    "minzoom": 13.5,
    "layout": {
      "symbol-placement": "line",
      "symbol-spacing": 20,
      "text-keep-upright": false,
      "text-justify": "left",
      "text-allow-overlap": true,
      "text-ignore-placement": true,
      "text-field": '{pattern}',
      "text-size": {
        "type": "exponential",
        "stops": [
          [0, 9],
          [16, 12],
          [19, 20]
        ]
      },
    },
    paint: {
      "text-opacity": 0.9,
      'text-color': '#fff'
    },
  }, 'route-arrows');

  map.addLayer({
    id: `layer-routes-casing`,
    source: `source-routes`,
    type: 'line',
    layout: {
      "line-cap": "round"
    },
    paint: {
      'line-width': {
        type: "exponential",
        base: 3,
        stops: routeWidthCasingStops
      },
      'line-color': '#fff',
      'line-offset': {
        type: "exponential",
        property: "offset",
        stops: collisionOffsets
      }
    },
  }, 'route-casing');
};

const renderIcons = () => {
  markers.forEach(function(marker) {
    const [lon, lat, name] = marker;
    const lngLat = new mapboxgl.LngLat(lon, lat);

    let el = document.createElement('div');
    el.className = `icon icon${name}`;
    el.innerText = name;
    el.addEventListener("click", (e) => {
      clickListeners.forEach((f) => f(name, lngLat));
    });

    // keep size in sync with base.scss!
    new mapboxgl.Marker(el, {offset: [0, 5]})
      .setLngLat(lngLat)
      .addTo(map);
  });
};

const genDiv = (id) => {
  const el = document.createElement('div');
  if(id) el.id = id;
  return el;
}

let indicator = null
const renderIndicator = (lon, lat, bearing) => {
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
    map.flyTo({center: lngLat});
  } else if (outsideViewport) {
    map.panTo(lngLat);
  }
}

const getHighlightedRoute = (evt) => {
  let routes = map.queryRenderedFeatures(evt.point, { layers: ['layer-routes-casing'] });
  // be more lenient with click targets on touch devices
  if(evt.type === "click" && !routes.length && 'ontouchstart' in window) {
    console.debug(evt.originalEvent)
    const sw = [evt.point.x - 10, evt.point.y + 10];
    const ne = [evt.point.x + 10, evt.point.y - 10];
    routes = map.queryRenderedFeatures([sw, ne], { layers: ['layer-routes-casing'] });
  }
  return routes.length ? routes[0] : null;
}

const handleRouteHover = (evt) => {
  const route = getHighlightedRoute(evt);
  map.getCanvas().style.cursor = route ? 'pointer' : '';
}

const handleRouteClick = (evt) => {
  const route = getHighlightedRoute(evt);
  if(route) clickListeners.forEach((f) => f(route.properties.name, evt.lngLat, route.properties.oneway));
}

map.on('style.load', () => {
  addRouteSource();
  renderRoutes();
  renderIcons();

  map.on('mousemove', handleRouteHover);
  map.on('click', handleRouteClick);
});

export { addClickListener, renderIndicator };
