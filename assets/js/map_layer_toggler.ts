import { Map as MapboxMap, Layer } from "mapbox-gl";

type mapLayer =
  {
    name: string,
    active: boolean,
    line: string[],
    icon: string[],
    fill: string[],
    outline: string[],
  }

type mapStyle =
  {
    name: string,
    id: string,
    active: boolean,
  }

type mapEventDetail = {
  styles?: mapStyle[],
  layers?: mapLayer[],
}

const hiddenMinZoom = 11;
const hiddenOpacityRule = ["interpolate", ["linear"],
  ["zoom"], hiddenMinZoom, 0, 20, 1
];

// TODO: move to settings.ex
const layerAbove = {
  line: "detour-line",
  icon: "article-areas title"
}

let visibleMinZooms: { [id: string]: number; } = {};
function minZoomForLayer(map: MapboxMap, layerName: string, minZoom: number): void {
  if (!visibleMinZooms[layerName]) {
    const layer = map.getLayer(layerName) as Layer;
    visibleMinZooms[layerName] = layer.minzoom || 1;
  }

  minZoom = Math.max(minZoom, visibleMinZooms[layerName]);
  map.setLayerZoomRange(layerName, minZoom, 24);
}

function updateMapPrimitive(map: MapboxMap, layerNames: string[], drawPrimitive: string, active: boolean, showOnHighZoom: boolean = false): void {
  const opacity = active ? 1 : hiddenOpacityRule;
  const minZoom = active ? 1 : hiddenMinZoom;

  layerNames.forEach(layerName => {
    minZoomForLayer(map, layerName, minZoom)

    const visible = active || showOnHighZoom ? "visible" : "none";
    // @ts-ignore wrong signature in 3rd party types
    map.setLayoutProperty(layerName, "visibility", visible, {
      validate: false
    });

    // @ts-ignore wrong signature in 3rd party types
    map.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
      validate: false
    });

    if (active && drawPrimitive == "line" && layerName.indexOf("line") >= 0) {
      // console.log("moving", layerName, "above", layerAbove[drawPrimitive])
      map.moveLayer(layerName, layerAbove[drawPrimitive]);
    }
  });
}

function maybeToggleLayers(map: MapboxMap, layers: mapLayer[] | undefined) {
  if (!layers) return
  window.plausible('toggleLayer')
  console.log("toggling map layer")

  for (const layer of layers) {
    updateMapPrimitive(map, layer.icon, "icon", layer.active);
    updateMapPrimitive(map, layer.outline, "line", layer.active);
    updateMapPrimitive(map, layer.line, "line", layer.active, true);
    updateMapPrimitive(map, layer.fill, "fill", layer.active);
  }
}

function maybeSwitchStyle(map: MapboxMap, styles: mapStyle[] | undefined) {
  if (typeof styles === "undefined") return false

  for (const style of styles) {
    if (!style.active) continue
    map.setStyle('mapbox://styles/' + style.id)
    window.plausible('switchStyle')
    console.log("switching map style")
  }

  return true
}

function updateMap(map: MapboxMap, data: mapEventDetail) {
  if (maybeSwitchStyle(map, data.styles)) {
    map.on('style.load', () => {
      maybeToggleLayers(map, data.layers)
    })
  } else {
    maybeToggleLayers(map, data.layers)
  }
}

export { updateMap }