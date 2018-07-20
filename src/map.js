import mapboxgl from 'mapbox-gl';
import markers from '../routes/geo/markers.json';

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

export const map = new mapboxgl.Map({
    container: 'map',
    hash: true, // TODO add mapillary image?
    maxBounds: hamburgBounds,
    center: rathausmarktCoord,
    zoom: 10,
    minZoom: 10,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/cjjhfyliv5v202rl6cfxsh458',
    pitchWithRotate: false,
    dragRotate: false,
});

let moveListeners = [];
const addMoveListener = (f) => {
  moveListeners.push(f);
}

let clickListeners = [];
const addClickListener = (f) => {
  clickListeners.push(f);
}

export { addMoveListener, addClickListener };

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

const routesFromEvt = (e) => {
  return map.queryRenderedFeatures(e.point, { layers: ['layer-routes-casing'] });
};

const renderIcons = () => {
  markers.forEach(function(marker) {
    const [lon, lat, name] = marker;
    let el = document.createElement('div');
    el.className = `icon icon${name}`;
    el.innerText = name;
    el.addEventListener("mousemove", (e) => {
      e.stopPropagation();
      handleRouteHover(name)
    });
    el.addEventListener("click", () => handleRouteClick(name));

    // keep size in sync with base.scss!
    new mapboxgl.Marker(el, {offset: [0, 5]})
      .setLngLat([lon, lat])
      .addTo(map);
  });
};

const getName = (evtOrName) => {
  if(typeof evtOrName === "string") return evtOrName;
  const routes = routesFromEvt(evtOrName);
  return routes.length ? routes[0].properties.name : null;
}

const handleRouteHover = (evtOrName) => {
  const name = getName(evtOrName);
  map.getCanvas().style.cursor = name ? 'pointer' : '';

  if(!name) return clearTimeout(hoverTimeout);

  if(name != hoverRoute) clearTimeout(hoverTimeout);
  hoverRoute = name;

  hoverTimeout = setTimeout(() => {
    moveListeners.forEach((f) => f(name));
  }, 200);
}

const handleRouteClick = (evtOrName) => {
  clearTimeout(hoverTimeout);
  const name = getName(evtOrName);
  if(name) clickListeners.forEach((f) => f(name));
}

let hoverTimeout = null;
let hoverRoute = null;

map.on('style.load', () => {
  addRouteSource();
  renderRoutes();
  renderIcons();

  map.on('mousemove', handleRouteHover);
  map.on('click', handleRouteClick);
});
