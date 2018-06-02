mapboxgl.accessToken = 'pk.eyJ1IjoiYnJldW5pZ3MiLCJhIjoiY2poeDIwOW14MDZsZTNxcHViajE0Y3Y5eCJ9._zBVNwelSOZOnRDEmwPGiA';
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/light-v9', // vector
    // style: { // raster
    //     "version": 8,
    //     "sources": {
    //         "raster-tiles": {
    //             "type": "raster",
    //             "url": "mapbox://mapbox.light",
    //             "tileSize": 256
    //         }
    //     },
    //     "layers": [{
    //         "id": "simple-tiles",
    //         "type": "raster",
    //         "source": "raster-tiles",
    //         "minzoom": 0,
    //         "maxzoom": 22
    //     }]
    // },
    center: [10.0188, 53.5778],
    zoom: 11
});

function addRouteV1(route, options) {
  fetch("geo/route" + route + ".geojson")
    .then(response => response.json())
    .then(jsonResponse => {
      let layer = {
        "id": "route" + route,
        "type": "line",
        "source": {
          "type": "geojson",
          "data": jsonResponse
        },
        "layout": {
            "line-join": "round",
            "line-cap": "round"
        },
        "paint": {
            "line-color": options.color,
            "line-width": 4
        }
      }
      map.on('load', () => map.addLayer(layer))
    });
}

function addRouteV2(route, details) {
  map.on('load', function() {
    map.addSource("route" + route, {
      type: "geojson",
      data: "geo/route" + route + ".geojson"
    });
    map.addLayer({
      "id": "lyr_route" + route,
      "type": "line",
      "source": "route" + route,
      "layout": {
          "line-join": "round",
          "line-cap": "round"
      },
      "paint": {
          "line-color": details.color,
          "line-width": 4
      }
    })
  });
}

fetch("routes.json")
  .then(response => response.json())
  .then(jsonResponse => {
    Object.entries(jsonResponse).forEach(([route, details]) => {
      addRouteV1(route, details)
      // addRouteV2(route, details)
    })
  });
