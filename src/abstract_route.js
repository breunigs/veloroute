const scrollbox = document.getElementById('routes');
const info = document.getElementById('info');
const body = document.getElementsByTagName("body")[0];

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

  async showRoute(routeName) {
    if(routeName && routeName.startsWith("quality")) this._loadQuality();

    let currentPage = null;
    body.classList.forEach(c => {
      if(c.startsWith("page-")) currentPage = c;
    });

    if(!routeName) routeName = 'index';
    body.classList.replace(currentPage, `page-${routeName.split("/")[0]}`)

    // scroll back to top when switching "tabs". The scroll state isn't kept per
    // tab, but rather as a "37%" across all instances.
    scrollbox.scrollTop = 0;
  };
}

export default AbstractRoute;
