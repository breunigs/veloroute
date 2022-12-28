import "./search_handler"

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

let Hooks = {};
Hooks.control = {
  mounted() {
    console.log("mounted");
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    if (!pushEventQueued) return;
    for (let i = 0; i < pushEventQueued.length; i++) {
      console.log("Pushing queued event ", pushEventQueued[i]);
      this.pushEvent(pushEventQueued[i][0], pushEventQueued[i][1]);
    }
    pushEventQueued = null;
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
  hadPopState: false,
  lastPage: undefined,
  scrollPositions: {},

  saveScrollPos() {
    // console.log("scroll", `this.scrollPositions[${window.location.pathname}]`, "=", this.el.scrollTop)
    this.scrollPositions[window.location.pathname] = this.el.scrollTop
    this.lastPage = window.location.pathname
  },

  maybeRestoreScroll() {
    const restore = this.scrollPositions[window.location.pathname]
    if (restore === undefined) return
    // console.log("scroll", "restoring", window.location.pathname, "to", restore)
    this.el.scrollTop = restore
  },

  mounted() {
    window.addEventListener("popstate", _event => {
      // console.log("scroll", "popstate")
      this.hadPopState = true
    });

    let scrollTimer = null
    this.el.addEventListener("scroll", _e => {
      clearTimeout(scrollTimer)
      scrollTimer = setTimeout(() => this.saveScrollPos(), 100)
    }, {
      passive: true
    })
  },

  updated() {
    // need to wait for new element to be updated before we can scroll
    requestAnimationFrame(() => {
      if (this.hadPopState) {
        // console.log("scroll", "restoring because of popState")
        this.maybeRestoreScroll()
        this.hadPopState = false
        return
      }

      if (this.lastPage != window.location.pathname) {
        // console.log("scroll", "resetting on new page navigation")
        this.scrollPositions[window.location.pathname] = 0
        this.maybeRestoreScroll()
      }
    })
  }
}

Hooks.LazyLoadJS = {
  mounted() {
    this.el.pushEvent = (event, args) => {
      this.pushEventTo(this.el, event, args)
    }
    this.check()
  },
  reconnected() {
    this.check()
  },
  check() {
    const path = this.el.dataset.lazyLoadJs;
    import(path).then(() => {
      const cb = this.el.dataset.lazyLoadCallback;
      if (cb) window[cb](this.el);
    })
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
import "./plausible"
