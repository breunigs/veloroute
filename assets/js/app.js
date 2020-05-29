// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss"

import "./error_reporter"

// live view
import {Socket} from "phoenix"
import LiveSocket from "phoenix_live_view"

window.state = {};
let prevLocation = location.pathname;
function updateState() {
  if(prevLocation !== location.pathname) {
    document.getElementById("content").scroll(0, 0);
    prevLocation = location.pathname;
  }

  // XXX: the element might be replaced by liveview, need to search it every time
  window.state = document.getElementById("control").dataset;
  console.log(state);

  if(state.mlyJs && loadMly) loadMly();
  if(typeof window.mlyStateChanged === "function") { window.mlyStateChanged(); }
  if(typeof window.mapStateChanged === "function") { window.mapStateChanged(); }
  if(typeof window.loadingCb === "function") { window.loadingCb(); }
}
updateState();
console.log("Initial State From Server: ", state)

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

const hash = location.hash.substr(1);
if(hash != "") window.pushEvent("convert-hash", {hash: hash});

let loadMly = function() {
  console.log("loading mapillary");
  const script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = state.mlyJs;
  document.getElementsByTagName('head')[0].appendChild(script);
  loadMly = null;
}

window.mlyStateChanged = function() {
  const img = new Image();
  const url = "https://images.mapillary.com/" + state.img + "/thumb-1024.jpg";
  const imgKey = state.img;
  const placeholder = document.getElementById("mlyPlaceholder")
  const placeholderOuter = document.getElementById("mlyPlaceholderOuter")
  // both preload and the multiple BG image hack are required to avoid flashing
  // the background in-between image loads
  console.debug("preloading", url)
  placeholder.classList.add('loading');
  placeholderOuter.style.backgroundImage = "url("+url+")";
  img.onload = () => {
    if(imgKey != state.img) {
      // abort if another image was queued
      return;
    }

    console.debug("setting preloaded image as BG" , url)
    placeholder.style.backgroundImage = "url("+url+")";
    placeholderOuter.style.backgroundImage = "";
    placeholder.classList.remove('loading');
  }
  img.src = url;
}

let Hooks = {};
Hooks.control = {
  mounted() {
    console.log("mounted");
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    updateState();

    if(!pushEventQueued) return;
    for(let i=0; i < pushEventQueued.length; i++) {
      console.log("Pushing queued event ", event);
      this.pushEvent(pushEventQueued[i][0], pushEventQueued[i][1]);
    }
    pushEventQueued = null;
  },

  updated() {
    updateState();
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {hooks: Hooks, params: {_csrf_token: csrfToken}});
liveSocket.connect()
window.liveSocket = liveSocket;
// liveSocket.disableDebug()
// liveSocket.enableLatencySim(2000)

// mobile gui
document.getElementById("switcher").addEventListener("click", () => {
  const elm = document.getElementsByTagName("html")[0];
  if(elm.scrollLeft < 100) {
    elm.scrollBy(1000, 0);
  } else {
    elm.scrollBy(-1000, 0);
  }
})

import "./loading"
import "./checkwebgl"
