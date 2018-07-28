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
const swap1 = document.getElementById("swap1");
const swap2 = document.getElementById("swap2");
const swap = () => {
  const ch1 = swap1.childNodes[0];
  const ch2 = swap2.childNodes[0];
  swap1.appendChild(ch2);
  swap2.appendChild(ch1);
  invalidate();
}
swapBtn.addEventListener("click", swap);

document.querySelector("#header h2").addEventListener("click", () => {
  showRoute()
  state.resetRoute();
});

const main = document.getElementById("main");
const cellPhoneWorkaround = async function() {
  const hidden = main.offsetParent === null;
  if(!hidden) return;
  // The main view is hidden, which means the width is too small to display
  // everything. Swap map and image on initial load, which seems to make more
  // sense.
  swap();
  // Exchange swap icon, hopefully this makes more sense as "replace" instead of
  // "switch positions"
  swapBtn.value = '📷/🗺';
}
cellPhoneWorkaround();
