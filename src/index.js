import "../base.scss";

import { addMoveListener } from "./map"
// import { leafletTextPath } from "./leaflet.textpath";
// import { map, init as initRaster } from "./raster";
// import { mapillary } from "./mapillary";
// import { leafletHash } from "./leaflet.hash";
// import { qualityExport } from "./quality";

// initRaster();
// const hash = L.hash(map);

addMoveListener((route) => {
  for(let el of document.querySelectorAll(".desc")) {
    el.style.display = 'none';
  }
  document.getElementById(`desc${route.name}`).style.display = 'block';
});
