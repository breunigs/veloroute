const settings = document.getElementById("settings").dataset;

import * as Mapillary from 'mapillary-js';

const initialImg = state.img;
const mly = new Mapillary.Viewer(
  'mly',
  settings.mapillaryApiKey,
  initialImg, {
    component: {
      attribution: true,
      bearing: false,
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
let stuckDetector = null;
let lastImageLoadDurations = [5000, 5000, 5000, 5000, 5000];
let lastImageStart = null;
let currentlyViewedImg = null;
const advanceSlideshow = () => {
  if (paths.length === 0) {
    return deactivateSlideshow();
  }
  console.debug("advancing slideshow to", paths[0].startKey)
  routeComponent.configure({
    paths: paths,
    playing: true
  });
  mly.moveToKey(paths[0].startKey);
  routeComponent.play();
}

const deactivateSlideshow = () => {
  if (!routeComponent.activated) {
    return;
  }
  console.debug("stopping slideshow");
  lastImageStart = null;
  routeComponent.stop();
  mly.deactivateComponent('route');
  paths = [];
  prevSeqs = "";
}

const fixSlideshow = () => {
  if (!routeComponent.activated) {
    return;
  }
  console.warn("resetting slideshow from state.img=", state.img, "and paths", paths[0]);
  routeComponent.stop();
  if (paths[0] && currentlyViewedImg.sequenceKey === paths[0].sequenceKey) {
    paths[0].startKey = currentlyViewedImg.key;
  }
  advanceSlideshow();
}

const handleImageUpdates = () => {
  if (state.sequence == "") {
    deactivateSlideshow();
    mly.moveToKey(state.img);
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
  lastImageStart = null;
  advanceSlideshow();
  mly.activateComponent('route');
}

const fixBeingStuck = () => {
  resetStuckDetector();

  if (state.sequence == "") {
    return;
  }

  try {
    const copyImgDur = lastImageLoadDurations.slice();
    const curImgKey = currentlyViewedImg.key;
    const curImgSeq = currentlyViewedImg.sequenceKey;
    const copyPath = Object.assign({}, paths[0]);
    window.setTimeout(() => {
      console.warn("apparently Mapillary was stuck at",
        "\n",
        "imgBefore =", curImgKey,
        "seqBefore =", curImgSeq,
        "\n",
        "imgAfter =", currentlyViewedImg.key,
        "seqAfter =", currentlyViewedImg.sequenceKey,
        "\n",
        "pathBefore:", copyPath,
        "\n",
        "pathNow:", paths[0],
        "\n",
        "Having these load times:", copyImgDur)

      // report issues where we're still stuck
      if (typeof Sentry !== "undefined" && curImgKey === currentlyViewedImg.key) {
        Sentry.captureMessage("mapillary stuck");
      }
    }, 1500)
  } catch (e) {
    console.error(e);
  }

  fixSlideshow();
}

const resetStuckDetector = () => {
  if (stuckDetector === null) return;
  clearTimeout(stuckDetector);
  stuckDetector = null;
}

mly.on(Mapillary.Viewer.navigablechanged, () => {
  console.debug("mly loaded initially with", initialImg);
  document.getElementById("mlyPlaceholder").style.display = 'none';
  handleImageUpdates();
});

mly.on(Mapillary.Viewer.nodechanged, (node) => {
  currentlyViewedImg = node;
  resetStuckDetector();
  const avg = lastImageLoadDurations.reduce((i, c) => i + c, 0) / lastImageLoadDurations.length;
  const considerStuckAfter = Math.max(300, avg * 3);
  stuckDetector = setTimeout(fixBeingStuck, considerStuckAfter);

  if (lastImageStart) {
    const diff = Date.now() - lastImageStart;
    lastImageLoadDurations.shift()
    lastImageLoadDurations.push(diff)
  }
  lastImageStart = Date.now();

  if (paths[0] && node.key === paths[0].stopKey) {
    console.info("end of sequence, manually shifting")
    routeComponent.stop();
    paths.shift();
    advanceSlideshow();
  }

  window.pushEvent("mly-nodechanged", {
    img: node.key,
    imgSeq: node.sequenceKey,
    routePlaying: !!routeComponent
  })
});

window.addEventListener("resize", () => mly.resize());
window.mlyStateChanged = handleImageUpdates;
mly.on(Mapillary.Viewer.click, () => window.pushEvent("sld-playpause", {}))
