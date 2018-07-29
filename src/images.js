import { ImageSize, Viewer } from 'mapillary-js';
import { readFromHash } from './state';
import data from '../routes/geo/images.json';

const API_KEY = 'MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2';
const slider = document.getElementById("slider");
const prev = document.getElementById("prev");
const next = document.getElementById("next");
const direction = document.getElementById("direction");
const playstop = document.getElementById("playstop");
const controls = document.getElementById("controls");

let status = {
  routeName: readFromHash().route,
  direction: "outward",
  branch: null,
  image:  readFromHash().image
}

let updateInProgress = false;

const route = () => data[status.routeName];
const images = () => {
  const r = route();
  return r ? r[`${status.direction}_${status.branch}`] : null;
}

let alertShown = false;
const handleSliderMove = (avoidListenerUpdates) => {
  console.debug("Reacting to slider move. Current status: ", status);
  const pos = slider.value;

  const i = images();
  if(!i) {
    console.debug("could not find images, disabling everything")
    prev.disabled = true;
    next.disabled = true;
    playstop.disabled = true;
    if(!alertShown) {
      alert("Für diesen Teil sind noch keine Bilder eingepflegt. Bitte noch etwas Geduld.\n\nDiese Nachricht wird nicht nochmal angezeigt.")
      alertShown = true;
    }
    return;
  }

  const key = i.keys[pos];
  const loc = i.loc[pos];

  prev.disabled = pos == 0;
  next.disabled = pos == i.keys.length-1;
  playstop.disabled = pos == i.keys.length-1;

  if(status.image === key) return;
  status.image = key;
  triggerImageUpdate();

  // The data here is the corrected "Structure From Motion" data, but it doesn't
  // take image-to-image transitions into account. Therefore, only update it
  // when immediate feedback is required, e.g. when the slider is being dragged.
  if(!avoidListenerUpdates) {
    indicatorListeners.forEach((f) => f(loc[0], loc[1], loc[2], key));
  }
}

const setActiveRoute = (routeName, branch, imgIndex) => {
  if(!routeName || !branch) {
    console.debug("missing route info, disabling controls");
    status.routeName = null;
    status.branch = null;
    slider.setAttribute("max", 0);
    slider.value = 0;
    slider.disabled = true;
    handleSliderMove();
    controls.classList.add("hidden");
    return;
  }

  status.routeName = routeName;
  if(branch.indexOf("outward") === 0) {
    status.direction = "outward";
    status.branch = branch.replace("outward_", "");
  } else if (branch.indexOf("inward") === 0) {
    status.direction = "inward";
    status.branch = branch.replace("inward_", "");
  } else {
    status.branch = branch;
  }

  console.debug("Setting Active Route. Status: ", status);
  slider.disabled = false;
  slider.setAttribute("max", images().keys.length - 1);
  slider.value = imgIndex || 0;
  controls.classList.remove("hidden");
  handleSliderMove();
}

const restoreBranch = () => {
  for(const branch in route()) {
    const imgKeys = route()[branch].keys;
    const idx = imgKeys.indexOf(status.image);
    if(idx >= 0) return setActiveRoute(status.routeName, branch, idx);
  }
}
restoreBranch();

