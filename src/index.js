import "../base.scss";

import { map, addClickListener, renderIndicator } from "./map";
import { mlyViewer, addIndicatorListener, showCloseImage } from "./images";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";

const state = new State(map);
const invalidate = () => {
  if (mlyViewer.isNavigable) mlyViewer.resize();
  map.resize();
}

addClickListener(showRoute, showCloseImage, state.routeSetter(), invalidate);
addIndicatorListener(renderIndicator, state.imageSetter());

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

document.querySelector("#header h2").addEventListener("click", () => {
  showRoute()
  state.resetRoute();
});
