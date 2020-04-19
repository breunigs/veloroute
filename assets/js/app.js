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

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}});
liveSocket.connect()

// mapbox
import mapboxgl from 'mapbox-gl';
mapboxgl.accessToken = window.mapbox_access_token;

const map = new mapboxgl.Map({
    container: 'map',
    maxBounds: window.bounds,
    // center: [inital.lon, inital.lat],
    zoom: 10, // TODO read from hash
    minZoom: 10,
    maxZoom: 19,
    style: 'mapbox://styles/breunigs/ck8hk6y7e0csv1ioh4oqdtybb',
    pitchWithRotate: false,
    dragRotate: false,
});
map.touchZoomRotate.disableRotation();

// mapillary
import * as Mapillary from 'mapillary-js';

const mly = new Mapillary.Viewer(
  'mly', // id of container the viewer should mount to
  window.mapillary_api_key,
  'c4B6txFX6Xgza8iWNFzSYw', // start image
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

window.addEventListener("resize", () => mly.resize());

// mobile gui
document.getElementById("switcher").addEventListener("click", () => {
  if(window.scrollX < 100) {
    window.scrollBy(1000, 0);
  } else {
    window.scrollBy(-1000, 0);
  }
})

