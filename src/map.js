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
  [{zoom:  0, value: -2},  0               ], [{zoom:  0, value: -1},  0               ], [{zoom:  0, value:  0}, 0],  [{zoom:  0, value:  1}, 0                ], [{zoom:  0, value:  2}, 0                ],
  [{zoom: 14, value: -2}, -2               ], [{zoom: 14, value: -1}, -1               ], [{zoom: 14, value:  0}, 0],  [{zoom: 14, value:  1}, +1               ], [{zoom: 14, value:  2}, +2               ],
  [{zoom: 17, value: -2}, -2*routeLineWidth], [{zoom: 17, value: -1}, -routeLineWidth  ], [{zoom: 17, value:  0}, 0],  [{zoom: 17, value:  1}, +routeLineWidth  ], [{zoom: 17, value:  2}, +2*routeLineWidth],
  [{zoom: 22, value: -2}, -4*routeLineWidth], [{zoom: 22, value: -1}, -2*routeLineWidth], [{zoom: 22, value:  0}, 0],  [{zoom: 22, value:  1}, +2*routeLineWidth], [{zoom: 22, value:  2}, +4*routeLineWidth],
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

let routeClickListeners = [];
const addRouteClickListener = (...funcs) => {
  funcs.forEach(f => routeClickListeners.push(f));
}

let qualityClickListeners = [];
const addQualityClickListener = (...funcs) => {
  funcs.forEach(f => qualityClickListeners.push(f));
}

const addSource = (name) => {
  return fetch(`/routes/geo/${name}.geojson`)
    .then(response => response.json())
    .then(json => {
      map.addSource(`source-${name}`, {
        lineMetrics: true,
        type: 'geojson',
        data: json,
        tolerance: 0.6 // default 0.375,
      });
    });
}

const renderQuality = () => {
  map.addLayer({
    id: `layer-quality`,
    source: `source-quality`,
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
      'line-color': { "type": "identity", "property": "color" }
    },
  }, 'route-itself');
}

const renderRoutes = (initialRoute) => {
  map.addLayer({
    id: `layer-routes`,
    source: `source-routes`,
    type: 'line',
    layout: {
      "line-cap": "round",
      "visibility": initialRoute == "quality" ? "none" : "visible",
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
    }
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
      routeClickListeners.forEach((f) => f(name, lngLat));
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

let clickableLayers = { layers: ['layer-routes'] };
let qualityLoaded = false;
let routesLoaded = false;
const bodyClasses = document.getElementsByTagName('body')[0].classList;
async function toggleQuality(shownRoute) {
  if(shownRoute === "quality") {
    bodyClasses.add('hide-route-markers');
    if(!qualityLoaded) {
      qualityLoaded = true;
      addSource("quality").then(() => {
        renderQuality();
        clickableLayers = { layers: ['layer-quality'] };
        toggleQuality("quality");
      });
      return;
    }
    map.setLayoutProperty('layer-quality', 'visibility', 'visible');
    if(routesLoaded) map.setLayoutProperty('layer-routes', 'visibility', 'none');
  } else if(qualityLoaded) {
    bodyClasses.remove('hide-route-markers');
    if(routesLoaded) map.setLayoutProperty('layer-routes', 'visibility', 'visible');
    map.setLayoutProperty('layer-quality', 'visibility', 'none');
  }
}

const getHighlightedRoute = (evt) => {
  let routes = map.queryRenderedFeatures(evt.point, clickableLayers);
  // be more lenient with click targets
  const leniency = 'ontouchstart' in window ? 10 : 3;
  if(!routes.length) {
    const sw = [evt.point.x - leniency, evt.point.y + leniency];
    const ne = [evt.point.x + leniency, evt.point.y - leniency];
    routes = map.queryRenderedFeatures([sw, ne], clickableLayers);
  }
  return routes.length ? routes[0] : null;
}

const handleRouteHover = (evt) => {
  const route = getHighlightedRoute(evt);
  map.getCanvas().style.cursor = route ? 'pointer' : '';
}

const handleRouteClick = (evt) => {
  const route = getHighlightedRoute(evt);
  if(!route) return;

  if(route.properties.quality) {
    qualityClickListeners.forEach((f) => f(route.properties.name, evt.lngLat, false, route.properties));
    return;
  }

  routeClickListeners.forEach((f) => f(route.properties.name, evt.lngLat));
}

map.on('style.load', () => {
  addSource("routes").then(() => {
    routesLoaded = true;
    renderRoutes(inital.route);
    map.on('mousemove', handleRouteHover);
    map.on('click', handleRouteClick);
  })
  renderIcons();
  toggleQuality(inital.route);

});

export { addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality };
