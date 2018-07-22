import "../base.scss";

import { map, addMoveListener, addClickListener } from "./map";
import { mlyViewer } from "./images";
import { showRoute } from "./abstract_route";
import places from '../routes/geo/places.json';
import State from "./state";

const state = new State(map, mlyViewer, showRoute);

addMoveListener(showRoute, state.routeSetter());
addClickListener(showRoute, state.routeSetter());


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

state.restore();
