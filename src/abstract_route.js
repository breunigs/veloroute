import { isMobileView } from './utils_web';

const scrollbox = document.getElementById('routes');
const info = document.getElementById('info');
const body = document.getElementsByTagName("body")[0];

class AbstractRoute {
  constructor(state, map) {
    this._map = map;

    this.showRoute = this.showRoute.bind(this)

    this.showRoute(state.selectedRoute());
  }

  async showRoute(routeName) {
    if(!routeName) routeName = 'index';
    const parts =routeName.split("/");

    let newPage = "page-" + parts[0];
    let elemId = "desc" + parts[0];

    if(newPage == "page-blog") {
      newPage += "-" + parts[1];
      elemId = "desc-blog-"+parts[1];
    }

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

    if(isMobileView(body)) {
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

    const elem = document.getElementById(elemId);
    if(elem && elem.dataset.bounds) {
      console.debug("zooming to bounds from page");
      this._map.fitBounds(elem.dataset.bounds.split(","), { padding: 100, maxZoom: 17 });
    }
  };
}

export default AbstractRoute;
