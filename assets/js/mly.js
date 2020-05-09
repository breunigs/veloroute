const state = document.getElementById("control").dataset;

import * as Mapillary from 'mapillary-js';
if(!state.mapillaryApiKey) {
  console.error("Mapillary API key is missing: ", state);
}

const initialImg = state.img;
const mly = new Mapillary.Viewer(
  'mly',
  state.mapillaryApiKey,
  initialImg,
  {
    baseImageSize: Mapillary.ImageSize.Size320,
    basePanoramaSize: Mapillary.ImageSize.Size1024,
    component: {
      attribution: true,
      bearing: false,
      cache: {
        depth: {
          pano: 0,
          sequence: 3,
          step: 0,
          turn: 0
        }
      },
      cover: false,
      direction: false,
      keyboard: false,
      marker: true,
      sequence: false,
      zoom: false,
    }
  }
);

const sequences = document.getElementById("mly-seqs").dataset.seqs.split(" ");
mly.setFilter(['in', 'sequenceKey'] + sequences);

mly.on(Mapillary.Viewer.navigablechanged, () => {
  console.debug("mly loaded initially with" , initialImg);
  if(initialImg !== state.img) {
    console.debug("…moving it to", state.img)
    mly.moveToKey(state.img);
  }
  document.getElementById("mlyPlaceholder").style.display = 'none';
});
mly.on(Mapillary.Viewer.nodechanged, (node) => {
  console.debug("mly loaded", node.key)
  window.pushEvent("mly-nodechanged", {img: node.key})
});

window.addEventListener("resize", () => mly.resize());

window.mlyStateChanged = function() {
  console.debug("updating img to", state.img);
  mly.moveToKey(state.img);
}

mly.on(Mapillary.Viewer.click, () => window.pushEvent("sld-playpause", {}))
