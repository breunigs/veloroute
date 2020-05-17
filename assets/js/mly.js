const state = document.getElementById("control").dataset;
const settings = document.getElementById("settings").dataset;

import * as Mapillary from 'mapillary-js';

const initialImg = state.img;
const mly = new Mapillary.Viewer(
  'mly',
  settings.mapillaryApiKey,
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

mly.setFilter(['in', 'sequenceKey'] + settings.seqs.split(" "));

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
