import MapboxDraw from "@mapbox/mapbox-gl-draw"
import '@mapbox/mapbox-gl-draw/dist/mapbox-gl-draw.css'

const draw = new MapboxDraw({
  controls: {
    combine_features: false,
    uncombine_features: false,
    line_string: true,
    trash: false,
  }
});

function round(num: number) {
  return Math.round(num * 1000000) / 1000000;
}

function logLink() {
  let bounds = {
    minLon: 180,
    maxLon: -180,
    minLat: 90,
    maxLat: -90
  };
  let pos = null;

  for (let feat of draw.getAll().features) {
    const type = feat.geometry.type;
    const coords = type === 'Polygon' ? feat.geometry.coordinates[0] : [feat.geometry.coordinates];
    for (let coord of coords) {
      bounds = {
        minLon: Math.min(bounds.minLon, coord[0]),
        maxLon: Math.max(bounds.maxLon, coord[0]),
        minLat: Math.min(bounds.minLat, coord[1]),
        maxLat: Math.max(bounds.maxLat, coord[1]),
      };
    }
    if (type === 'Point') pos = feat.geometry.coordinates;
  }
  const trackInfo = document.getElementById("linkInfoHelper")?.dataset;

  const boundsStr = `bounds="${round(bounds.minLon)},${round(bounds.minLat)},${round(bounds.maxLon)},${round(bounds.maxLat)}"`;

  let text;
  if (pos) {
    const ref = trackInfo?.videoId ? `"${trackInfo.videoId}"` : "{@ref}"
    text = `<.v ${boundsStr} lon={${round(pos[0])}} lat={${round(pos[1])}} dir="${trackInfo?.videoDir}" ref=${ref}>`
  } else {
    text = `<.m ${boundsStr}>`
  }

  console.log(text);
  navigator.clipboard.writeText(text);
}

function onAdd(that: any, map: any, title: string, icon: string, action: () => void) {
  that.map = map;
  that.container = document.querySelector('.maplibregl-ctrl-top-left .mapboxgl-ctrl-group');

  const button = window.document.createElement('button')
  button.className = `mapbox-gl-draw_ctrl-draw-btn mapbox-gl-draw_${icon}`;
  button.title = title;
  button.addEventListener('click', action);

  that.container.appendChild(button);
  return that.container;
}

class CopyLinkButton {
  onAdd(map: any) {
    return onAdd(this, map, 'Copy Video Ref Markup (internal usage)', 'combine', logLink)
  }

  onRemove() {
    // not supported
  }
}

class DeleteAllButton {
  onAdd(map: any) {
    return onAdd(this, map, 'Alle Zeichnungen löschen', 'trash', draw.deleteAll)
  }

  onRemove() {
    // not supported
  }
}

window.map.addControl(draw, 'top-left');
window.map.addControl(new DeleteAllButton(), 'top-left')
window.map.addControl(new CopyLinkButton(), 'top-left')
