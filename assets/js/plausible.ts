export { };

type payload =
  {
    n: string,
    u: string,
    d: string,
    r: string | null,
    w: number,
    m?: string,
    p?: string,
  }


window.plausible = (eventName, options) => {
  let payload: payload = {
    n: eventName,
    u: window.location.href,
    d: window.location.hostname,
    r: window.document.referrer || null,
    w: window.innerWidth,
  }
  if (options?.meta) payload.m = JSON.stringify(options.meta)
  if (options?.props) payload.p = JSON.stringify(options.props)

  fetch('/plausible/event', {
    method: 'POST',
    headers: { 'Content-Type': 'text/plain' },
    body: JSON.stringify(payload),
    priority: 'low',
  })
}

const interval = 120 * 1000
let lastPage: string
let timer: ReturnType<typeof setInterval>

function page() {
  if (lastPage === window.location.pathname) return;
  lastPage = window.location.pathname
  window.plausible('pageview')
  clearInterval(timer)
  timer = setInterval(() => {
    if (document['hidden']) return
    window.plausible('pageview')
  }, interval)
}

if (window.history.pushState) {
  let originalPushState = window.history.pushState
  window.history.pushState = function () {
    // @ts-ignore no idea how to make strict typescript happy here
    originalPushState.apply(this, arguments)
    page()
  }
  window.addEventListener('popstate', page)
}

window.addEventListener("plausible", e => window.plausible((e as CustomEvent).detail.event))

page()
