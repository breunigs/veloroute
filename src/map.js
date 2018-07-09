import mapboxgl from 'mapbox-gl';
import routes from "../routes.json";

const hamburgBounds = new mapboxgl.LngLatBounds([8.9236, 53.1336], [10.8897, 53.9682]);
const rathausmarktCoord = [53.550974, 9.993148];

mapboxgl.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';

export const map = new mapboxgl.Map({
    container: 'map',
    hash: true, // TODO add mapillary image?
    maxBounds: hamburgBounds,
    center: rathausmarktCoord,
    zoom: 10,
    maxZoom: 20,
    style: 'mapbox://styles/mapbox/light-v9',
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
      'line-width': 3,
      'line-color': details.color,
    },
  });
};

map.on('style.load', () => {
  Object.keys(routes).forEach(addRouteSource);
  Object.entries(routes).forEach(renderRoute);
});

