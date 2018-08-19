const scrollbox = document.getElementById('routes');
const gpxlink = document.getElementById('gpxlink');
const extras = document.getElementById('extras');
const info = document.getElementById('info');

class AbstractRoute {
  constructor(imagesPromise, state, createMarker) {
    this._state = state;
    this._imagesPromise = imagesPromise;
    this._createMarker = createMarker;
    this._qualityPromise = null;

    this.showRoute = this.showRoute.bind(this)

    this.showRoute(state.selectedRoute());
  }

  _loadQuality() {
    if(this._qualityPromise) return this._qualityPromise;
    this._qualityPromise = import(/* webpackChunkName: "quality" */ './quality');
    this._qualityPromise.then(({Quality}) => new Quality(this._state, this._imagesPromise, this._createMarker));
    return this._qualityPromise;
  }

  _hideAll() {
    for(let el of document.querySelectorAll(".desc")) {
      el.style.display = 'none';
    }
    info.style.display = 'none';
  }

  async showRoute(routeName) {
    if(routeName === "quality") this._loadQuality();

    this._hideAll();
    const id = routeName ? `desc${routeName}` : 'info';
    document.getElementById(id).style.display = 'block';

    if(routeName && routeName.match(/[0-9]/)) {
      extras.style.display = 'block';
      gpxlink.setAttribute('href', `routes/geo/route${routeName}.gpx`);
    } else {
      extras.style.display = 'none';
    }

    // scroll back to top when switching "tabs". The scroll state isn't kept per
    // tab, but rather as a "37%" across all instances.
    scrollbox.scrollTop = 0;
  };
}

export default AbstractRoute;
