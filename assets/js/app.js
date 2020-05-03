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

// live view
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

let state = {};
let prevState = {};
const control = document.getElementById("control");
function updateState() {
  state = control.dataset;
  console.log(state);
}
updateState();
console.log("Initial State From Server: ", state)

const parsedHash = location.hash.substr(1).split("/");
if(parsedHash[3]) {
  state.img = parsedHash[3];
}
if(parsedHash.length >= 3) {
  state.zoom = parsedHash[0];
  state.lat = parsedHash[1];
  state.lon = parsedHash[2];
}
console.log("Initial State After Hash: ", state)


let pushEventHandle = null;
let pushEventQueued = [];
function pushEvent(event, payload) {
  if(!pushEventHandle) {
    console.log("Queueing", event, "until mounted:", payload);
    pushEventQueued.push([event, payload]);
    return
  }

  console.log("Pushing", event, payload);
  pushEventHandle(event, payload);
}
window.pushEvent = pushEvent;

let loadMly = function() {
  const script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = state.mlyJs;
  document.getElementsByTagName('head')[0].appendChild(script);
  loadMly = null;
}

let Hooks = {};
Hooks.control = {
  mounted() {
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    if(!pushEventQueued) return;
    for(let i=0; i < pushEventQueued.length; i++) {
      console.log("Pushing queued event ", event);
      this.pushEvent(pushEventQueued[i][0], pushEventQueued[i][1]);
    }
    pushEventQueued = null;
  },

  beforeUpdate() {
    prevState = state;
  },

  updated() {
    updateState();
    if(state.mlyJs && loadMly) loadMly();
    if(typeof mlyStateChanged === "function") { mlyStateChanged() }
  }
}


let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
window.liveSocket = liveSocket;
liveSocket.connect()
// liveSocket.enableDebug()
liveSocket.enableLatencySim(200)

// mapbox
import mapboxgl from 'mapbox-gl';
mapboxgl.accessToken = state.mapboxAccessToken;

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

// mobile gui
document.getElementById("switcher").addEventListener("click", () => {
  if(window.scrollX < 100) {
    window.scrollBy(1000, 0);
  } else {
    window.scrollBy(-1000, 0);
  }
})




import "./checkwebgl"
