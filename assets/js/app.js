// import "./error_reporter"
import "./search_handler"

window.state = document.getElementById("control").dataset;

function updateState() {
  window.state = document.getElementById("control").dataset;

  if (typeof window.videoStateChanged === "function") {
    window.videoStateChanged();
  }
  if (typeof window.mapStateChanged === "function") {
    window.mapStateChanged();
  }
}

let pushEventHandle = null;
let pushEventQueued = [];

function pushEvent(event, payload) {
  if (!pushEventHandle) {
    console.log("Queueing", event, "until mounted:", payload);
    pushEventQueued.push([event, payload]);
    return
  }

  console.log("Pushing", event, payload);
  pushEventHandle(event, payload);
}
window.pushEvent = pushEvent;

const hash = location.hash.substr(1);
if (hash != "") window.pushEvent("convert-hash", {
  hash: hash
});

let Hooks = {};
Hooks.control = {
  mounted() {
    console.log("mounted");
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    updateState();

    if (!pushEventQueued) return;
    for (let i = 0; i < pushEventQueued.length; i++) {
      console.log("Pushing queued event ", pushEventQueued[i]);
      this.pushEvent(pushEventQueued[i][0], pushEventQueued[i][1]);
    }
    pushEventQueued = null;
  },

  updated() {
    updateState();
  }
}
Hooks.FocusSearchField = {
  mounted() {
    this.el.focus();
    this.el.selectionStart = this.el.selectionEnd = this.el.value.length;
    // this.el.select();
  }
}
Hooks.ScrollReset = {
  nextScrollPos: undefined,

  saveScrollPos(el) {
    const oldState = history.state || {};
    const newState = Object.assign(oldState, {
      scrollContent: el.scrollTop
    });
    history.replaceState(newState, "", window.location.href);
    // console.log("ScrollReset", "saveScrollPos", window.history.state, window.location.href)
  },

  mounted() {
    window.addEventListener("popstate", event => {
      this.nextScrollPos = event.state.scrollContent
      // console.log("ScrollReset", "popstate", window.history.state)
    });

    let scrollTimer = null
    this.el.addEventListener("scroll", _e => {
      clearTimeout(scrollTimer)
      scrollTimer = setTimeout(() => this.saveScrollPos(this.el), 100)
    }, {
      passive: true
    })

    this.saveScrollPos(this.el)
  },

  updated() {
    // console.log("ScrollReset", "updated", window.history.state, this.nextScrollPos)
    this.el.scrollTop = this.nextScrollPos || 0;
    this.nextScrollPos = undefined
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content");
let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  dom: {
    onBeforeElUpdated(from, to) {
      let attrToCopy = from.getAttribute("phx-ignore-attr");
      if (!attrToCopy) return;
      attrToCopy = attrToCopy.split(" ");
      for (let i = 0; i < attrToCopy.length; i++) {
        to.setAttribute(attrToCopy[i], from.getAttribute(attrToCopy[i]));
      }
    }
  },
  params: {
    _csrf_token: csrfToken
  }
});

// avoid unintentionally breaking archive.org
const hostname = window.location.hostname;
const isArchive = hostname.substring(hostname.length - 11) === "archive.org";
if (!isArchive) liveSocket.connect()

window.liveSocket = liveSocket;
// liveSocket.disableDebug()
// liveSocket.enableLatencySim(2000)

import "./mobilegui"
// import "./loading"
import "./plausible"
