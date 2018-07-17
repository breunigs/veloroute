import "../base.scss";

import { map, addMoveListener, addClickListener } from "./map";
import places from '../routes/geo/places.json';
// import { leafletTextPath } from "./leaflet.textpath";
// import { map, init as initRaster } from "./raster";
// import { mapillary } from "./mapillary";
// import { leafletHash } from "./leaflet.hash";
// import { qualityExport } from "./quality";

// initRaster();
// const hash = L.hash(map);

const showRoute = (route) => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  document.getElementById(`desc${route.name}`).style.display = 'block';
};

addMoveListener(showRoute);
addClickListener(showRoute);

for(let el of document.querySelectorAll(".routing td a:not(.icon)")) {
  el.addEventListener('click', evt => {
    const placeName = evt.target.textContent;
    map.fitBounds(places[placeName], {maxZoom: 14.5});
  });
}

for(let el of document.querySelectorAll(".routing td a.icon")) {
  el.addEventListener('click', evt => {
    const routeName = evt.target.textContent;
    showRoute({name: routeName});
  });
}
