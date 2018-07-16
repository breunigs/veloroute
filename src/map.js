import mapboxgl from 'mapbox-gl';
import routes from "../routes.json";

const hamburgBounds = new mapboxgl.LngLatBounds([8.9236, 53.1336], [10.8897, 53.9682]);
const rathausmarktCoord = [53.550974, 9.993148];

// these two are below each other in the mapstyle. With this trick, the background
// will not be drawn over the actual routes.
const layerPosRoutes = "waterway-label";
const layerPosRoutesCasing = "housenum-label";

const routeLineWidth = 3;

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
    tolerance: 1 // default 0.375
  });
}

const renderRoute = (entry) => {
  const [route, details] = entry;
  map.addLayer({
    id: `layer-${route}`,
    source: `source-${route}`,
    type: 'line',
    layout: {
      "line-join": "round",
      "line-cap": "round"
    },
    paint: {
      "line-width": {
        "type": "exponential",
        "base": routeLineWidth,
        "stops": [
          [0, routeLineWidth],
          [16, routeLineWidth*2],
          [19, routeLineWidth*4]
        ]
      },
      'line-color': details.color,
    },
  }, layerPosRoutes);

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
        "base": 9,
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
  }, layerPosRoutes);

  map.addLayer({
    id: `layer-${route}-casing`,
    source: `source-${route}`,
    type: 'line',
    layout: {
      "line-join": "round",
      "line-cap": "round"
    },
    paint: {
      'line-width': routeLineWidth + 2,
      'line-color': '#fff',
    },
  }, layerPosRoutesCasing);
};


map.on('style.load', () => {
  Object.keys(routes).forEach(addRouteSource);
  Object.entries(routes).forEach(renderRoute);
});

