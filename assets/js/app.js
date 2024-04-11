import "./search_handler"

let pushEventHandle = null;
let pushEventQueued = [];

function pushEvent(event, payload) {
  if (!pushEventHandle) {
    // console.log("Queueing", event, "until mounted:", payload);
    pushEventQueued.push([event, payload]);
    return
  }

  // console.log("Pushing", event, payload);
  pushEventHandle(event, payload);
}
window.pushEvent = pushEvent;

let Hooks = {};
Hooks.control = {
  mounted() {
    // console.log("mounted");
    window.dispatchEvent(new Event("global:mounted"));
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    if (!pushEventQueued) return;
    for (let i = 0; i < pushEventQueued.length; i++) {
      // console.log("Pushing queued event ", pushEventQueued[i]);
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

let scrollPositionFromPopState = null;
let scrollLastPage = window.location.pathname;
Hooks.ScrollReset = {
  saveScrollPos() {
    // console.log("scroll", `saveScrollPos ${window.location.pathname}`, "=", this.el.scrollTop)
    let state = history.state || {}
    state.sidebarScroll = this.el.scrollTop
    history.replaceState(state, "", window.location.href);
    scrollLastPage = window.location.pathname;
  },

  maybeRestoreScroll() {
    // console.log("scroll", "maybeRestoreScroll", scrollPositionFromPopState)
    let restore = scrollPositionFromPopState
    if (restore === null) {
      requestAnimationFrame(() => {
        // console.log("scroll", "maybeScrollToTop", scrollLastPage, window.location.pathname)
        if (scrollLastPage != window.location.pathname) this.el.scrollTop = 0
      })

      return
    }

    // it seems the scrollTop is not always correctly updated, so change the
    // position by a tiny amount to force browsers to actually scroll. This
    // seems to fix the issue.
    if (this.el.scrollTop == restore) {
      restore += 1
    }
    requestAnimationFrame(() => {
      // console.log("scroll", "restoring", "to", restore)
      this.el.scrollTop = restore
      this.saveScrollPos()
    })
    scrollPositionFromPopState = null
  },

  mounted() {
    // console.log("scroll", "mounted")

    window.addEventListener("popstate", event => {
      if (!event.state) return
      // console.log("scroll", "popstate =", event.state.sidebarScroll)
      scrollPositionFromPopState = event.state.sidebarScroll || 0
    });

    let scrollTimer = null
    this.el.addEventListener("scroll", _e => {
      clearTimeout(scrollTimer)
      scrollTimer = setTimeout(() => this.saveScrollPos(), 100)
    }, {
      passive: true
    })

    this.maybeRestoreScroll()
  },

  updated() {
    // console.log("scroll", "updated")
    this.maybeRestoreScroll()
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

window.addEventListener("phx:impressum", (e) => alert(e.detail.text))

import "./mobilegui"
import "./plausible"
