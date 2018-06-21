import { leafletTextPath } from "./leaflet.textpath";
import { raster, map } from "./raster";
import { mapillary } from "./mapillary";
import { leafletHash } from "./leaflet.hash";
import { qualityExport } from "./quality";

const hash = L.hash(map);

console.log(leafletHash, leafletTextPath, raster, mapillary, qualityExport);
