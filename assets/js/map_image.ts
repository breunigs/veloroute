import { Protocol } from "pmtiles";
const protocol = new Protocol({ metadata: true });
window.mlgl.addProtocol('pmtiles', protocol.tile);

window.addEventListener("map:styleSwitched", show)
window.addEventListener("phx:show_map_image", update)


// keep in sync with basemap/constants.ex
const flyToSpeed = 0.7

const map = window.map

const minZoom = 14
const maxZoom = minZoom + 3
const fadeInRule = ["interpolate", ["linear"], ["zoom"], minZoom, 0, maxZoom, 1]
const layerName = "mapimage-pmtiles";
let imageData: ShowMapImageEventDetail | null = null;
let worker: ReturnType<typeof setTimeout> | null = null;

function update(event: Event) {
  imageData = (event as CustomEvent<ShowMapImageEventDetail>).detail
  show()

  const expire = imageData.show ? "Fri, 31 Dec 9999" : "Thu, 01 Jan 1970"
  document.cookie = `show_map_image=1; expires=${expire} 00:00:00 GMT; SameSite=Strict; Secure`;
}

function maybeZoomToBbox(bbox: maplibregl.LngLatBounds) {
  const current = map.getZoom()
  const desired = Math.max(maxZoom, current)
  if (current >= desired) return

  const viewport = map.getBounds()
  const s = Math.max(viewport.getSouth(), bbox.getSouth())
  const w = Math.max(viewport.getWest(), bbox.getWest())
  const n = Math.min(viewport.getNorth(), bbox.getNorth())
  const e = Math.min(viewport.getEast(), bbox.getEast())
  if (s < n && w < e) bbox = new window.mlgl.LngLatBounds([w, s, e, n]);

  map.flyTo({
    center: bbox.getCenter(),
    zoom: desired,
    speed: flyToSpeed,
  });
}

function zoom() {
  const layer = map.getSource(layerName) as maplibregl.RasterTileSource
  if (layer && ('tileBounds' in layer)) {
    maybeZoomToBbox(layer.tileBounds.bounds)
    return
  }
  map.once('sourcedata', zoom)
}

function cleanup() {
  if (map.getLayer(layerName)) map.removeLayer(layerName)
  if (map.getSource(layerName)) map.removeSource(layerName)
}

function showPMTiles() {
  // PMTiles has a bug that doesn't trigger the map's normal idle event,
  // preventing the preview from being hidden when map images are toggled on at
  // load
  if (!map.loaded() && document.getElementById("mapPreview")) {
    map.once('idle', () => showPMTiles())
    return
  }

  cleanup()
  if (!imageData) return

  map.addSource(layerName, {
    type: "raster",
    url: `pmtiles://${imageData.url}`,
    minzoom: minZoom,
    attribution: imageData.attribution,
  });

  map.addLayer({
    id: layerName,
    source: layerName,
    type: 'raster',
    minzoom: minZoom,
    paint: {
      // workaround for the map flickering on load otherwise
      "raster-opacity": 0
    }
  })

  worker = setTimeout(() => {
    map.setPaintProperty(layerName, "raster-opacity", fadeInRule, { validate: false })
  }, 350)

  if (imageData.zoom) map.once('sourcedata', zoom);
}

function show() {
  if (!imageData) return
  if (worker) clearTimeout(worker)

  if (!imageData.url) {
    if (map.getLayer(layerName))
      map.setPaintProperty(layerName, "raster-opacity", 0, { validate: false })
    // allow enough time to fade out
    worker = setTimeout(cleanup, 350)
    return
  }

  return showPMTiles()
}
