const draw = new MapboxDraw({
  controls: {
    combine_features: false,
    uncombine_features: false,
    line_string: false
  }
});

function round(num) {
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
  const trackInfo = document.getElementById("linkInfoHelper").dataset;

  let text = `<.m bounds="${round(bounds.minLon)},${round(bounds.minLat)},${round(bounds.maxLon)},${round(bounds.maxLat)}"`;
  if (pos) text += ` lon={${round(pos[0])}} lat={${round(pos[1])}} dir="${trackInfo.videoDir}" ref="${trackInfo.videoId}"`;
  text += ">";

  console.log(text);
  navigator.clipboard.writeText(text);
}

class CopyLinkButton {
  onAdd(map, cs) {
    this.map = map;
    this.container = document.getElementsByClassName('mapboxgl-ctrl-group')[0];
    const button = this._createButton()
    this.container.appendChild(button);
    return this.container;
  }

  _createButton() {
    const el = window.document.createElement('button')
    el.className = 'mapbox-gl-draw_ctrl-draw-btn mapbox-gl-draw_combine';
    el.title = 'Copy Link';
    el.addEventListener('click', logLink);
    this._setup = true;
    return el;
  }

  onRemove() {
    this._container.parentNode.removeChild(this._container);
    this._map = undefined;
  }
}


window.map.addControl(draw, 'top-left');
window.map.addControl(new CopyLinkButton({}), 'top-left')

document.querySelector(".mapbox-gl-draw_trash").addEventListener("click", draw.deleteAll)
