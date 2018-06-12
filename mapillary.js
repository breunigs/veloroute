var mly = {}

mly.apiKey = 'MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2';
mly.currentPicture = null;
mly.apiHost = 'https://a.mapillary.com/v3/'; // TODO: can this be extracted from `Mapillary`?
mly.allowedUsernames='breunigs'
mly.indicatorColor = '#000';
mly.ownPositionColor = '#000';
mly.viewer = new Mapillary.Viewer(
  'mly',
  mly.apiKey,
  null,
  {
    baseImageSize: Mapillary.ImageSize.Size320,
    component: {
      marker: { visibleBBoxSize: 100 },
      cache: false,
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
  mapLine: L.polyline([[0, 0], [0, 0]], { color: mly.indicatorColor, weight: 0}),
  viewerMarker: null,
}
mly.mapOwnPositionMarkerSize = 5;
mly.mapOwnPositionMarker = L.circleMarker([0, 0], { radius: mly.mapOwnPositionMarkerSize, color: mly.ownPositionColor });
mly.isFirstNodeChange = true;

// setup
mly.viewer.setFilter(["in", "username", mly.allowedUsernames]); // doesn't work for "moveCloseTo"
mly.viewerMarkerComponent = mly.viewer.getComponent('marker');

mly.removeOwnPosition = function() {
  mly.mapOwnPositionMarker.removeFrom(map);
  // TODO: switch to "sorry no images here" mapillary view
}

mly.removeIndicators = function() {
  map.removeLayer(mly.indicator.mapLine);
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

mly.moveToKey = function(imageKey) {
  if(mly.viewer.isNavigable) return mly.viewer.moveToKey(imageKey);

  console.log("Mapillary not yet loaded, delaying jump until it is");
  mly.viewer.on(Mapillary.Viewer.navigablechanged, function() {
    console.log("Mapillary loaded, jumping now");
    mly.viewer.moveToKey(imageKey);
  });
  mly.viewer.deactivateCover();
}

mly.goto = function(coord) {
  mly.apiCall("images", {closeto: `${coord.lng},${coord.lat}`, per_page: 1, usernames: mly.allowedUsernames})
    .then(jsonResponse => {
      let img = jsonResponse.features[0];
      if(!img) {
        console.warn(`Could not find image within 100m of lat=${coord.lat} lng=${coord.lng}`);
        // mly.removeOwnPosition();
        return;
      }
      mly.moveToKey(img.properties.key);
      mly.mapOwnPositionMarker.setLatLng(coord);
    });
}

// Whenever the image in the viewer changes, update our position on the map
mly.viewer.on(Mapillary.Viewer.nodechanged, (node) => {
  console.log("Reacting to new Mapillary Image: ", node.key);
  // this is the corrected value from Mapillary
  let latLon = [node.latLon.lat, node.latLon.lon];
  // original value as given by the GPS
  // let originalLatLon = [node.originalLatLon.lat, node.originalLatLon.lon];
  mly.mapOwnPositionMarker.setLatLng(latLon);
  if (!map.hasLayer(mly.mapOwnPositionMarker)) {
    mly.mapOwnPositionMarker.addTo(map);
  }
  mly.currentPicture = node.key;

  // avoid changing the map on page load
  if(mly.isFirstNodeChange) {
    mly.isFirstNodeChange = false;
    return;
  }
  map.setView(latLon);
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
    [ // ensure we point in the direction, but always long enough so that we can
      // draw an arrow indicator
        posLatLng.lat + 100 * (latLon.lat - posLatLng.lat),
        posLatLng.lng + 100 * (latLon.lon - posLatLng.lng),
    ],
  ];
  mly.indicator.mapLine.setLatLngs(lineString);


  if (!map.hasLayer(mly.indicator.mapLine)) {
    mly.indicator.mapLine.addTo(map);
    mly.indicator.mapLine.setText('\u25BA', {
      repeat: false,
      offset: 4,
      attributes: {fill: mly.indicatorColor, dx: mly.mapOwnPositionMarkerSize + 1}
    });
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
mly.viewer.on(Mapillary.Viewer.navigablechanged, mly.viewer.resize);
window.addEventListener("resize", () => mly.viewer.resize());
