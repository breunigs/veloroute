import { Protocol } from "pmtiles";
const protocol = new Protocol({ metadata: true });
window.mlgl.addProtocol('pmtiles', protocol.tile);

const map = window.map;
const sourceId = "kreuzungsskizzen";
const layerId = "kreuzungsskizzen-line";

if (!map.getSource(sourceId)) {
  map.addSource(sourceId, {
    type: "vector",
    url: "pmtiles:///assets/basemap/kreuzungsskizzen/kreuzungsskizzen.pmtiles",
    attribution: '<a href="https://metaver.de/trefferanzeige?docuuid=15A962E2-F699-4ACA-98A6-F21E8AD81A9B" target="_blank">Freie und Hansestadt Hamburg, Polizei Hamburg</a> (<a href="https://www.govdata.de/dl-de/by-2-0" target="_blank">dl-de/by-2-0</a>)',
  });
}

if (!map.getLayer(layerId)) {
  map.addLayer({
    id: layerId,
    type: "line",
    source: sourceId,
    "source-layer": "kreuzungsskizzen",
    minzoom: 17,
    layout: {
      "line-cap": "round",
      "line-join": "round",
      "visibility": "visible",
    },
    paint: {
      "line-color": "#888888",
      "line-width": ["interpolate", ["linear"], ["zoom"], 17, 0.6, 19, 1.5],
      "line-opacity": ["interpolate", ["linear"], ["zoom"], 17, 0, 18, 1],
    },
  }, "sort-line-road");
}
