var mly = {}

mly.apiKey = 'MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2';
mly.startPicture = '0tLKnBXrvuSJ3U0toI7vYw';
mly.apiHost = 'https://a.mapillary.com/v3/'; // TODO: can this be extracted from `Mapillary`?
mly.allowedUsernames='breunigs'
mly.indicatorColor = '#0f0';
mly.ownPositionColor = '#00f';
mly.viewer = new Mapillary.Viewer(
  'mly',
  mly.apiKey,
  mly.startPicture,
  {
    baseImageSize: Mapillary.ImageSize.Size320,
    component: {
      marker: { visibleBBoxSize: 100 },
      cover: false,
      attribution: false,
      zoom: false,
      bearing: false,
      sequence: true, // setting this to false also hides direction arrows
      direction: true,
    },
  }
);
mly.indicator = {
  mapLine: L.polyline([[0, 0], [0, 0]], { color: mly.indicatorColor, weight: 1, id: "indicator-id-line" }),
  mapMarker: L.circleMarker([0, 0], { radius: 5, color: mly.indicatorColor, id: "indicator-id-circle" }),
  viewerMarker: null,
}

// setup
mly.viewer.setFilter(["in", "username", mly.allowedUsernames]); // doesn't work for "moveCloseTo"
mly.mapOwnPositionMarker = L.circleMarker([0, 0], { radius: 7, color: mly.ownPositionColor }),
mly.viewerMarkerComponent = mly.viewer.getComponent('marker');

mly.removeOwnPosition = function() {
  mly.mapOwnPositionMarker.removeFrom(map);
  // TODO: switch to "sorry no images here" mapillary view
}

mly.removeIndicators = function() {
  map.removeLayer(mly.indicator.mapLine);
  map.removeLayer(mly.indicator.mapMarker);
  if (mly.indicator.viewerMarker) {
    mly.viewerMarkerComponent.remove([mly.indicator.viewerMarker.id]);
    mly.indicator.viewerMarker = null;
  }
}

mly.apiCall = function(path, params) {
  let query = Object.entries(params).map(([key, val]) => `${key}=${encodeURIComponent(val)}`).join('&');
  return fetch(`${mly.apiHost}${path}?client_id=${mly.apiKey}&${query}`)
    .then(response => response.json());
}

mly.goto = function(coord) {
  mly.mapOwnPositionMarker.setLatLng(coord);
  map.setView(coord);

  mly.apiCall("images", {closeto: `${coord.lng},${coord.lat}`, per_page: 1, usernames: mly.allowedUsernames})
    .then(jsonResponse => {
      let img = jsonResponse.features[0];
      if(!img) {
        console.warn(`Could not find image within 100m of lat=${coord.lat} lng=${coord.lng}`);
        mly.removeOwnPosition();
        return;
      }
      let imageKey = img.properties.key;
      mly.viewer.moveToKey(imageKey);
    });
}

// Whenever the image in the viewer changes, update our position on the map
mly.viewer.on(Mapillary.Viewer.nodechanged, (node) => {
  // this is the corrected value from Mapillary
  let latLon = [node.latLon.lat, node.latLon.lon];
  // original value as given by the GPS
  // let originalLatLon = [node.originalLatLon.lat, node.originalLatLon.lon];

  mly.mapOwnPositionMarker.setLatLng(latLon);
  if (!map.hasLayer(mly.mapOwnPositionMarker)) {
    mly.mapOwnPositionMarker.addTo(map);
  }
});

// Whenever the mouse is moved on the viewer, draw indicators on both map and
// viewer to show the position
mly.viewer.on(Mapillary.Viewer.mousemove, (event) => {
  let latLon = event.latLon;
  if (latLon == null) {
    return mly.removeIndicators();
  }

  // set map indicators
  const posLatLng = mly.mapOwnPositionMarker.getLatLng();
  const lineString = [
    [posLatLng.lat, posLatLng.lng],
    [latLon.lat, latLon.lon],
  ];
  mly.indicator.mapLine.setLatLngs(lineString);
  mly.indicator.mapMarker.setLatLng([latLon.lat, latLon.lon]);
  if (!map.hasLayer(mly.indicator.mapLine)) {
    mly.indicator.mapLine.addTo(map);
    mly.indicator.mapMarker.addTo(map);
  }

  // update viewer indicator
  const viewerMarker = new Mapillary.MarkerComponent.CircleMarker(
    "indicator-id",
    latLon,
    { color: mly.indicatorColor });
  mly.viewerMarkerComponent.add([viewerMarker]);
  mly.indicator.viewerMarker = viewerMarker;
});

mly.viewer.on(Mapillary.Viewer.mouseout, mly.removeIndicators);
