import { Viewer } from 'mapillary-js';

let updateTimer = null;

const START_LON = 9.993148;
const START_LAT = 53.550974;
const START_ZOOM = 10;
const START_IMAGE = 'c4B6txFX6Xgza8iWNFzSYw';
const START_ROUTE = null;

const readFromHash = () => {
  const s = window.location.hash.replace('#', '').split('/');
  return {
    zoom: +s[0] || START_ZOOM,
    lat: +s[1] || START_LAT,
    lon: +s[2] || START_LON,
    image: s[3] || START_IMAGE,
    route: s[4] || START_ROUTE
  }
}

class State {
  constructor(map) {
    this._status = readFromHash();
    console.debug("initial status", this._status);

    this._map = map;
    map.on('moveend', this._setMapPosition.bind(this));

    window.addEventListener('hashchange',  () => {
      this._status = readFromHash();
    });
  }

  selectedRoute() {
    return this._status.route;
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
    if(!routeName) return;
    this._status.route = routeName;
    this._slowUpdateHash();
  }

  imageSetter() {
    return this._setCurrentImage.bind(this);
  }

  routeSetter() {
    return this._setCurrentRoute.bind(this);
  }

  _slowUpdateHash() {
    if(updateTimer) return;
    updateTimer = setTimeout(() => {
      this._updateHash();
      updateTimer = null;
    }, 500)
  }

  _hashString() {
    const s = this._status;
    return `#${s.zoom}/${s.lat}/${s.lon}/${s.image}/${s.route || ""}`;
  }

  _updateHash() {
    window.history.replaceState(window.history.state, '', this._hashString());
  }
}

export { readFromHash };
export default State;
