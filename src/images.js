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

export { viewer as mlyViewer };