const viewer = new Viewer("mly", API_KEY, status.image, {
  component: {
    attribution: true,
    bearing: false,
    cache: {
      depth: {
        pano: 0,
        sequence: 4,
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
});

let indicatorListeners = [];
const addIndicatorListener = (...funcs) => {
  funcs.forEach(f => indicatorListeners.push(f));
}

const distEuklid = (lng1, lat1, lng2, lat2) => Math.sqrt((lng1-lng2)**2 + (lat1-lat2)**2)

const changeDirection = () => {
  const idx = images().keys.indexOf(status.image);
  const loc = images().loc[idx];
  const lngLat = {lng: loc[0], lat: loc[1]};
  showCloseImage(status.routeName, lngLat, true);
}

const stepSlider = (amount) => {
  slider.value = slider.value*1 + amount;
  handleSliderMove(true);
}

let playTimeout = null;
const playShowNextImage = () => {
  if(!updateInProgress) stepSlider(+1);
  if(slider.disabled) return;
  playTimeout = setTimeout(playShowNextImage, 500);
}

const stopPlayback = () => {
  clearTimeout(playTimeout);
  // prevent Mapillary from showing the next image, in case it is currently
  // loading one
  viewer.moveToKey(status.image);
  playTimeout = null;
  playstop.textContent = '▶';
}

const handlePlayStop = () => {
  if(playTimeout != null) return stopPlayback();
  playstop.textContent = '■';
  playShowNextImage();
}

const handleEsc = (evt) => {
  evt = evt || window.event;
  let isEscape = "key" in evt && (evt.key == "Escape" || evt.key == "Esc");
  isEscape = isEscape || evt.keyCode == 27;
  if(isEscape) stopPlayback();
}

const cutOffDist = 0.0001;
const closestImageIndex = (images, lngLat) => {
  let distSoFar = Infinity;
  let candidateIdx = null;

  for(const idx in images.loc) {
    const img = images.loc[idx];
    const newDist = distEuklid(lngLat.lng, lngLat.lat, img[0], img[1]);
    if(newDist >= distSoFar) continue;
    distSoFar = newDist;
    candidateIdx = idx;
    if(distSoFar <= cutOffDist) break;
  }
  return { idx: candidateIdx, dist: distSoFar };
}

let prevLngLat = null;
const showCloseImage = (routeName, lngLat, ignoreCurrent) => {
  stopPlayback();
  status.routeName = routeName;

  if(prevLngLat && prevLngLat.lng === lngLat.lng && prevLngLat.lat === lngLat.lat) {
    console.debug("Previous lngLat the same as current, attempting to switch direction instead.");
    return changeDirection();
  }
  prevLngLat = lngLat;

  const current = `${status.direction}_${status.branch}`;
  let distances = {};

  for(const branch in route()) {
    if(ignoreCurrent && branch === current) continue;
    distances[branch] = closestImageIndex(route()[branch], lngLat);
  }

  console.debug("Candidates for close images: ", distances)

  if(current in distances && distances[current].dist <= cutOffDist)
    return setActiveRoute(routeName, current, distances[current].idx);

  let closestBranch = null;
  let closestIdx = null;
  let distSoFar = Infinity;
  for(const branch in distances) {
    if(distances[branch].dist >= distSoFar) continue;
    closestBranch = branch;
    closestIdx = distances[branch].idx;
    distSoFar = distances[branch].dist;
  }

  return setActiveRoute(routeName, closestBranch, closestIdx);
}


let updateInProgressResetter = null;
const triggerImageUpdate = (triggerdThroughLoad) => {
  if(!viewer.isNavigable && !triggerdThroughLoad) {
    console.log("Mapillary not yet loaded, delaying jump until it is");
    viewer.on(Viewer.navigablechanged, () => {
      console.log("Mapillary loaded, jumping now");
      triggerImageUpdate(true);
    });
    return;
  }

  if(updateInProgress) return;
  updateInProgress = true;
  updateInProgressResetter = setTimeout(() => { updateInProgress = false }, 10000);
  viewer.moveToKey(status.image);
}

const hasLoadedDesiredImage = (loadedImage) => {
  // console.debug("Mapillary loaded node: ", loadedImage);
  // console.debug("Desired node:          ", status.image);

  if(updateInProgressResetter) clearTimeout(updateInProgressResetter);
  updateInProgress = false;
  if(loadedImage == status.image) return true;

  triggerImageUpdate();
  return false;
}

let currentNode = null;
viewer.on(Viewer.nodechanged, function (node) {
  currentNode = node;
  if(hasLoadedDesiredImage(node.key)) {
    indicatorListeners.forEach((f) => f(node.latLon.lon, node.latLon.lat, node.ca, node.key));
  }
});
viewer.on(Viewer.bearingchanged, function (bearing) {
  if(hasLoadedDesiredImage(currentNode.key)) {
    indicatorListeners.forEach((f) => f(currentNode.latLon.lon, currentNode.latLon.lat, bearing, currentNode.key));
  }
});
window.addEventListener("resize", () => viewer.resize());
next.addEventListener("click", () => { stopPlayback(); stepSlider(+1) });
prev.addEventListener("click", () => { stopPlayback(); stepSlider(-1) });
direction.addEventListener("click", changeDirection);
slider.addEventListener("input", () => handleSliderMove(false));
playstop.addEventListener("click", handlePlayStop);
document.addEventListener("keydown", handleEsc);


export { viewer as mlyViewer, addIndicatorListener, showCloseImage };
