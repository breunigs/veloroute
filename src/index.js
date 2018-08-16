import "../base.scss";

import { map, addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality } from "./map";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";
import Swap from './swap';
import { addRouteChangeListener } from './state';

const state = new State(map);


addRouteClickListener(state.routeSetter());
addRouteChangeListener(showRoute, toggleQuality);
addQualityClickListener((_name, _lngLat, _oneway, properties) => {
  import(/* webpackChunkName: "quality" */ './quality').then(({quality}) => {
    quality(properties);
  });
});

for(let el of document.querySelectorAll(".routing td a:not(.icon)")) {
  el.addEventListener('click', evt => {
    const placeName = evt.target.textContent;
    map.fitBounds(places[placeName], {maxZoom: 14.5});
  });
}

for(let el of document.querySelectorAll(".routing td a.icon")) {
  el.addEventListener('click', evt => {
    const routeName = evt.target.textContent;
    showRoute(routeName);
  });
}

showRoute(state.selectedRoute());


const infoLinks = document.querySelectorAll(".show-main-text");
for (let i = 0; i < infoLinks.length; i++) {
  infoLinks[i].addEventListener("click", state.routeResetter());
}
const qualityLinks = document.querySelectorAll(".show-quality");
for (let i = 0; i < qualityLinks.length; i++) {
  qualityLinks[i].addEventListener("click", () => {
    state.routeSetter()("quality");
  });
}

import(/* webpackChunkName: "images" */ './images')
.then(({mlyViewer, addIndicatorListener, showCloseImage}) => {
  addIndicatorListener(renderIndicator, state.imageSetter());
  new Swap(map, mlyViewer);
  addRouteClickListener(showCloseImage);
  addQualityClickListener(showCloseImage);
});
