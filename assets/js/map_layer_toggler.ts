import { Map as MapboxMap } from "maplibre-gl";

// toggle if MapLibre should verify the expressions we pass to it. Disable for
// production deploy for a slight performance improvement.
const validate = false

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
  highlight?: string,
}

type highlighterFunction = null | ((map: MapboxMap, layerName: string) => void);

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
    const layer = map.getLayer(layerName);
    if (!layer) console.error("undefined layerName", layerName)
    visibleMinZooms[layerName] = layer?.minzoom || 1;
  }

  minZoom = Math.max(minZoom, visibleMinZooms[layerName]);
  map.setLayerZoomRange(layerName, minZoom, 24);
}

function updateMapPrimitive(map: MapboxMap, layerNames: string[], drawPrimitive: string, active: boolean, highlighter: highlighterFunction = null, showOnHighZoom: boolean = false): void {
  const minZoom = active ? 1 : hiddenMinZoom;

  layerNames.forEach(layerName => {
    const isTunnel = layerName.indexOf("tunnel") >= 0
    const opacity = opacityRule(active, isTunnel)
    minZoomForLayer(map, layerName, minZoom)

    const visible = active || showOnHighZoom ? "visible" : "none";
    map.setLayoutProperty(layerName, "visibility", visible, {
      validate: validate
    });

    map.setPaintProperty(layerName, `${drawPrimitive}-opacity`, opacity, {
      validate: validate
    });

    if (highlighter) highlighter(map, layerName)

    if (active && drawPrimitive == "line" && layerName.indexOf("line") >= 0) {
      const tunnel = isTunnel ? "tunnel" : "road"
      map.moveLayer(layerName, `sort-${drawPrimitive}-${tunnel}`);
    }
  });
}

function maybeToggleLayers(map: MapboxMap | null, mapDetail: mapEventDetail) {
  if (!map) return
  const highlight = mapDetail.highlight || "no-route-set"
  map.setFilter('route-highlight', ['==', ['get', 'route_id'], highlight])

  if (!mapDetail.layers) return
  for (const layer of mapDetail.layers) {
    updateMapPrimitive(map, layer.icon, "icon", layer.active, fadeIcons(highlight));
    updateMapPrimitive(map, layer.outline, "line", layer.active);
    updateMapPrimitive(map, layer.line, "line", layer.active, fadeLines(highlight), true);
    updateMapPrimitive(map, layer.line.map(l => `${l}-tunnel`), "line", layer.active, fadeLines(highlight), true);
    updateMapPrimitive(map, layer.fill, "fill", layer.active);
  }
}

function fadeLines(highlight: string): highlighterFunction {
  return (map: MapboxMap, layerName: string) => {
    map.setPaintProperty(layerName, "line-color",
      ["case",
        // non overlap match
        ["==", highlight, ["get", "route_id"]],
        ["get", "color"],
        // overlap match
        ["in", `|${highlight}|`, ["get", "overlap_route_ids"]],
        ["get", "color"],
        // fallback
        ["coalesce", ["get", "color_faded"], ["get", "color"]]
      ], { validate: validate })
  }
}

let fadeIconLayers: Record<string, boolean> = {}
function fadeIcons(highlight: string): highlighterFunction {
  return (map: MapboxMap, layerName: string) => {
    // heuristic to see if there icons are auto-colored. Needs to be cached
    // since it'll be overwritten with our more complicated logic.
    if (fadeIconLayers[layerName] === undefined) {
      fadeIconLayers[layerName] = map.getLayoutProperty(layerName, "icon-image").includes("{color}")
    }
    if (fadeIconLayers[layerName] === false) return

    map.setLayoutProperty(layerName, "icon-image",
      ["concat",
        ["get", "type"],
        ["literal", "_"],
        ["case",
          // highlight
          ["==", highlight, ["get", "route_id"]],
          ["get", "color"],
          // non-highlight
          ["coalesce", ["get", "color_faded"], ["get", "color"]]
        ]
      ], { validate: validate }
    )
  }
}

let currentStyleId = document.getElementById('map')?.dataset.style
function maybeSwitchStyle(map: MapboxMap | null, mapDetail: mapEventDetail) {
  if (!map) return false
  if (!mapDetail.styles) return false

  for (const style of mapDetail.styles) {
    if (!style.active) continue
    if (style.id === currentStyleId) continue
    console.log("switching map style to", style.id)
    currentStyleId = style.id
    map.setStyle(style.id, { validate: false })
    window.plausible('switchStyle')
  }

  return true
}

export { maybeSwitchStyle, maybeToggleLayers }
