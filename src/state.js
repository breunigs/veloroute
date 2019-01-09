let updateTimer = null;

const START_LON = 9.993148;
const START_LAT = 53.550974;
const START_ZOOM = 10;
const START_IMAGE = 'c4B6txFX6Xgza8iWNFzSYw';
const START_ROUTE = null;

const readFromHash = () => {
  const s = window.location.hash.replace('#', '').split('/');
  const routeFromPath = window.location.pathname.substr(1).replace('.html', '');
  return {
    zoom: +s[0] || START_ZOOM,
    lat: +s[1] || START_LAT,
    lon: +s[2] || START_LON,
    image: s[3] || START_IMAGE,
    route: routeFromPath || s[4] || START_ROUTE
  }
}

let routeChangeListeners = [];
const addRouteChangeListener = (...funcs) => {
  funcs.forEach(f => routeChangeListeners.push(f));
}

class State {
  constructor(map) {
    this._preventHistoryUpdate = false;
    this._status = readFromHash();
    this._routeChanged();
    console.debug("initial status", this._status);

    this._map = map;
    map.on('moveend', this._setMapPosition.bind(this));

    window.addEventListener('hashchange',  () => {
      this._status = readFromHash();
      this._routeChanged();
    });

    window.addEventListener('popstate',  (evt) => {
      console.debug("popstate", document.location.pathname)
      this._preventHistoryUpdate = true;
      this._setCurrentRoute(document.location.pathname.substr(1));
    });
  }

  selectedRoute() {
    return this._status.route;
  }

  getShortcomingName() {
    if(this._status.route.startsWith("quality/")) {
      return this._status.route.substr(8);
    }

    return null;
  }

  currentImage() {
    return this._status.image;
  }

  _toPoly(coords) {
    return {
        'type': 'Feature',
        'geometry': {
          'type': 'Polygon',
          'coordinates': [coords]
        }
      }
  }

  showPolygon(coords) {
    if(!coords) return this.hidePolygon();

    let asPoly = this._toPoly(coords);
    if(!this._map.getSource('source-polygon')) {
      this._map.addSource('source-polygon', { type: 'geojson', data: asPoly });
    } else {
      this._map.getSource('source-polygon').setData(asPoly);
    }
    if(!this._map.getLayer("layer-polygon")) {
      this._map.addLayer({
        'id': 'layer-polygon',
        'type': 'fill',
        'source': 'source-polygon',
        'layout': {},
        'paint': {
          'fill-color': '#888',
          'fill-opacity': 0.5
        }
      }, 'route-casing');
    }

    this._map.setLayoutProperty('layer-polygon', 'visibility', 'visible');

    let bounds = new mapboxgl.LngLatBounds(coords[0], coords[0]);
    bounds = coords.reduce((bounds, coord) => bounds.extend(coord), bounds);
    this._map.fitBounds(bounds, { padding: 100, maxZoom: 17 });
  }

  hidePolygon() {
    if(!this._map.getLayer("layer-polygon")) return;
    this._map.setLayoutProperty('layer-polygon', 'visibility', 'none');
  }

  _setMapPosition() {
    // as per from https://github.com/mapbox/mapbox-gl-js/blob/master/src/ui/hash.js#L56
    const center = this._map.getCenter(),
      zoom = Math.round(this._map.getZoom() * 100) / 100,
      // derived from equation: 512px * 2^z / 360 / 10^d < 0.5px
      precision = Math.ceil((zoom * Math.LN2 + Math.log(512 / 360 / 0.5)) / Math.LN10),
      m = Math.pow(10, precision),
      lng = Math.round(center.lng * m) / m,
      lat = Math.round(center.lat * m) / m;

    this._status.lon = lng;
    this._status.lat = lat;
    this._status.zoom = zoom;

    this._slowUpdateHash();
  }

  _setCurrentImage(_lon, _lat, _bearing, key) {
    this._status.image = key;
    this._slowUpdateHash();
  }

  _setCurrentRoute(routeName, _lngLat, eventType) {
    if(eventType != "quality") this.hidePolygon();
    if(!routeName) return this._resetRoute();
    this._status.route = eventType === "quality" ? "quality" : routeName;
    this._routeChanged();
    this._updateHash();
  }

  _resetRoute() {
    this._status.route = null;
    this._routeChanged();
    this._updateHash();
  }

  imageSetter() {
    return this._setCurrentImage.bind(this);
  }

  routeSetter() {
    return this._setCurrentRoute.bind(this);
  }

  routeResetter() {
    return this._resetRoute.bind(this);
  }

  _slowUpdateHash() {
    if(updateTimer) return;
    updateTimer = setTimeout(() => {
      this._updateHash();
      updateTimer = null;
    }, 500)
  }

  _buildUrl() {
    const s = this._status;
    return `/${s.route || ""}#${s.zoom}/${s.lat}/${s.lon}/${s.image}`;
  }

  _updateHash() {
    if(updateTimer) {
      window.clearTimeout(updateTimer);
      updateTimer = null;
    }
    window.history.replaceState(window.history.state, '', this._buildUrl());
  }

  _routeChanged() {
    console.debug(`route changed to: ${this._status.route}`)
    if(!this._preventHistoryUpdate) {
      window.history.pushState(null, "", this._buildUrl());
    }
    this._preventHistoryUpdate = false
    routeChangeListeners.forEach((f) => f(this._status.route));
  }
}

export { readFromHash, addRouteChangeListener };
export default State;
