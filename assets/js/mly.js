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
      marker: false,
      sequence: false,
      zoom: false,
    }
  }
);

mly._navigator.stateService.setSpeed(1.9);
window.mly = mly;

const routeComponent = mly.getComponent('route');
let prevSeqs = "";
let paths = [];
const advanceSlideshow = () => {
  if (paths.length === 0) {
    return deactivateSlideshow();
  }
  routeComponent.configure({ paths: paths, playing: true });
  mly.moveToKey(paths[0].startKey);
}

const deactivateSlideshow = () => {
  if (!routeComponent.activated) {
    return;
  }
  console.debug("stopping slideshow");
  routeComponent.stop();
  mly.deactivateComponent('route');
  paths = [];
}

const handleImageUpdates = () => {
  if (state.sequence == "") {
    deactivateSlideshow();
    mly.moveToKey(state.img);
    prevSeqs = "";
    return;
  }

  if (prevSeqs == state.sequence) {
    return;
  }
  prevSeqs = state.sequence;

  const refs = state.sequence.split(" ");
  console.debug("updating image sequence, starting from img", refs[1]);

  paths = [];
  for (let i = 0; i < refs.length - 2; i += 3) {
    paths.push({
      sequenceKey: refs[i],
      startKey: refs[i + 1],
      stopKey: refs[i + 2],
      infoKeys: []
    });
  }
  advanceSlideshow(paths);
  mly.activateComponent('route');
}

mly.on(Mapillary.Viewer.navigablechanged, () => {
  console.debug("mly loaded initially with", initialImg);
  document.getElementById("mlyPlaceholder").style.display = 'none';
  handleImageUpdates();
});

mly.on(Mapillary.Viewer.nodechanged, (node) => {
  console.debug("mly loaded", node.key)

  if (paths[0] && node.key === paths[0].stopKey) {
    console.info("end of sequence, manually shifting")
    routeComponent.stop();
    paths.shift();
    advanceSlideshow(paths);
  }

  window.pushEvent("mly-nodechanged", { img: node.key, routePlaying: !!routeComponent })
});

window.addEventListener("resize", () => mly.resize());
window.mlyStateChanged = handleImageUpdates;
mly.on(Mapillary.Viewer.click, () => window.pushEvent("sld-playpause", {}))
