import mapboxgl from 'mapbox-gl';
import routes from "../routes.json";

const hamburgBounds = new mapboxgl.LngLatBounds([8.9236, 53.1336], [10.8897, 53.9682]);
const rathausmarktCoord = [53.550974, 9.993148];

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

const addRouteSource = (route) => {
  map.addSource(`source-${route}`, {
    type: 'geojson',
    data: `/routes/geo/route${route}.geojson`,
    tolerance: 0.6 // default 0.375
  });
}

const renderRoute = (entry) => {
  const [route, details] = entry;
  map.addLayer({
    id: `layer-${route}`,
    source: `source-${route}`,
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
      'line-color': details.color,
      'line-offset': {
        type: "exponential",
        property: "offset",
        stops: collisionOffsets
      }
    },
  }, 'route-itself');

  map.addLayer({
    "id": `layer-${route}-symbols`,
    "type": "symbol",
    "source": `source-${route}`,
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
    id: `layer-${route}-casing`,
    source: `source-${route}`,
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


map.on('style.load', () => {
  Object.keys(routes).forEach(addRouteSource);
  Object.entries(routes).forEach(renderRoute);
});

