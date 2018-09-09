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

  isMobileView() {
    return body.clientWidth <= 700;
  }

  async showRoute(routeName) {
    if(!routeName) routeName = 'index';
    let newPage = "page-" + routeName.split("/")[0];

    if(newPage === "page-quality") this._loadQuality();

    let currentPage = null;
    body.classList.forEach(c => {
      if(c.startsWith("page-")) currentPage = c;
    });

    const switchPage = () => {
      if(currentPage) {
        body.classList.replace(currentPage, newPage)
      } else {
        body.classList.add(newPage)
      }
    }

    if(this.isMobileView()) {
      const rectBefore = scrollbox.getBoundingClientRect();
      const routesBottomVisible = rectBefore.bottom-rectBefore.height < 0;

      switchPage();
      if(!routesBottomVisible) return;

      const rectAfter = scrollbox.getBoundingClientRect();
      const diff = Math.round(rectAfter.bottom - rectBefore.bottom);
      window.scrollBy(0, diff);
    } else {
      switchPage();
      // scroll back to top when switching "tabs". The scroll state isn't kept per
      // tab, but rather as a "37%" across all instances.
      if(currentPage !== newPage) scrollbox.scrollTop = 0;
    }
  };
}

export default AbstractRoute;
