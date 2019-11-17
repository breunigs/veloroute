import "../base.scss";

import { map, addRouteClickListener, renderIndicator, createMarker } from "./map";
import AbstractRoute from "./abstract_route";
import State from './state';
import Swap from './swap';
import { addRouteChangeListener } from './state';

const state = new State(map);
const imagesPromise = import(/* webpackChunkName: "images" */ './images');
const abstractRoute = new AbstractRoute(imagesPromise, state, createMarker);

addRouteClickListener(state.routeSetter());
addRouteChangeListener(abstractRoute.showRoute);

const scrollTo = (selector) => {
  document.querySelector(selector).scrollIntoView({block: "start", behavior: "smooth"});
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
  if(anchor.hasAttribute('download') || anchor.href.endsWith(".zip") || anchor.href.endsWith(".pdf") || anchor.href.endsWith(".atom")) return;

  const body = document.getElementsByTagName('body')[0];
  if(!anchor.href) return;

  const url = new URL(anchor.href);
  if(url.origin !== location.origin) return;
  const path = url.pathname.substr(1);

  if(anchor.classList.contains('place')) {
    scrollTo('#map');
    let m;
    if(anchor.dataset.bbox) {
      console.debug("fitting to bounds in data attr");
      map.fitBounds(anchor.dataset.bbox.split(","), {maxZoom: anchor.dataset.maxzoom || 14});
    } else if(m = anchor.href.match(/(\d*)#([\d.]+)\/([\d.]+)\/([\d.]+)(?:\/|$)([a-zA-Z0-9-_]*)/)) {
      console.debug("flying to coords in href");
      map.flyTo({center: [m[4], m[3]], zoom: m[2]});
      if(m[1] && m[5]) {
        imagesPromise.then(({setActiveImage}) => setActiveImage(path, m[5]));
      }
    } else {
      console.debug(`Cannot find attributes on place ${anchor.textContent} that would know where to pan map (${anchor}).`)
    }
    ev.preventDefault();
    return;
  }


  if(anchor.classList.contains('newImgLink')) {
    let m = anchor.href.match(/#([\d.]+)\/([\d.]+)\/([\d.]+)\/([^/]+)$/);
    if(m) {
      map.flyTo({center: [m[3], m[2]], zoom: m[1]});
    }
    state.routeSetter()(path);
    imagesPromise.then(({playFromImage}) => playFromImage(path, m[4]));
    ev.preventDefault();
    return;
  }

  if(path === "" && url.hash != "") {
    scrollTo(url.hash);
    return ev.preventDefault();
  }

  if(path.match(/^(projekt|changes|bau|quality|quality\/[0-9a-z-]+|\d|1[01234]|blog\/[0-9a-z_-]+)$/) || path === "") {
    ev.preventDefault();
    state.routeSetter()(path);
    if(anchor.classList.contains('autoplay')) {
      imagesPromise.then(({startPlaybackWithDefaultBranch}) => {
        startPlaybackWithDefaultBranch(path);
      });
    }
    if(url.hash != "") {
      scrollTo(url.hash);
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
  map.on('movestart', (evt) => {
    // We only care about events directly triggered through interacting with the
    // map, i.e. ignore events triggered through map.jumpTo and the like.
    if(evt.originalEvent) {
      stopPlayback();
    }
  });
});
