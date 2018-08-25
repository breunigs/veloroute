import "../base.scss";

import { map, addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality, createMarker } from "./map";
import AbstractRoute from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";
import Swap from './swap';
import { addRouteChangeListener } from './state';

const state = new State(map);
const imagesPromise = import(/* webpackChunkName: "images" */ './images');
const abstractRoute = new AbstractRoute(imagesPromise, state, createMarker);

addRouteClickListener(state.routeSetter());
addRouteChangeListener(abstractRoute.showRoute, toggleQuality);

const scrollTo = (selector) => {
  document.querySelector(selector).scrollIntoView({block: "start", behavior: "smooth"});
}

document.addEventListener('click', ev => {
  if(ev.defaultPrevented) return;
  if(ev.altKey || ev.ctrlKey || ev.metaKey || ev.shiftKey) return;

  let anchor = null;
  for (let n = ev.target; n.parentNode; n = n.parentNode) {
    if (n.nodeName !== 'A') continue;
    anchor = n;
    break;
  }
  if(!anchor || !anchor.href) return;
  if(anchor.hasAttribute('download')) return;

  const url = new URL(anchor.href);
  if(url.origin !== location.origin) return;

  if(anchor.classList.contains('place')) {
    const placeName = anchor.textContent;
    scrollTo('#map');
    map.fitBounds(places[placeName], {maxZoom: 14.5});
    ev.preventDefault();
    return;
  }

  const path = url.pathname.substr(1);
  if(path === "" && url.hash != "") {
    scrollTo(url.hash);
    return ev.preventDefault();
  }

  if(path.match(/^(quality|\d|1[01234])$/) || path === "") {
    ev.preventDefault();
    return state.routeSetter()(path);
  }
  // give some debugging info
  fetch(`/broken/link?${anchor.href}`)
  ev.preventDefault();
}, false);


imagesPromise.then(({mlyViewer, addIndicatorListener, showCloseImage}) => {
  addIndicatorListener(renderIndicator, state.imageSetter());
  new Swap(map, mlyViewer);
  addRouteClickListener(showCloseImage);
  addQualityClickListener(showCloseImage);
});
