import { ImageSize, Viewer } from 'mapillary-js';
import { readFromHash } from './state';

const API_KEY = 'MjFBX2pVMXN2aUlrSXFCVGlYMi11dzo4Yjk0NGY1MjMzYmExMzI2';

const viewer = new Viewer("mly", API_KEY, readFromHash().image, {
  baseImageSize: ImageSize.Size320,
  component: {
    marker: false,
    cache: true,
    cover: false,
    attribution: false,
    zoom: false,
    bearing: false,
    sequence: false,
    direction: false
  }
});

window.addEventListener("resize", () => viewer.resize());

let indicatorListeners = [];
const addIndicatorListener = (...funcs) => {
  funcs.forEach(f => indicatorListeners.push(f));
}

viewer.on(Viewer.nodechanged, function (node) {
  indicatorListeners.forEach((f) => f(node.latLon.lon, node.latLon.lat, node.ca, node.key));
});

export { viewer as mlyViewer, addIndicatorListener };
