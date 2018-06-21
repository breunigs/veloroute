import "../base.scss";

import { leafletTextPath } from "./leaflet.textpath";
import { map, init as initRaster } from "./raster";
import { mapillary } from "./mapillary";
import { leafletHash } from "./leaflet.hash";
import { qualityExport } from "./quality";

initRaster();
const hash = L.hash(map);

console.log(leafletHash, leafletTextPath, mapillary, qualityExport);
