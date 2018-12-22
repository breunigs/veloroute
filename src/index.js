import "../base.scss";

import { map, addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality, createMarker } from "./map";
import AbstractRoute from "./abstract_route";
import places from '../routes/geo/places.json';
import State from './state';
import Swap from './swap';
import { addRouteChangeListener } from './state';

const state = new State(map);
const imagesPromise = import(/* webpackChunkName: "images" */ './images');
const abstractRoute = new AbstractRoute(imagesPromise, state, createMarker);

addRouteClickListener(state.routeSetter());
addQualityClickListener(state.routeSetter());
addRouteChangeListener(abstractRoute.showRoute, toggleQuality);

const scrollTo = (selector) => {
  document.querySelector(selector).scrollIntoView({block: "start", behavior: "smooth"});
}

const toggleMapColors = (layer, colorProperty) => {
  try {
    map.setPaintProperty(`layer-${layer}`, 'line-color', { "type": "identity", "property": colorProperty });
  } catch(e) {} // layer doesn't exist -- most likely not loaded
}

document.addEventListener('click', ev => {
  if(ev.defaultPrevented) return;
  if(ev.altKey || ev.ctrlKey || ev.metaKey || ev.shiftKey || (ev.button && ev.button != 0)) return;

  let anchor = null;
  for (let n = ev.target; n.parentNode; n = n.parentNode) {
    if (n.nodeName !== 'A') continue;
    anchor = n;
    break;
  }
  if(!anchor) return
  if(anchor.hasAttribute('download') || anchor.href.endsWith(".zip") || anchor.href.endsWith(".pdf")) return;

  const body = document.getElementsByTagName('body')[0];
  if(anchor.classList.contains('vision-colorblind')) {
    body.classList.add("colorblind");
    toggleMapColors('quality', 'c_blind');
  }
  if(anchor.classList.contains('vision-normal')) {
    body.classList.remove("colorblind");
    toggleMapColors('quality', 'c_norm');
  }
  if(!anchor.href) return;

  const url = new URL(anchor.href);
  if(url.origin !== location.origin) return;

  if(anchor.classList.contains('place')) {
    const placeName = anchor.textContent;
    scrollTo('#map');
    let m;
    if(places[placeName]) {
      console.debug("fitting bounds to place name");
      map.fitBounds(places[placeName], {maxZoom: 14.5});
    } else if(m = anchor.href.match(/#([\d.]+)\/([\d.]+)\/([\d.]+)$/)) {
      console.debug("flying to coords in href");
      map.flyTo({center: [m[3], m[2]], zoom: m[1]});
    } else {
      console.debug(`Cannot find place ${placeName} in presolved list and it doesn't seem to be a mapref href (${anchor.href}).`)
    }
    ev.preventDefault();
    return;
  }

  const path = url.pathname.substr(1);
  if(path === "" && url.hash != "") {
    scrollTo(url.hash);
    return ev.preventDefault();
  }

  if(path.match(/^(projekt|quality|quality\/[0-9a-z-]+|\d|1[01234])$/) || path === "") {
    ev.preventDefault();
    state.routeSetter()(path);
    if(anchor.classList.contains('autoplay')) {
      imagesPromise.then(({startPlaybackWithDefaultBranch}) => {
        startPlaybackWithDefaultBranch(path);
      });
    }
    return;
  }
  // give some debugging info
  fetch(`/broken/link?${anchor.href}`)
  ev.preventDefault();
}, false);


imagesPromise.then(({mlyViewer, addIndicatorListener, showCloseImage, stopPlayback}) => {
  addIndicatorListener(renderIndicator, state.imageSetter());
  new Swap(map, mlyViewer);
  addRouteClickListener(showCloseImage);
  addQualityClickListener(showCloseImage);
  map.on('movestart', (evt) => {
    // We only care about events directly triggered through interacting with the
    // map, i.e. ignore events triggered through map.jumpTo and the like.
    if(evt.originalEvent) {
      stopPlayback();
    }
  });
});
