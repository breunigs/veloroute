let updateTimer = null;

const START_LON = 9.993148;
const START_LAT = 53.550974;
const START_ZOOM = 10;
const START_IMAGE = 'c4B6txFX6Xgza8iWNFzSYw';
const START_ROUTE = null;

const readFromHash = () => {
  const s = window.location.hash.replace('#', '').split('/');
  const routeFromPath = window.location.pathname.substr(1);
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
    this._status = readFromHash();
    this._routeChanged();
    console.debug("initial status", this._status);

    this._map = map;
    map.on('moveend', this._setMapPosition.bind(this));

    window.addEventListener('hashchange',  () => {
      this._status = readFromHash();
      this._routeChanged();
    });
  }

  selectedRoute() {
    return this._status.route;
  }

  currentImage() {
    return this._status.image;
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

  _setCurrentRoute(routeName) {
    if(!routeName) return this._resetRoute();
    this._status.route = routeName;
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
    if(updateTimer) window.clearTimeout(updateTimer);
    window.history.replaceState(window.history.state, '', this._buildUrl());
  }

  _routeChanged() {
    console.debug(`route changed to: ${this._status.route}`)
    routeChangeListeners.forEach((f) => f(this._status.route));
  }
}

export { readFromHash, addRouteChangeListener };
export default State;
