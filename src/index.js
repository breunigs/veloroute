import "../base.scss";

import { map, addMoveListener, addClickListener, renderIndicator } from "./map";
import { mlyViewer, addIndicatorListener, showCloseImage } from "./images";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";

const state = new State(map);

// addMoveListener(showRoute, state.routeSetter());
addClickListener(showRoute, showCloseImage, state.routeSetter());
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

const swap = document.getElementById("swap");
const swap1 = document.getElementById("swap1");
const swap2 = document.getElementById("swap2");
swap.addEventListener("click", () => {
  const ch1 = swap1.childNodes[0];
  const ch2 = swap2.childNodes[0];
  console.log("swapping", ch1, ch2)

  swap1.appendChild(ch2);
  swap2.appendChild(ch1);

  if (mlyViewer.isNavigable) mlyViewer.resize();
  map.invalidateSize();
});

