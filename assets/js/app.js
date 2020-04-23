// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// polyfill
import "mdn-polyfills/CustomEvent"
import "mdn-polyfills/String.prototype.startsWith"
import "mdn-polyfills/Array.from"
import "mdn-polyfills/NodeList.prototype.forEach"
import "mdn-polyfills/Element.prototype.closest"
import "mdn-polyfills/Element.prototype.matches"
import "mdn-polyfills/Node.prototype.remove"
import "child-replace-with-polyfill"
import "url-search-params-polyfill"
import "formdata-polyfill"
import "classlist-polyfill"
import "@webcomponents/template"
import "shim-keyboard-event-key"

// live view
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

// const control = document.getElementById("control");

// todo, read, apply and immediately push to Be
const parsedHash = location.hash.substr(1).split("/");
if(parsedHash[3]) {
  window.startImg = parsedHash[3];
}
if(parsedHash.length >= 3) {
  window.startZoom = parsedHash[0];
  window.startLonLat = [parsedHash[2], parsedHash[1]];
}

let state = {};
let prevState = {};
function updateState() {
  const attrs = document.getElementById("control").attributes;
  Object.getOwnPropertyNames(attrs).forEach(function (key, _index) {
    if(key.substr(0, 5) === "data-") {
      state[key.substr(5).replace(/-/g, "_")] = attrs[key].value;
    }
  });
}
updateState();
console.log("Initial State: ", state)


let Hooks = {};
Hooks.control = {
  mounted() {
    console.log("mounted");
  },

  beforeUpdate() {
    prevState = state;
  },

  updated() {
    updateState();
    mlyUpdateImg();
  }
}


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
window.liveSocket = liveSocket;
liveSocket.connect()

// mapbox
import mapboxgl from 'mapbox-gl';
mapboxgl.accessToken = window.mapbox_access_token;

const map = new mapboxgl.Map({
    container: 'map',
    maxBounds: state.bounds.split(","),
    center: [state.lon, state.lat],
    zoom: state.zoom,
    minZoom: 9,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/ck8hk6y7e0csv1ioh4oqdtybb',
    pitchWithRotate: false,
    dragRotate: false,
});
map.touchZoomRotate.disableRotation();

// mapillary
import * as Mapillary from 'mapillary-js';

const mly = new Mapillary.Viewer(
  'mly',
  state.mapillary_api_key,
  startImg,
  {
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
      cover: true,
      direction: false,
      keyboard: false,
      marker: false,
      sequence: false,
      zoom: false,
    }
  }
);

let mlyCoverIndicator = document.getElementsByClassName('CoverIndicator')[0];
let mlyLoaded = false;
mly.on(Mapillary.Viewer.navigablechanged, () => {
  mlyLoaded = true;
  mly.moveToKey(state['img']);
});
mly.on(Mapillary.Viewer.nodechanged, (node) => {
  // if(node.key !== state['img']) {

  // }
});

window.addEventListener("resize", () => mly.resize());
function mlyUpdateImg() {
  console.log("updating img");

  if(mlyCoverIndicator) {
    console.log("loading mly");
    let btn = mlyCoverIndicator;
    mlyCoverIndicator = null;
    btn.click()
    return;
  }

  if(mlyLoaded) {
    mly.moveToKey(state['img']);
  }
}

// mobile gui
document.getElementById("switcher").addEventListener("click", () => {
  if(window.scrollX < 100) {
    window.scrollBy(1000, 0);
  } else {
    window.scrollBy(-1000, 0);
  }
})

