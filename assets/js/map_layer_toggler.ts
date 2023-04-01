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

function opacityRule(active: boolean, tunnel: boolean) {
  const opacity = tunnel ? 0.5 : 1
  if (active) return opacity

  return ["interpolate", ["linear"],
    ["zoom"], hiddenMinZoom, 0, 20, opacity
  ]
}

let visibleMinZooms: { [id: string]: number; } = {};
function minZoomForLayer(map: MapboxMap, layerName: string, minZoom: number): void {
  if (!visibleMinZooms[layerName]) {
    const layer = map.getLayer(layerName) as Layer;
    if (!layer) console.error("undefined layerName", layerName)
    visibleMinZooms[layerName] = layer.minzoom || 1;
  }

  minZoom = Math.max(minZoom, visibleMinZooms[layerName]);
  map.setLayerZoomRange(layerName, minZoom, 24);
}

function updateMapPrimitive(map: MapboxMap, layerNames: string[], drawPrimitive: string, active: boolean, showOnHighZoom: boolean = false): void {
  const minZoom = active ? 1 : hiddenMinZoom;

  layerNames.forEach(layerName => {
    const isTunnel = layerName.indexOf("tunnel") >= 0
    const opacity = opacityRule(active, isTunnel)
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
      const tunnel = isTunnel ? "tunnel" : "road"
      map.moveLayer(layerName, `sort-${drawPrimitive}-${tunnel}`);
    }
  });
}

function maybeToggleLayers(map: MapboxMap, mapDetail: mapEventDetail) {
  if (!mapDetail.layers) return
  console.log("toggling map layer", mapDetail.layers)

  for (const layer of mapDetail.layers) {
    updateMapPrimitive(map, layer.icon, "icon", layer.active);
    updateMapPrimitive(map, layer.outline, "line", layer.active);
    updateMapPrimitive(map, layer.line, "line", layer.active, true);
    updateMapPrimitive(map, layer.line.map(l => `${l}-tunnel`), "line", layer.active, true);
    updateMapPrimitive(map, layer.fill, "fill", layer.active);
  }
}

let currentStyleId = document.getElementById('map')?.dataset.style
function maybeSwitchStyle(map: MapboxMap, mapDetail: mapEventDetail) {
  if (!mapDetail.styles) return false

  for (const style of mapDetail.styles) {
    if (!style.active) continue
    if (style.id === currentStyleId) continue
    console.log("switching map style to", style.id)
    currentStyleId = style.id
    map.setStyle(style.id)
    window.plausible('switchStyle')
  }

  return true
}

export { maybeSwitchStyle, maybeToggleLayers }
