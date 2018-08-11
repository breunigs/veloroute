import "../base.scss";

import { map, addRouteClickListener, addQualityClickListener, renderIndicator, toggleQuality } from "./map";
import { mlyViewer, addIndicatorListener, showCloseImage } from "./images";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";
import { addRouteChangeListener } from './state';


const state = new State(map);
async function invalidate() {
  if (mlyViewer.isNavigable) mlyViewer.resize();
  map.resize();
}

addRouteClickListener(showCloseImage, state.routeSetter(), invalidate);
addIndicatorListener(renderIndicator, state.imageSetter());
addRouteChangeListener(showRoute, toggleQuality);
addQualityClickListener(showCloseImage, invalidate, (_name, _lngLat, _oneway, properties) => {
  document.getElementById("qualitydebug").innerHTML = JSON.stringify(properties, null, 2);
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

const swapBtn = document.getElementById("swap");
const main = document.getElementById("main");
const side = document.getElementById("side");
const swap = () => {
  // avoid grabbing textNodes
  const ch1 = main.querySelector('div');
  const ch2 = side.querySelector('div');
  main.appendChild(ch2);
  side.appendChild(ch1);
  invalidate();
}
swapBtn.addEventListener("click", swap);

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
