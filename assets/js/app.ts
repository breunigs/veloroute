import "./search_handler"
import type { HooksOptions } from "phoenix_live_view";

let pushEventHandle: ((event: string, payload?: any) => Promise<any>) | null = null;
let pushEventQueued: Array<[string, any]> = [];

function pushEvent(event: string, payload: any) {
  if (!pushEventHandle) {
    // console.log("Queueing", event, "until mounted:", payload);
    pushEventQueued.push([event, payload]);
    if (!isArchive) liveSocket.connect()
    return
  }

  // console.log("Pushing", event, payload);
  pushEventHandle(event, payload);
}
window.pushEvent = pushEvent;

let Hooks: HooksOptions = {};
Hooks.control = {
  mounted() {
    window.dispatchEvent(new Event("global:mounted"));
    pushEventHandle = (evt, pay) => this.pushEvent(evt, pay);

    if (pushEventQueued.length === 0) return;
    for (let i = 0; i < pushEventQueued.length; i++) {
      // console.log("Pushing queued event ", pushEventQueued[i]);
      this.pushEvent(pushEventQueued[i][0], pushEventQueued[i][1]);
    }
    pushEventQueued = [];
  }
}


Hooks.FocusSearchField = {
  mounted() {
    this.el.focus();
    this.el.selectionStart = this.el.selectionEnd = this.el.value.length;
  }
}

let scrollPositionFromPopState: number | null = null;
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
      if (scrollLastPage != window.location.pathname)
        requestAnimationFrame(() => {
          // console.log("scroll", "maybeScrollToTop", scrollLastPage, window.location.pathname)
          this.el.scrollTop = 0
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

    let scrollTimer: ReturnType<typeof setTimeout> | null = null
    this.el.addEventListener("scroll", () => {
      if (scrollTimer) clearTimeout(scrollTimer)
      scrollTimer = setTimeout(() => this.saveScrollPos(), 100)
    }, { passive: true })

    this.maybeRestoreScroll()
  },

  updated() {
    // console.log("scroll", "updated")
    this.maybeRestoreScroll()
  }
}

let csrfToken = document.querySelector("meta[name='csrf-token']")?.getAttribute("content");
let liveSocket = new window.LiveSocket("/live", window.Socket, {
  hooks: Hooks,
  params: {
    _csrf_token: csrfToken
  }
});

// avoid unintentionally breaking archive.org
const hostname = window.location.hostname;
const isArchive = hostname.substring(hostname.length - 11) === "archive.org";
if (!isArchive) window.requestIdleCallback(() => liveSocket.connect())

window.liveSocket = liveSocket;
if (hostname === 'localhost') {
  liveSocket.enableDebug()
  liveSocket.enableLatencySim(50)
}

interface ImpressumDetail {
  text: string;
}

window.addEventListener("phx:impressum", (e) => {
  const customEvent = e as CustomEvent<ImpressumDetail>
  alert(customEvent.detail.text)
})

let loadedScripts: Array<string> = []
let pendingScripts: Record<string, HTMLScriptElement> = {}

interface JSLoadDetail {
  url: string;
  callback: () => void;
}

window.addEventListener("js:load", (e) => {
  const { url, callback } = (e as CustomEvent<JSLoadDetail>).detail;
  if (url in loadedScripts) return callback()
  if (url in pendingScripts) return pendingScripts[url].addEventListener("load", callback)

  const cleanup = () => {
    loadedScripts.push(url)
    delete pendingScripts[url]
  }

  const script = document.createElement("script")
  script.src = url
  script.onload = () => {
    cleanup()
    callback()
  }
  script.onerror = () => {
    cleanup()
    console.error(`Failed to load script: ${url}`)
  }
  document.head.appendChild(script)

  pendingScripts[url] = script
})

import "./mobilegui"
import "./plausible"
