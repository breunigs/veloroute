const fKey = 'F'.charCodeAt(0);
const rathausmarktCoord = {longitude: 9.993148, latitude: 53.550974};
const styleURL = 'https://unpkg.com/mapbox-gl-geocoder@2.0.1/dist/mapbox-gl-geocoder.css';

class Geocoder {
  constructor(map, accessToken, hamburgBounds) {
    this._map = map;
    this._accessToken = accessToken;
    this._hamburgBounds = hamburgBounds;
    this._setup = false;
    this._input = null;

    window.onkeydown = this.keyListener.bind(this);
  }

  keyListener(e) {
    if(e.ctrlKey && e.keyCode == fKey) {
      e.preventDefault();
      this.setup();
      this.focus();
    }
  }

  focus() {
    if(this._input) {
      this._input.focus();
      this._input.select();
    }
  }

  setup() {
    if(this._setup) return;
    this._setup = true;

    const link = document.createElement('link');
    link.href = styleURL;
    link.type = 'text/css';
    link.rel = 'stylesheet';
    document.getElementsByTagName('head')[0].appendChild(link);

    import(/* webpackChunkName: "mapbox-gl-geocoder"  */ 'mapbox-gl-geocoder')
    .then((mod) => {
      this._map.addControl(new mod.default({
        accessToken: this._accessToken,
        bbox: this._hamburgBounds,
        proximity: rathausmarktCoord,
      }));

      this._input = document.querySelector('.mapboxgl-ctrl-geocoder input')
      this.focus();
    })
  }
}

export default Geocoder;
